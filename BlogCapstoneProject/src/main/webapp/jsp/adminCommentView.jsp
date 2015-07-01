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
                margin-top: 20px;
                font-family: "Times New Roman", "Times", serif;
                font-weight: bold;
            }
            #posts-table {
                margin-top:20px;
                margin-bottom: 130px;
            }
            #admin-view-box {
                border: 2px solid gray;
                background-color: white;
                margin-bottom: 50px;
                padding: 10px;
                border-radius: 10px;
            }
            body {
                background-color: lightsteelblue;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-12">
                    <h1><a href="${pageContext.request.contextPath}/index">
                            ${blogTitle}
                        </a> <small>admin portal</small>
                    </h1>
                </div>
            </div>
            <hr/>
            <div class ="col-sm-2">
                <%@include file="adminMenuFragment.jsp" %>
            </div>
            <div class="col-sm-10" id="admin-view-box">
                <div class="col-sm-11">
                    <h3 id="table-header"></h3>
                    <table class="table table-hover" id="comments-table">
                        <th width="20%">Author</th>
                        <th width="40%">Comment</th>
                        <th width="10%">Date</th>
                        <th width="10%">Post</th>
                        <th width="10%">Status</th>
                        <th width="10%"></th>
                        <tbody id="comments-table-content"></tbody>
                    </table>
                </div>
                <div class="col-sm-1"></div>
            </div>
        </div> 

        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/adminCommentView.js"></script>
    </body>    
</html>