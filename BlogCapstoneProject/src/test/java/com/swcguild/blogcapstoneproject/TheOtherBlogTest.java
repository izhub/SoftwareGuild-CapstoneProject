///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package com.swcguild.blogcapstoneproject;
//
//import com.swcguild.blogcapstoneproject.dao.BlogPostDaoInterface;
//import com.swcguild.blogcapstoneproject.dto.Comment;
//import com.swcguild.blogcapstoneproject.dto.Post;
//import java.text.SimpleDateFormat;
//import java.util.ArrayList;
//import java.util.Calendar;
//import java.util.Date;
//import java.util.GregorianCalendar;
//import java.util.List;
//
//import org.junit.After;
//import org.junit.AfterClass;
//import org.junit.Before;
//import org.junit.BeforeClass;
//import org.junit.Test;
//import static org.junit.Assert.*;
//import org.springframework.context.ApplicationContext;
//import org.springframework.context.support.ClassPathXmlApplicationContext;
//import org.springframework.jdbc.core.JdbcTemplate;
//
///**
// *
// * @author apprentice
// */
//public class TheOtherBlogTest {
//
//    private BlogPostDaoInterface dao;
//    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//    JdbcTemplate cleaner;
//    Comment comment;
//    Comment comment2;
//    Comment comment3;
//
//    public TheOtherBlogTest() {
//    }
//
//    @BeforeClass
//    public static void setUpClass() {
//    }
//
//    @AfterClass
//    public static void tearDownClass() {
//    }
//
//    @Before
//    public void setUp() {
//        // NEW CODE START, CLEANS UP DB TABLE BEFORE EACH TEST
//        //Ask spring for my Dao
//        ApplicationContext ctx = new ClassPathXmlApplicationContext("test-applicationContext.xml");
//        dao = (BlogPostDaoInterface) ctx.getBean("blogSiteDao");
//        
//        //Grab JdbcTemplate to use for cleaning up
//        cleaner = (JdbcTemplate) ctx.getBean("jdbcTemplate");
//        cleaner.execute("delete from comments");
//        
//        comment = new Comment();
//        Date date = new Date();
//        comment.setCommentDate(date);
//        comment.setUserId(1);
//        comment.setCommentAuthorName("Fred");
//        comment.setCommentEmail("fred@swcg.com");
//        comment.setCommentWebsite("www.www.com");
//        comment.setPostTitle("Java");
//        comment.setCommentContent("what's up with this site?");
//        comment.setPostId(213);
//        
//        comment2 = new Comment();
//        Date date2 = new Date();
//        comment2.setCommentDate(date);
//        comment2.setUserId(1);
//        comment2.setCommentAuthorName("Eddie");
//        comment2.setCommentEmail("eddie@swcg.com");
//        comment2.setCommentWebsite("www.eddie.com");
//        comment2.setPostTitle(".NET");
//        comment2.setCommentContent("hey hey hey!?");
//        comment2.setPostId(213);
//        
//        comment3 = new Comment();
//        Date date3 = new Date();
//        comment3.setCommentDate(date);
//        comment3.setUserId(1);
//        comment3.setCommentAuthorName("Bill");
//        comment3.setCommentEmail("bill@swcg.com");
//        comment3.setCommentWebsite("www.bill.com");
//        comment3.setPostTitle("Java");
//        comment3.setCommentContent("No you didn't just say that, son.");
//        comment3.setPostId(213);
//        
//        
//        
//    }
//
//    @After
//    public void tearDown() {
//    }
//
//    @Test
//    public void addGetDeleteComment() {
//        //add comment
//        Comment newComment = dao.addComment(comment);
//        dao.addComment(comment3);
//        dao.addComment(comment2);
//        
//        //get comment
//        Comment fromDb = dao.getComment(newComment.getCommentId());
//        assertEquals(fromDb.getCommentAuthorName(), comment.getCommentAuthorName());
//        assertEquals(fromDb.getCommentContent(), comment.getCommentContent());
//
//        //delete comment
//        dao.deleteComment(fromDb.getCommentId());
//        assertNull(dao.getComment(fromDb.getCommentId()));
//    }
//    
//    @Test
//    public void deleteCommentsForPost() {
//        Comment comment1 = dao.addComment(comment);
//        dao.addComment(comment2);
//        dao.deleteCommentsForPost(comment1.getPostId());
//        assertNull(dao.getComment(1));
//    }
//    
//    @Test 
//    public void listAllCommentsAndCommentsForPost() {
//     dao.addComment(comment);
//     dao.addComment(comment2);
//     dao.addComment(comment3);
//     List<Comment> comments = dao.listAllComments();
//     assertEquals(3, comments.size());
//     assertEquals(3, dao.listCommentsForPost(213).size());
//    }
//    
//    @Test
//    public void updateCommentTest() {
//     Comment comment1 = dao.addComment(comment);
//     dao.addComment(comment2);
//     dao.addComment(comment3);
//     
//     comment1.setCommentStatus("approved");
//     dao.updateComment(comment1);
//     Comment comment4 = dao.getComment(comment1.getCommentId());
//     assertEquals("approved", comment4.getCommentStatus());
//    }
//
//    @Test
//    public void addGetDeletePost() {
//        //create new post
//        Post ps = new Post();
//        ps.setPostTitle("The world of coding");
////      ps.setPostCategories("coding");
//        ps.setPostUserId(1);
//        Calendar postDate = GregorianCalendar.getInstance();
//        ps.setPostDate(postDate.getTime());
//
////      ps.setPostTags("java");
//        ps.setPostType("post");
//        ps.setPostContent("The world of coding is dark and gloomy");
//
//        //add post
//        dao.addPost(ps);
//
//        //get post
//        Post fromDb = dao.getPost(ps.getPostId());
//
//        assertEquals(fromDb.getPostId(), ps.getPostId());
//        assertEquals(fromDb.getPostTitle(), ps.getPostTitle());
//
//        //delete post
//        dao.deletePost(ps.getPostId());
//        assertNull(dao.getPost(ps.getPostId()));
//
//    }
//
////    @Test
////    public void updateComment() {
////
////    }
////
//    @Test
//    public void updatePost() {
//        Post ps = dao.getPost(213);
//        ps.setPostTitle("NOOO WAAYYY");
//        dao.updatePost(ps, ps.getPostId());
//        assertEquals("NOOO WAAYYY", dao.getPost(213).getPostTitle());
//
//    }
//}
