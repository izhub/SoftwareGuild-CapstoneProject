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
    public void updatePost(Post post, int postId);
    public Post getPost(int postId);
    public List<Post> listPosts();
    public List<Post> listPostsAdminPortal(String userRole);
    public List<Post> listPages();
    public List<Post> listPagesAdminPortal(String userRole);
    public List<Post> listPostsForIndex(int offset);
    public int countPublishedPosts();
    public List<Post> listRecentPosts();
    public List<Post> listPostsByTerm(String termName); 
    
    
    public void deleteCommentsForPost(int postId);
    public Comment addComment(Comment comment);
    public void deleteComment(int commentId);
    public Comment getComment(int commentId);
    public void updateComment(Comment comment);
    public List<Comment> listCommentsForPost(int postId);
    public List<Comment> listAllComments();
    
    public List<Map<String, Object>> getAllTagsAndCount();
    public List<String> getAllTerms(String termType);
    public void addTerms(List<String> categories, List<String> tags);
    public void addPostToTerms(int postId, List<String> categories, List<String> tags);
    public List<String> getTermsForPost(int postId, String termType);
    public void deleteTermFromPost(int postId);
    public void deleteUnusedTags();
    public List<String> getTermsByType(String type);
    
    public int getUserId(String userName);
}
