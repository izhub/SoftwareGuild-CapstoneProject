/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.blogcapstoneproject.controller;

import com.octo.captcha.service.image.ImageCaptchaService;
import com.swcguild.blogcapstoneproject.dao.BlogPostDaoInterface;
import com.swcguild.blogcapstoneproject.dto.Post;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import javax.imageio.ImageIO;
import javax.inject.Inject;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
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
        model.addAttribute("categoryList", dao.getAllTerms("category"));
        return "addNewPost";
    }

    @RequestMapping(value = "adminPageView", method = RequestMethod.GET)
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

    @RequestMapping(value = "displayEditView/{id}", method = RequestMethod.GET)
    @ResponseStatus(HttpStatus.OK)
    public String displayEditView(@PathVariable int id, Model model) {
        Post post = dao.getPost(id);
        model.addAttribute("post", post);
        model.addAttribute("categoryList", post.getPostCategories());
        model.addAttribute("tagList", post.getPostTags());

        return "editView";
    }

    @RequestMapping(value = "post/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.OK)
    public void deletePost(@PathVariable int id) {
        dao.deletePost(id);
    }

    @RequestMapping(value = "page/{id}", method = RequestMethod.DELETE)
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

    @RequestMapping(value = "displayEditView/post/{id}", method = RequestMethod.PUT)
    @ResponseStatus(HttpStatus.CREATED)
    public void updatePost(@RequestBody Post post) {
        dao.updatePost(post, post.getPostId());
        dao.deleteTermFromPost(post.getPostId());
        List<String> categories = Arrays.asList(post.getPostCategories().split(","));
        List<String> tags = Arrays.asList(post.getPostTags().split(","));

        if (categories.isEmpty()) {
            categories.add("uncategorized");
        }

        dao.addTerms(categories, tags);
        dao.addPostToTerms(post.getPostId(), categories, tags);

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
            List<String> categories = Arrays.asList(post.getPostCategories().split(","));
            List<String> tags = Arrays.asList(post.getPostTags().split(","));

            if (categories.isEmpty()) {
                categories.add("uncategorized");
            }

            dao.addTerms(categories, tags);
            dao.deleteUnusedTags();
            dao.addPostToTerms(post.getPostId(), categories, tags);
        }
    }

    private static ImageCaptchaService instance;

    @RequestMapping(value = "captcha", method = RequestMethod.GET)
    public void showCaptcha(HttpServletRequest req, HttpServletResponse res) throws IOException {
        ApplicationContext ctx = new ClassPathXmlApplicationContext("jcaptcha.xml");
        instance = ctx.getBean("captchaService", ImageCaptchaService.class);

        byte[] captchaChallengeAsJpeg = null;

        ByteArrayOutputStream jpegOutputStream = new ByteArrayOutputStream();

        String captchaId = req.getSession().getId();
        BufferedImage challenge = instance.getImageChallengeForID(captchaId, req.getLocale());

        ImageIO.write(challenge, "png", jpegOutputStream);

        captchaChallengeAsJpeg = jpegOutputStream.toByteArray();

        res.setHeader("Cache-Control", "no-store");
        res.setHeader("Pragma", "no-cache");
        res.setDateHeader("Expires", 0);
        res.setContentType("image/png");

        ServletOutputStream responseOutputStream = res.getOutputStream();
        responseOutputStream.write(captchaChallengeAsJpeg);
        responseOutputStream.flush();
        responseOutputStream.close();

    }
}
