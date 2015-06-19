/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.blogcapstoneproject.dto;

import java.util.Date;
import java.util.Objects;

/**
 *
 * @author apprentice
 */
public class Post {
    private int postId;
    private int postUserId;
    private String postType;
    private String postTitle;
    private String postContent;
    private Date postDate;
    private String postTags;
    private String postCategories;

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getPostUserId() {
        return postUserId;
    }

    public void setPostUserId(int postUserId) {
        this.postUserId = postUserId;
    }

    public String getPostType() {
        return postType;
    }

    public void setPostType(String postType) {
        this.postType = postType;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public String getPostTags() {
        return postTags;
    }

    public void setPostTags(String postTags) {
        this.postTags = postTags;
    }

    public String getPostCategories() {
        return postCategories;
    }

    public void setPostCategories(String postCategories) {
        this.postCategories = postCategories;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 23 * hash + this.postId;
        hash = 23 * hash + this.postUserId;
        hash = 23 * hash + Objects.hashCode(this.postType);
        hash = 23 * hash + Objects.hashCode(this.postTitle);
        hash = 23 * hash + Objects.hashCode(this.postContent);
        hash = 23 * hash + Objects.hashCode(this.postDate);
        hash = 23 * hash + Objects.hashCode(this.postTags);
        hash = 23 * hash + Objects.hashCode(this.postCategories);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Post other = (Post) obj;
        if (this.postId != other.postId) {
            return false;
        }
        if (this.postUserId != other.postUserId) {
            return false;
        }
        if (!Objects.equals(this.postType, other.postType)) {
            return false;
        }
        if (!Objects.equals(this.postTitle, other.postTitle)) {
            return false;
        }
        if (!Objects.equals(this.postContent, other.postContent)) {
            return false;
        }
        if (!Objects.equals(this.postDate, other.postDate)) {
            return false;
        }
        if (!Objects.equals(this.postTags, other.postTags)) {
            return false;
        }
        if (!Objects.equals(this.postCategories, other.postCategories)) {
            return false;
        }
        return true;
    }
}
