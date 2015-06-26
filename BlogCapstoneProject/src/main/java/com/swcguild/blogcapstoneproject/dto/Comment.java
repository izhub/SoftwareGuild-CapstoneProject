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
    private int postId;
    private int userId;
    private String commentContent;
    private String commentAuthorName;
    private String commentAuthorEmail;
    private String commentAuthorWebsite;
    private Date commentDate;

    public Date getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(Date commentDate) {
        this.commentDate = commentDate;
    }

    public int getCommentId() {
        return commentId;
    }

    public void setCommentId(int commentId) {
        this.commentId = commentId;
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

    public String getCommentAuthorEmail() {
        return commentAuthorEmail;
    }

    public void setCommentAuthorEmail(String commentAuthorEmail) {
        this.commentAuthorEmail = commentAuthorEmail;
    }

    public String getCommentAuthorWebsite() {
        return commentAuthorWebsite;
    }

    public void setCommentAuthorWebsite(String commentAuthorWebsite) {
        this.commentAuthorWebsite = commentAuthorWebsite;
    }

    @Override
    public int hashCode() {
        int hash = 5;
        hash = 19 * hash + this.commentId;
        hash = 19 * hash + this.postId;
        hash = 19 * hash + this.userId;
        hash = 19 * hash + Objects.hashCode(this.commentContent);
        hash = 19 * hash + Objects.hashCode(this.commentAuthorName);
        hash = 19 * hash + Objects.hashCode(this.commentAuthorEmail);
        hash = 19 * hash + Objects.hashCode(this.commentAuthorWebsite);
        hash = 19 * hash + Objects.hashCode(this.commentDate);
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
        if (this.postId != other.postId) {
            return false;
        }
        if (this.userId != other.userId) {
            return false;
        }
        if (!Objects.equals(this.commentContent, other.commentContent)) {
            return false;
        }
        if (!Objects.equals(this.commentAuthorName, other.commentAuthorName)) {
            return false;
        }
        if (!Objects.equals(this.commentAuthorEmail, other.commentAuthorEmail)) {
            return false;
        }
        if (!Objects.equals(this.commentAuthorWebsite, other.commentAuthorWebsite)) {
            return false;
        }
        if (!Objects.equals(this.commentDate, other.commentDate)) {
            return false;
        }
        return true;
    }

}
