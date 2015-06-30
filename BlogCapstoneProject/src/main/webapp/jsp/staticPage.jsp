<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/functions.js"></script>
        <style>
            body {
                background-color: lightsteelblue;
            }
            #post {
                background-color: white;
                border: 2px solid gray;
                padding: 20px;
                margin-bottom: 100px;
                margin-top: 20px;
                border-radius: 5px;
            }
            h1, h2, h3, h4, h5 {
                margin-left: 10px;
                font-family: "Times New Roman", "Times", serif;
                font-weight: bold;
            }
            #header {
                margin-bottom: 40px;
            }
            #right-col {
                padding-left: 40px;
            }
            a {
                color: royalblue;
            }
            #comment-text{
                margin: 20px;
            }
            #add-comment-row{
                margin-top: 100px;
            }
            #list-of-comments {
                margin-top: 10px;
                padding: 10px;
                background-color: white;
                border-radius: 5px;
                border: 2px solid gray;
            }
            #comment-content {
                padding: 15px;
                background-color: lightgray;
                border-radius: 5px;
            }
        </style> 
    </head>
    <body>
        <!--HEADER-->
        <div id="header" class="container">
            <div class="navbar">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/index">Home</a></li>
                        <c:forEach var="page" items="${staticPages}">
                        <li role="presentation">
                            <a href="${pageContext.request.contextPath}/staticPages/{${page.pageId}}">${page.pageName}</a>
                        </li>
                    </c:forEach>
                </ul>    
            </div>   
            <h1>Blog</h1>  
            <hr/>
        </div>
        <div class="container">

            <!--LEFT COLUMN - BLOG POST CONTENT--->
            <div id="left-column" class="col-sm-10">
                <div id="post" class="row">
                    <h2>${post.postTitle}</h2>
                    <div class="post-content">
                        <input type="hidden" id="postId" value="${post.postId}"/>
                        <p id="post-info">Author&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="MM/dd/yyyy" value="${post.postDate}"></fmt:formatDate>&nbsp;&nbsp;&nbsp;
                            <c:forEach var="category" items="${post.postCategories}">  
                                <a href="${pageContext.request.contextPath}/category/${category}">${category}</a> 
                            </c:forEach>&nbsp;&nbsp;&nbsp;
                            <c:forEach var="tag" items="${post.postTags}"> 
                                <a href="${pageContext.request.contextPath}/tag/${tag}">${tag}</a>
                            </c:forEach>
                        </p>
                        <div class="post-body">
                            ${post.postContent}     
                        </div>
                        <br/>
                        <!--                    <div class="post-footer">
                                                <div class="form-horizontal">
                                                <h5><strong>Comments</strong</h5>
                                                
                                                <h5><strong>Tags:</strong></h5>
                        <c:forEach var="tag" items="${post.postTags}"> 
                            <a href="#">${tag}</a>
                        </c:forEach>
                    </div>-->
                    </div>
                </div>
                <div class="row" id="add-comment-row">
                    <div class="col-sm-6"> 
                        <c:out value="${message}" />
                        <sf:form modelAttribute="comment" class="form-horizontal" action="${pageContext.request.contextPath}/addComment" method="POST">
                            <div class="form-group">
                            </div>
                            <input type="hidden" name="postId" value="${post.postId}"/>
                            <div class="comment-text form-group">
                                <label for="comment-textarea" class="col-sm-1 control-label">Comment:</label>
                                <div id="comment-content-box" class="col-sm-offset-2 col-sm-8">
                                    <textarea id="comment-textarea" name="commentContent" cols="50" rows="5"></textarea>
                                </div>                          
                            </div>
                            <div class="form-group">
                                <label for="comment-name" class="col-sm-1 control-label">Name</label>
                                <div class="col-sm-offset-2 col-sm-6">
                                    <input type="text" name="commentAuthorName" class="form-control" id="comment-name" placeholder="Name"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="comment-email" class="col-sm-1 control-label">Email</label>
                                <div class="col-sm-offset-2 col-sm-6">
                                    <input type="email" name="commentEmail" class="form-control" id="comment-email" placeholder="username@example.com"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="comment-website" class="col-sm-1 control-label">Website</label>
                                <div class="col-sm-offset-2 col-sm-6">
                                    <input type="text" name="commentWebsite" class="form-control" id="comment-website" placeholder="website"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-offset-3 col-sm-6">
                                    <img id="captcha_image" src="${pageContext.request.contextPath}/captcha" />
                                </div>
                                <div class="col-sm-3">
                                    <button type="button" class="btn btn-default" id="refreshCaptcha">
                                        <span class="glyphicon glyphicon-refresh"></span>
                                    </button>   
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="comment-captcha" class="col-sm-1 control-label">Captcha</label>
                                <div class="col-sm-offset-2 col-sm-4">
                                    <input class="form-control" type="text" name="captcha" />
                                </div>
                            </div>


                            <div class="form-group">
                                <div  class="col-sm-offset-3 col-sm-2">
                                    <button id="comment-submit-button" type="submit" class="btn btn-default">Submit</button>
                                </div>
                            </div>
                        </sf:form>
                    </div>
                </div>
            </div>
            <!--END OF LEFT COLUMN-->

            <!--RIGHT COLUMN-->
            <div class="col-sm-2">
                <div class="row">
                    <div class="col-sm-12">
                        <h4><strong>Recent Posts</strong></h4>
                        <hr/>
                        <div id="recent-posts-body">
                            <ul>
                                <c:forEach var="recentpost" items="${recentPostList}">
                                    <li><a href="${pageContext.request.contextPath}/post/${recentpost.postId}">${recentpost.postTitle}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-12">
                        <hr/>
                        <h4><strong>Tags</strong></h4>
                        <hr/>
                        <div id="tags-body">
                            <c:forEach var="tag" items="${tags}">
                                <c:set var="fontSize" value="${((tag.term_count/5) * (2 - 0.65)) + 0.65}" />
                                <fmt:formatNumber var="fontSize" maxFractionDigits="2" value="${fontSize}" />
                                <a href="${pageContext.request.contextPath}/tag/${tag.term_name}" style="font-size: ${fontSize}em">${tag.term_name}</a>
                                &nbsp;
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div> 
        </div>

    </div>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/staticPage.js"></script>
</body>
</html>