/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.blogcapstoneproject.controller;

import com.swcguild.blogcapstoneproject.dao.BlogPostDaoInterface;
import com.swcguild.blogcapstoneproject.dto.Post;
import java.util.Date;
import java.util.List;
import javax.inject.Inject;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 *
 * @author apprentice
 */
@Controller
public class BlogController {
    
    BlogPostDaoInterface dao;
    
    @Inject
    public BlogController(BlogPostDaoInterface dao) {
        this.dao = dao;
        
    }
    
    @RequestMapping(value={"/", "/index"}, method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String homePage() {
        return "index";
    }
    
     
    @RequestMapping(value="login", method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayLogin() {
        return "login";
    }
    
    @RequestMapping(value="adminPortal", method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayAdminPortal() {
        return "adminPage";
    }
    
    @RequestMapping(value="addNew", method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayAddNew() {
        return "addNewPost";
    }
    
    @RequestMapping(value="post/{id}", method=RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public void deletePost(@PathVariable int id) {
        dao.deletePost(id);
    }
    
    @RequestMapping(value="posts", method=RequestMethod.GET) 
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public List<Post> getBlogPosts() {
        return dao.listPosts();
    }
    
    @RequestMapping(value="post", method=RequestMethod.POST) 
    @ResponseStatus(HttpStatus.CREATED)
    public void addBlogPost(@RequestBody Post post) {
        if (post!=null) {
            Date date = new Date();
            post.setPostUserId(2);
            post.setPostType("blog");
            post.setPostDate(date);
            dao.addPost(post);
        }
    }
    
    
    
    
}
