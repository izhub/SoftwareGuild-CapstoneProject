<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Portal</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <style> 
            #admin-nav {
                margin-top: 130px;
            }
            #admin-nav-item {
                margin-top:10px;
            }
            h1  {
                margin-left: 30px;
                font-family: "Times New Roman", "Times", serif;
                font-weight: bold;
            }
            h3 {
                margin-top: 60px;
                font-family: "Times New Roman", "Times", serif;
                font-weight: bold;
            }
            #posts-table {
                margin-top:40px;
                margin-bottom: 130px;
            }
            #admin-view-box {
                border: 5px solid gray;
                background-color: white;
            }
            body {
                background-color: lightsteelblue;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <h1>Admin Portal</h1>
            <hr/>
            <div class ="col-sm-2">               
                <ul id="admin-nav" class="nav nav-pills nav-stacked">
                    <li id="admin-nav-item"><a href="#">Posts</a></li>
                    <li id="admin-nav-item"><a href="#">Pages</a></li>
                    <li id="admin-nav-item"><a href="#">Comments</a></li>
                </ul>
            </div>
            <div class="col-sm-10" id="admin-view-box">
                <div class="col-sm-1"></div>

                <div class="col-sm-10">
                    <h3 id="table-header"></h3>
                    <table class="table table-hover" id="posts-table">
                        <th width="20%">Title</th>
                        <th width="20%">Author</th>
                        <th width="20%">Category</th>
                        <th width="15%">Status</th>
                        <th width="15%">Date</th>
                        <th width="5%"></th>
                        <th width="5%"></th>
                        <tbody id="posts-table-content"></tbody>
                    </table>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div> 
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/adminPage.js"></script>
    </body>    
</html>