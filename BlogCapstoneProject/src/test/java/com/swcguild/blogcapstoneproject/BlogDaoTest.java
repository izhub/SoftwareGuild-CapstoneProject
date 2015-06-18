/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.blogcapstoneproject;

import com.swcguild.blogcapstoneproject.dao.BlogDao;
import com.swcguild.blogcapstoneproject.dto.Comment;
import com.swcguild.blogcapstoneproject.dto.Post;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.jdbc.core.JdbcTemplate;

/**
 *
 * @author apprentice
 */
public class BlogDaoTest {

    private BlogDao dao;

    public BlogDaoTest() {
    }

    @BeforeClass
    public static void setUpClass() {
    }

    @AfterClass
    public static void tearDownClass() {
    }

    @Before
    public void setUp() {
        // NEW CODE START, CLEANS UP DB TABLE BEFORE EACH TEST

        //Ask spring for my Dao
        ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
        dao = (BlogDao) ctx.getBean("blogSiteDao");

        //Grab JdbcTemplate to use for cleaning up
        JdbcTemplate cleaner = (JdbcTemplate) ctx.getBean("jdbcTemplate");
    }

    @After
    public void tearDown() {
    }

    @Test
    public void addGetDeleteComment() {
        //create new post
         Post ps = new Post();
        ps.setPostTitle("The world of coding");
        ps.setPostCategories("coding");
        ps.setPostDate("06/25/2015");
        ps.setPostTags("java");
        ps.setPostType("post");
        ps.setPostContent("The world of coding is dark and gloomy");

        //add post
        dao.addPost(ps);
        
        //create new comment
        Comment comment = new Comment();
        comment.setCommentAuthorName("Bill");
        comment.setCommentDate("06/05/2015");
        comment.setCommentContent("what's up with this site?");

        //add comment
        dao.addComment(comment, ps.getPostId());

        //get comment
        Comment fromDb = dao.getComment(comment.getCommentId());
//        assertEquals(fromDb.getCommentAuthorName(),comment.getCommentAuthorName());
//        assertEquals(fromDb.getCommentDate(), comment.getCommentDate());
//        assertEquals(fromDb.getCommentContent(), comment.getCommentContent());
        
        //delete comment
        dao.deleteComment(comment.getCommentId());
//        assertNull(dao.getComment(comment.getCommentId()));
    }

    @Test
    public void addGetDeletePost() {
        //create new post
        Post ps = new Post();
        ps.setPostTitle("The world of coding");
        ps.setPostCategories("coding");
        ps.setPostDate("06/25/2015");
        ps.setPostTags("java");
        ps.setPostType("post");
        ps.setPostContent("The world of coding is dark and gloomy");

        //add post
        dao.addPost(ps);

        //get post
        Post fromDb = dao.getPost(ps.getPostId());
//        assertEquals(fromDb.getPostDate(), ps.getPostDate());
//        assertEquals(fromDb.getPostId(), ps.getPostId());
//        assertEquals(fromDb.getPostTitle(), ps.getPostTitle());

        //delete post
        dao.deletePost(ps.getPostId());
//        assertNull(dao.getPost(ps.getPostId()));

    }

    @Test
    public void updateComment() {

    }

    @Test
    public void updatePost() {

    }

    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
