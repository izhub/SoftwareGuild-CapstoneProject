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
        </style> 
    </head>


    <!--HEADER-->

    <div id="header" class="container">
        <div class="navbar">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="${pageContext.request.contextPath}/index.jsp">Home</a></li>
                    <c:forEach var="page" items="${staticPages}">
                    <li role="presentation">
                        <a href="${pageContext.request.contextPath}/staticPages/{${page.pageId}}">${page.pageName}</a>
                    </li>
                </c:forEach>
            </ul>    
        </div>   
        <h1>Coding Geekette</h1>  
    </div>
    <div class="container">
        <div class="post-content">
            <h3>${post.postTitle}</h3>
            <p id="post-info">Author&nbsp;&nbsp;&nbsp;${post.postDate}&nbsp;&nbsp;&nbsp;
                <c:forEach var="category" items="${post.postCategories}">  
                    <a href="#">${category}</a> 
                </c:forEach>&nbsp;&nbsp;&nbsp;

            </p>
            <div class="post-body">
                <p>${post.postContent}</p>     
            </div>
            <div class="post-footer">
                <h4>Tags:</h4>
                <c:forEach var="tag" items="${post.postTags}"> 
                    <a href="#">${tag}</a>
                </c:forEach>
            </div>
        </div>
    </div>
</body>
</html>