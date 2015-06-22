<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Index</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">


        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <style>
            body {
                background-color: lightsteelblue;
            }
            #post {
                background-color: white;
                border: 2px solid gray;
                padding: 20px;
                margin-bottom: 10px;
                margin-top: 20px;
                border-radius: 5px;
            }
            h1  {
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
            <h1>Coding Geekette</h1>  
            <hr/>
        </div>
        <div class="container">

            <!--LEFT COLUMN - BLOG POST CONTENT--->

            <div id="post" class="col-sm-10">
                <h2>${post.postTitle}</h2>
                <div class="post-content">
                    <p id="post-info">Author&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="MM/dd/yyyy" value="${post.postDate}"></fmt:formatDate>&nbsp;&nbsp;&nbsp;
                        <c:forEach var="category" items="${post.postCategories}">  
                            <a href="#">${category}</a> 
                        </c:forEach>&nbsp;&nbsp;&nbsp;
                        <c:forEach var="tag" items="${post.postTags}"> 
                            <a href="#">${tag}</a>
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

            <!--RIGHT COLUMN-->

            <div id="right-col" class="col-sm-2">
                <div class="row">
                    <hr/>
                    <h4><strong>Recent Posts</strong></h4>
                    <hr/>
                    <div id="recent-posts-body">
                        <c:forEach var="recentpost" items="${recentPostList}">
                        </c:forEach>
                        <p>Posts</p>
                        <p>Posts</p>
                        <p>Posts</p>
                        <p>Posts</p>
                        <p>Posts</p>
                        <p>Posts</p>
                    </div>

                </div>
                <div class="row">
                    <hr/>
                    <h4><strong>Tags</strong></h4>
                    <hr/>
                    <div id="tags-body">
                        <c:forEach var="tag" items="${tags}">
                        </c:forEach>
                        <p>Tags</p>
                        <p>Tags</p>
                        <p>Tags</p>
                        <p>Tags</p>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>