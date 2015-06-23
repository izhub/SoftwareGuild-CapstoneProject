/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.blogcapstoneproject.dao;

import com.swcguild.blogcapstoneproject.dto.Comment;
import com.swcguild.blogcapstoneproject.dto.Post;
import java.util.List;

/**
 *
 * @author apprentice
 */
public interface BlogPostDaoInterface {
    
    public void addPost(Post post);
    public void deletePost(int postId);
    public void updatePost(Post post, int postId);
    public Post getPost(int postId);
    public List<Post> listPosts();
    public List<Post> listPages();
    public List<Post> listPostsForIndex();
    
    public void addComment(Comment comment);
    public void deleteComment(int commentId);
    public Comment getComment(int commentId);
    public List<Comment> listCommentsForPost(int postId);
}
