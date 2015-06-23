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
import javax.servlet.http.HttpServletRequest;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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

    @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String homePage(Model model) {
        model.addAttribute("blogList", dao.listPostsForIndex());
        return "index";
    }

    @RequestMapping(value = "login", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayLogin() {
        return "login";
    }

    @RequestMapping(value = {"adminPortal", "adminBlogView"}, method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayAdminPostView() {
        return "adminBlogView";
    }

    @RequestMapping(value = "addNewPost", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayAddNewPost(Model model) {
        model.addAttribute("postType", "blog");
        return "addNewPost";
    }
    
    @RequestMapping(value="adminPageView", method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayAdminPageView() {
        return "adminPageView";
    }

    @RequestMapping(value = "addNewPage", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayAddNewPage(Model model) {
        model.addAttribute("postType", "page");
        return "addNewPost";
    }
    
    @RequestMapping(value="displayEditView/{id}", method=RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayEditView(@PathVariable int id, Model model) {
        model.addAttribute("post", dao.getPost(id));
        return "editView";
    }
    
//    @RequestMapping(value="displaEditPost", method=RequestMethod.GET)
//    @ResponseStatus(HttpStatus.OK)
//    public String displayEditPostView(Model model) {
//        model.addAttribute("postType", "page")
//    }

    @RequestMapping(value = "post/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public void deletePost(@PathVariable int id) {
        dao.deletePost(id);
    }
    
    @RequestMapping(value="page/{id}", method= RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public void deletePage(@PathVariable int id) {
        dao.deletePost(id);
    }
    
    @RequestMapping(value = "posts", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public List<Post> getBlogPosts() {
        return dao.listPosts();
    }

    @RequestMapping(value = "pages", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    @ResponseBody
    public List<Post> getStaticPages() {
        return dao.listPages();
    }
    
    @RequestMapping(value="displayEditView/post/{id}", method=RequestMethod.PUT)
    @ResponseStatus(HttpStatus.CREATED)
    public void updatePost(@RequestBody Post post) {
        dao.updatePost(post, post.getPostId());
    }

    @RequestMapping(value = "post/{id}", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayPostPage(@PathVariable int id, Model model) {
        model.addAttribute("post", dao.getPost(id));
        return "staticPage";
    }

    @RequestMapping(value = "post", method = RequestMethod.POST)
    @ResponseStatus(HttpStatus.CREATED)
    public void addBlogPost(@RequestBody Post post) {
        if (post != null) {
            Date date = new Date();
            // we need to get the user that is currently posting
            post.setPostUserId(2);
            post.setPostDate(date);
            dao.addPost(post);
        }
    }
}
