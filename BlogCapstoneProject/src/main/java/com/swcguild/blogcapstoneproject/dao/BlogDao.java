/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.blogcapstoneproject.dao;

import com.swcguild.blogcapstoneproject.dto.Comment;
import com.swcguild.blogcapstoneproject.dto.Post;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.simple.ParameterizedRowMapper;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author apprentice
 */
public class BlogDao implements BlogPostDaoInterface {

    private final String SQL_INSERT_POST = "INSERT INTO posts (post_user_id, post_type, post_title, post_content, post_date) "
            + "VALUES (?, ?, ?, ?, ?)";

    private final String SQL_UPDATE_POST = "UPDATE posts SET post_type = ?, post_title = ?, post_content=? WHERE post_id = ?";

    private final String SQL_DELETE_POST = "DELETE FROM posts WHERE post_id = ?";

    private final String SQL_SELECT_POST = "SELECT * FROM posts WHERE post_id = ?";

    private final String SQL_LIST_BLOG_POSTS = "SELECT * FROM posts WHERE post_type LIKE 'blog'";

    private final String SQL_INSERT_COMMENT = "INSERT INTO comments (post_id, user_id, comment_author_name, comment_author_email, comment_content, comment_date, comment_author_website) "
            + "VALUES (?, ?, ?, ?, ?, ?, ?)";
    
    private final String SQL_UPDATE_COMMENT = "UPDATE comments SET comment_status = ? WHERE comment_id = ?";

    private final String SQL_DELETE_COMMENT = "DELETE FROM comments WHERE comment_id = ?";
    
    private final String SQL_DELETE_COMMENTS_FOR_POST = "DELETE FROM comments WHERE post_id = ?";
    
    private final String SQL_SELECT_COMMENT = "SELECT * FROM comments WHERE comment_id = ?";

    private final String SQL_LIST_COMMENTS_BY_POST_ID = "SELECT * FROM comments WHERE post_id = ?";

    private final String SQL_LIST_STATIC_PAGES = "SELECT * FROM posts WHERE post_type LIKE 'page'";
    
    private final String SQL_LIST_ALL_COMMENTS = "SELECT * FROM comments";

    //2a: Declare JdbcTemplate Reference - the instance will be handed to us by Spring
    private JdbcTemplate jdbcTemplate;

    //2b: use Setter Injection to direct Spring to hand us an isntance of JdbcTemplate
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

   @Override
   public void deleteCommentsForPost(int postId) {
       jdbcTemplate.update(SQL_DELETE_COMMENTS_FOR_POST, postId);
   }

    @Override
    public void deletePost(int postId) {
        deleteCommentsForPost(postId);
        jdbcTemplate.update(SQL_DELETE_POST, postId);
    }

    @Override
    public void updatePost(Post post, int postId) {
        jdbcTemplate.update(SQL_UPDATE_POST, post.getPostType(), post.getPostTitle(), post.getPostContent(), postId);
    }

    @Override
    public Post getPost(int postId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_POST, new PostMapper(), postId);

        } catch (EmptyResultDataAccessException e) {
            return null;
        }

    }

    @Override
    public List<Post> listPosts() {
        return jdbcTemplate.query(SQL_LIST_BLOG_POSTS, new PostMapper());
    }

//     limit to 5 posts per page?
    @Override
    public List<Post> listPostsForIndex() {
        List<Post> posts = jdbcTemplate.query(SQL_LIST_BLOG_POSTS, new PostMapper());

        for (Post post : posts) {
            String[] contentArray = post.getPostContent().split(" ");
            String exerpt = "";
            int limit = contentArray.length > 50 ? 50 : contentArray.length;

            for (int i = 0; i < limit; i++) {
                exerpt += contentArray[i] + " ";
            }
            exerpt += "...";
            post.setPostContent(exerpt);
        }
        return posts;
    }

    @Override
    public List<Post> listPages() {
        return jdbcTemplate.query(SQL_LIST_STATIC_PAGES, new PostMapper());
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public Comment addComment(Comment comment) {
        jdbcTemplate.update(SQL_INSERT_COMMENT,
                comment.getPostId(),
                comment.getUserId(),
                comment.getCommentAuthorName(),
                comment.getCommentEmail(),
                comment.getCommentContent(),
                comment.getCommentDate(),
                comment.getCommentWebsite()
        );
        comment.setCommentId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));
        return comment;
    }

    @Override
    public void deleteComment(int commentId) {
        jdbcTemplate.update(SQL_DELETE_COMMENT, commentId);
    }

    @Override
    public Comment getComment(int commentId) {
        try {
            return jdbcTemplate.queryForObject(SQL_SELECT_COMMENT, new CommentMapper(), commentId);
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }

    @Override
    public List<Comment> listCommentsForPost(int postId) {
        return jdbcTemplate.query(SQL_LIST_COMMENTS_BY_POST_ID, new CommentMapper(), postId);
    }
    
    @Override
    public void updateComment(Comment comment) {
        jdbcTemplate.update(SQL_UPDATE_COMMENT, comment.getCommentStatus(), comment.getCommentId());
    }

    @Override
    public List<Comment> listAllComments() {
       return jdbcTemplate.query(SQL_LIST_ALL_COMMENTS, new CommentMapper());
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addPost(Post post) {
        jdbcTemplate.update(SQL_INSERT_POST,
                post.getPostUserId(),
                post.getPostType(),
                post.getPostTitle(),
                post.getPostContent(),
                post.getPostDate()
        );

        post.setPostId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));
    
    }

    private class CommentMapper implements ParameterizedRowMapper<Comment> {
        @Override
        public Comment mapRow(ResultSet rs, int i) throws SQLException {
            Timestamp commentDate = rs.getTimestamp("comment_date");
            Comment comment = new Comment();
            comment.setCommentId(rs.getInt("comment_id"));
            comment.setPostId(rs.getInt("post_id"));
            Post post = getPost(comment.getPostId());
            comment.setPostTitle(post.getPostTitle());
            comment.setUserId(rs.getInt("user_id"));
            comment.setCommentAuthorName(rs.getString("comment_author_name"));
            comment.setCommentEmail(rs.getString("comment_author_email"));
            comment.setCommentWebsite(rs.getString("comment_author_website"));
            comment.setCommentContent(rs.getString("comment_content"));
            comment.setCommentStatus(rs.getString("comment_status"));
            comment.setCommentDate(commentDate);
            return comment;
        }
    }
    
    private class PostMapper implements ParameterizedRowMapper<Post> {
        @Override
        public Post mapRow(ResultSet rs, int i) throws SQLException {
            Timestamp postDate = rs.getTimestamp("post_date");
            Post post = new Post();
            post.setPostId(rs.getInt("post_id"));
            post.setPostUserId(rs.getInt("post_user_id"));
            post.setPostType(rs.getString("post_type"));
            post.setPostTitle(rs.getString("post_title"));
            post.setPostContent(rs.getString("post_content"));
            post.setPostDate(postDate);
            post.setPostCategories(new ArrayList());
            post.setPostTags(new ArrayList());
            return post;
        }
    }
}
