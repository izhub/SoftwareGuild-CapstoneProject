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
public class Comment {
    private int commentId;
    private String postTitle;
    private int postId;
    private int userId;
    private String commentWebsite;
    private String commentStatus;
    private String commentEmail;
    private String commentContent;
    private String commentAuthorName;
    private Date commentDate;

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 67 * hash + this.commentId;
        hash = 67 * hash + Objects.hashCode(this.postTitle);
        hash = 67 * hash + this.postId;
        hash = 67 * hash + this.userId;
        hash = 67 * hash + Objects.hashCode(this.commentWebsite);
        hash = 67 * hash + Objects.hashCode(this.commentStatus);
        hash = 67 * hash + Objects.hashCode(this.commentEmail);
        hash = 67 * hash + Objects.hashCode(this.commentContent);
        hash = 67 * hash + Objects.hashCode(this.commentAuthorName);
        hash = 67 * hash + Objects.hashCode(this.commentDate);
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
        final Comment other = (Comment) obj;
        if (this.commentId != other.commentId) {
            return false;
        }
        if (!Objects.equals(this.postTitle, other.postTitle)) {
            return false;
        }
        if (this.postId != other.postId) {
            return false;
        }
        if (this.userId != other.userId) {
            return false;
        }
        if (!Objects.equals(this.commentWebsite, other.commentWebsite)) {
            return false;
        }
        if (!Objects.equals(this.commentStatus, other.commentStatus)) {
            return false;
        }
        if (!Objects.equals(this.commentEmail, other.commentEmail)) {
            return false;
        }
        if (!Objects.equals(this.commentContent, other.commentContent)) {
            return false;
        }
        if (!Objects.equals(this.commentAuthorName, other.commentAuthorName)) {
            return false;
        }
        if (!Objects.equals(this.commentDate, other.commentDate)) {
            return false;
        }
        return true;
    }

    
    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getCommentWebsite() {
        return commentWebsite;
    }

    public void setCommentWebsite(String commentWebsite) {
        this.commentWebsite = commentWebsite;
    }

    public String getCommentStatus() {
        return commentStatus;
    }

    public void setCommentStatus(String commentStatus) {
        this.commentStatus = commentStatus;
    }

    public String getCommentEmail() {
        return commentEmail;
    }

    public void setCommentEmail(String commentEmail) {
        this.commentEmail = commentEmail;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getCommentAuthorName() {
        return commentAuthorName;
    }

    public void setCommentAuthorName(String commentAuthorName) {
        this.commentAuthorName = commentAuthorName;
    }

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    
   
    
    
    
}