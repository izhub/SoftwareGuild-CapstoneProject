/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.blogcapstoneproject.dao;

import com.swcguild.blogcapstoneproject.dto.Post;
import java.util.List;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

/**
 *
 * @author apprentice
 */
public class Functions {
        public List<Post> getBlogPosts(){
        BlogPostDaoInterface dao;
        
        String[] contentArray = post.getPostContent().split(" ");
        String exerpt = "";
        
        int limit = contentArray.length > 50 ? 50:contentArray.length;
        for (int i = 0; i < limit; i++){
            exerpt += contentArray[i] + "";
        }
            exerpt +="...";
            model.addAttribute("content",exerpt);
            return dao.listPosts();
    } 
}
