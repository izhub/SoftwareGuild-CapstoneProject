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

    private final String SQL_DELETE_POST = "DELETE FROM posts WHERE post_id = ?";

    private final String SQL_SELECT_POST = "SELECT * FROM posts WHERE post_id = ?";

    private final String SQL_LIST_ALL_POSTS = "SELECT * FROM posts";

    private final String SQL_INSERT_COMMENT = "INSERT INTO comments (post_id, user_id, comment_author_name, comment_content, comment_date) "
            + "VALUES (?, ?, ?, ?, ?)";

    private final String SQL_DELETE_COMMENT = "DELETE FROM comments WHERE comment_id = ?";

    private final String SQL_SELECT_COMMENT = "SELECT * FROM comments WHERE comment_id = ?";

    private final String SQL_LIST_COMMENTS_BY_POST_ID = "SELECT * FROM comments WHERE post_id = ?";

    //2a: Declare JdbcTemplate Reference - the instance will be handed to us by Spring
    private JdbcTemplate jdbcTemplate;

    //2b: use Setter Injection to direct Spring to hand us an isntance of JdbcTemplate
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
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

    @Override
    public void deletePost(int postId) {
        jdbcTemplate.update(SQL_DELETE_POST, postId);
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
        return jdbcTemplate.query(SQL_LIST_ALL_POSTS, new PostMapper());
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, readOnly = false)
    public void addComment(Comment comment) {
        jdbcTemplate.update(SQL_INSERT_COMMENT,
                comment.getPostId(),
                comment.getUserId(),
                comment.getCommentAuthorName(),
                comment.getCommentContent(),
                comment.getCommentDate()
        );

        comment.setCommentId(jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class));
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

    private class CommentMapper implements ParameterizedRowMapper<Comment> {

        @Override
        public Comment mapRow(ResultSet rs, int i) throws SQLException {
            Timestamp commentDate = rs.getTimestamp("comment_date");

            Comment comment = new Comment();
            comment.setCommentId(rs.getInt("comment_id"));
            comment.setPostId(rs.getInt("post_id"));
            comment.setUserId(rs.getInt("user_id"));
            comment.setCommentAuthorName(rs.getString("comment_author_name"));
            comment.setCommentContent(rs.getString("comment_content"));
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
            post.setPostCategories("categories");
            post.setPostTags("tags");

            return post;
        }

    }

}
