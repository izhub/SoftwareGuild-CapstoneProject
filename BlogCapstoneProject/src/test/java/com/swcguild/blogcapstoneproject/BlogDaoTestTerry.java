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
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

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
public class BlogDaoTestTerry {

    private BlogPostDaoInterface dao;
    private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public BlogDaoTestTerry() {
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
        cleaner.execute("DELETE FROM terms_posts");
        cleaner.execute("DELETE FROM terms");
        cleaner.execute("DELETE FROM comments");
        cleaner.execute("DELETE FROM posts");

    }

    @After
    public void tearDown() {
    }

    @Test
    public void addGetDeleteComment() {
        //create new post
        Post ps = new Post();
        ps.setPostTitle("The world of coding");
//        ps.setPostCategories("coding");
        ps.setPostUserId(1);
        Calendar postDate = GregorianCalendar.getInstance();
        ps.setPostDate(postDate.getTime());
//        ps.setPostTags("java");
        ps.setPostType("post");
        ps.setPostContent("The world of coding is dark and gloomy");
        ps.setPostCategories("Uncategorized");
        ps.setPostTags("coding, gloomy");

        //add post
        dao.addPost(ps);
        List<String> categories = Arrays.asList(ps.getPostCategories().split(","));
        List<String> tags = Arrays.asList(ps.getPostTags().split(","));
        dao.addTerms(categories, tags);
        dao.addPostToTerms(ps.getPostId(), categories, tags);

        //create new comment
        Comment comment = new Comment();
        comment.setCommentAuthorName("Bill");
        comment.setUserId(2);

        Calendar commentDate = GregorianCalendar.getInstance();
        comment.setCommentDate(commentDate.getTime());

        comment.setCommentContent("what's up with this site?");
        comment.setCommentEmail("bill@bill.com");
        comment.setCommentWebsite("http://www.bill.com");
        comment.setPostId(ps.getPostId());

        //add comment
        dao.addComment(comment);

        //get comment
        Comment fromDb = dao.getComment(comment.getCommentId());
        assertEquals(fromDb.getCommentAuthorName(), comment.getCommentAuthorName());
        assertEquals(fromDb.getCommentContent(), comment.getCommentContent());

        //delete comment where posts still exists
        dao.deleteComment(comment.getCommentId());
        assertNull(dao.getComment(comment.getCommentId()));
    }

    @Test
    public void addGetDeletePost() {
        //create new post
        Post ps = new Post();
        ps.setPostTitle("The world of coding");
//        ps.setPostCategories("coding");
        ps.setPostUserId(1);
        Calendar postDate = GregorianCalendar.getInstance();
        ps.setPostDate(postDate.getTime());

//        ps.setPostTags("java");
        ps.setPostType("post");
        ps.setPostContent("The world of coding is dark and gloomy");
        ps.setPostCategories("Java, Spring");
        ps.setPostTags("coding, dark, gloomy");

        //add post
        dao.addPost(ps);
        List<String> categories = Arrays.asList(ps.getPostCategories().split(","));
        List<String> tags = Arrays.asList(ps.getPostTags().split(","));
        dao.addTerms(categories, tags);
        dao.addPostToTerms(ps.getPostId(), categories, tags);

        //get post
        Post fromDb = dao.getPost(ps.getPostId());

        assertEquals(fromDb.getPostId(), ps.getPostId());
        assertEquals(fromDb.getPostTitle(), ps.getPostTitle());

        //delete post
        dao.deleteTermFromPost(ps.getPostId());
        dao.deletePost(ps.getPostId());
        assertNull(dao.getPost(ps.getPostId()));

    }

    @Test
    public void editPost() {
        Post ps = new Post();
        ps.setPostTitle("The world is round");
        ps.setPostUserId(1);

        Calendar postDate = GregorianCalendar.getInstance();
        ps.setPostDate(postDate.getTime());

        ps.setPostType("page");
        ps.setPostContent("Yes, the world is round");
        ps.setPostCategories("Uncategorized");
        ps.setPostTags("world,round");

        // add post, terms and post to terms
        dao.addPost(ps);
        List<String> categories = Arrays.asList(ps.getPostCategories().split(","));
        List<String> tags = Arrays.asList(ps.getPostTags().split(","));
        dao.addTerms(categories, tags);
        dao.addPostToTerms(ps.getPostId(), categories, tags);

        ps.setPostTitle("The world is square");
        ps.setPostContent("No, the world is square");
        ps.setPostType("post");
        ps.setPostCategories("Wrong stuffs");
        ps.setPostTags("world,square");

        dao.updatePost(ps, ps.getPostId());

        Post fromDb = dao.getPost(ps.getPostId());
        List<String> tagsForPost = dao.getTermsForPost(ps.getPostId(), "tag");
        List<String> categoriesForPost = dao.getTermsForPost(ps.getPostId(), "category");

        assertEquals(fromDb.getPostTitle(), ps.getPostTitle());
        assertEquals(fromDb.getPostContent(), ps.getPostContent());
        assertEquals(fromDb.getPostType(), ps.getPostType());
        assertTrue(tags.containsAll(tagsForPost) && tagsForPost.containsAll(tags));
        assertTrue(categories.containsAll(categoriesForPost) && categoriesForPost.containsAll(categories));
    }
    
    @Test
    public void getTagsCount() {
        Post ps = new Post();
        ps.setPostTitle("The world is round");
        ps.setPostUserId(1);

        Calendar postDate = GregorianCalendar.getInstance();
        ps.setPostDate(postDate.getTime());

        ps.setPostType("page");
        ps.setPostContent("Yes, the world is round");
        ps.setPostCategories("Uncategorized");
        ps.setPostTags("world,round");

        // add post, terms and post to terms
        dao.addPost(ps);
        List<String> categories = Arrays.asList(ps.getPostCategories().split(","));
        List<String> tags = Arrays.asList(ps.getPostTags().split(","));
        dao.addTerms(categories, tags);
        dao.addPostToTerms(ps.getPostId(), categories, tags);
        
        Post ps2 = new Post();
        ps2.setPostTitle("The world is square");
        ps2.setPostUserId(1);

        ps2.setPostDate(postDate.getTime());

        ps2.setPostType("page");
        ps2.setPostContent("No, the world is square");
        ps2.setPostCategories("Uncategorized,Square World");
        ps2.setPostTags("world,square");

        // add post, terms and post to terms
        dao.addPost(ps2);
        categories = Arrays.asList(ps2.getPostCategories().split(","));
        tags = Arrays.asList(ps2.getPostTags().split(","));
        dao.addTerms(categories, tags);
        dao.addPostToTerms(ps2.getPostId(), categories, tags);
        
        List<Map<String, Object>> tagsCount = dao.getAllTagsAndCount();
        List<String> allCategories = dao.getAllTerms("category");
        
        
    }

//    @Test
//    public void updateComment() {
//
//    }
//
//    @Test
//    public void updatePost() {
//        Post ps = dao.getPost(48);
//        ps.setPostTitle("NOOO WAAYYY");
//        dao.updatePost(ps, ps.getPostId());
//        assertEquals("NOOO WAAYYY", dao.getPost(48).getPostTitle());
//
//    }
//     TODO add test methods here.
//    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
