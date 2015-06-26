<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
            .blog-post {
                background-color: white;
                border: 2px solid gray;
                padding: 20px;
                margin-bottom: 10px;
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
            a {
                color: royalblue;
            }
            #post-content {
                white-space: normal;
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
            <div class="row">
                <!--POST LIST - LEFT COLUMN -->                 
                <div class="col-sm-10">
                    <div class="blog-posts-block">
                        <c:forEach var="post" items="${blogList}">
                            <div class="blog-post row">
                                <div class="col-sm-12">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <h3>${post.postTitle}</h3>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <p id="post-info">Author&nbsp;&nbsp;&nbsp;<fmt:formatDate pattern="MM/dd/yyyy" value="${post.postDate}"></fmt:formatDate>&nbsp;&nbsp;&nbsp;
                                                <c:forEach var="category" items="${post.postCategories}">  
                                                    <a href="#">${category}</a> 
                                                </c:forEach>&nbsp;&nbsp;&nbsp;
                                                <c:forEach var="tag" items="${post.postTags}"> 
                                                    <a href="#">${tag}</a>
                                                </c:forEach>
                                            </p>
                                        </div>
                                    </div>
                                    <div id="post-content-wrap" class="row">
                                        <div class="col-sm-12">
                                            ${post.postContent}
                                        </div>
                                    </div>
                                </div>
                                <a class="btn btn-primary" href="post/${post.postId}">Read More</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!--RIGHT COLUMN-->
                <div class="col-sm-2">
                    <div class="row">
                        <div class="col-sm-12">
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
                    </div>
                    <div class="row">
                        <div class="col-sm-12">
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
                                <p>Tags</p>
                            </div>
                        </div>
                    </div>
                </div>                
            </div>



        </div>


        <!-- Placed at the end of the document so the pages load faster -->
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> 
    </body>
</html>

