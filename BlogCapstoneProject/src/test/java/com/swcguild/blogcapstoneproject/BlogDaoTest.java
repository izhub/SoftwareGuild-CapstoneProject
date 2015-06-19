/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.blogcapstoneproject;

import com.swcguild.blogcapstoneproject.dao.BlogPostDaoInterface;
import com.swcguild.blogcapstoneproject.dto.Comment;
import com.swcguild.blogcapstoneproject.dto.Post;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.GregorianCalendar;

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

    private BlogPostDaoInterface dao;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

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
        dao = (BlogPostDaoInterface) ctx.getBean("blogSiteDao");

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

        Calendar postDate = GregorianCalendar.getInstance();
        ps.setPostDate(postDate.getTime());

        ps.setPostTags("java");
        ps.setPostType("post");
        ps.setPostContent("The world of coding is dark and gloomy");

        //add post
        dao.addPost(ps);

        //create new comment
        Comment comment = new Comment();
        comment.setCommentAuthorName("Bill");
        
        Calendar commentDate = GregorianCalendar.getInstance();
        comment.setCommentDate(commentDate.getTime());
        
        comment.setCommentContent("what's up with this site?");
        comment.setPostId(ps.getPostId());

        //add comment
        dao.addComment(comment);

        //get comment
        Comment fromDb = dao.getComment(comment.getCommentId());
        assertEquals(fromDb.getCommentAuthorName(), comment.getCommentAuthorName());
        assertEquals(fromDb.getCommentContent(), comment.getCommentContent());

        //delete comment
        dao.deleteComment(comment.getCommentId());
        assertNull(dao.getComment(comment.getCommentId()));
    }

    @Test
    public void addGetDeletePost() {
        //create new post
        Post ps = new Post();
        ps.setPostTitle("The world of coding");
        ps.setPostCategories("coding");

        Calendar postDate = GregorianCalendar.getInstance();
        ps.setPostDate(postDate.getTime());

        ps.setPostTags("java");
        ps.setPostType("post");
        ps.setPostContent("The world of coding is dark and gloomy");

        //add post
        dao.addPost(ps);

        //get post
        Post fromDb = dao.getPost(ps.getPostId());

        assertEquals(fromDb.getPostId(), ps.getPostId());
        assertEquals(fromDb.getPostTitle(), ps.getPostTitle());

        //delete post
        dao.deletePost(ps.getPostId());
        assertNull(dao.getPost(ps.getPostId()));

    }

//    @Test
//    public void updateComment() {
//
//    }
//
//    @Test
//    public void updatePost() {
//
//    }
    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
