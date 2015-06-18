/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.blogcapstoneproject.dao;

import com.swcguild.blogcapstoneproject.dto.Comment;
import com.swcguild.blogcapstoneproject.dto.Post;
import java.util.List;
import java.util.Map;

/**
 *
 * @author apprentice
 */
public interface BlogPostDaoInterface {
    
    public void addPost(Post post);
    public void deletePost(int postId);
    public Post getPost(int postId);
    public Map<String, Post> listPosts();
    
    public void addComment(Comment comment, int postID);
    public void deleteComment(int commentId);
    public Comment getComment(int commentId);
    public List<Comment> listCommentsForPost(int postId);
    
}
