<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Portal</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <%-- 
        Author: terry
        --%>
        <script src="${pageContext.request.contextPath}/js/tinymce/tinymce.min.js"></script>
        <script type="text/javascript">
            tinymce.init({
                selector: "textarea",
                width: 700,
                menubar: false,
                statusbar: false,
                theme: 'modern',
                skin: 'light'
            });
        </script>
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
            #add-post-box {
                border: 2px solid gray;
                background-color: white;
                margin-bottom: 50px;
                padding: 10px;
                border-radius: 10px;
            }
            body {
                background-color: lightsteelblue;
            }
            #post-info {
                margin-top: 110px;
            }
            #text-context-box {
                padding: 20px;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <h1>Admin Portal</h1>
            <hr/>
            <div class ="col-sm-2">
                <ul id="admin-nav" class="nav nav-pills nav-stacked">
                    <li id="admin-nav-item" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="listBlogPosts">Posts</a>
                        <ul class="dropdown-menu">
                            <li><a href="adminPortal">All Posts</a></li>
                            <li class="disabled"><a href="addNew">Add Post</a></li> 
                        </ul>
                    </li>
                    <li id="admin-nav-item" class="dropdown"><a href="#">Pages</a></li>
                    <li id="admin-nav-item" class="dropdown"><a href="#">Comments</a></li>
                </ul>
            </div>
            <div class="col-sm-10" id="add-post-box">  

                <!-- LEFT COLUMN OF ADD_POST BOX - TEXT EDITOR AND TITLE-->
                <div id="text-content-box" class="col-sm-9">
                    <h3><strong>Add New Post</strong></h3>
                    <form class="form-horizontal">  
                        <input type="hidden" id="postType" name="postType"/>
                        <div class="form-group">
                            <div class="col-sm-6">
                                <input type="text" id="postTitle" name="postTitle" class="form-control" placeholder="Title"/>
                            </div>
                            <div class="col-sm-6"></div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <textarea name="postContent" class="form-control" rows="20">
                                </textarea>
                            </div>
                        </div>
                        <div style="height: 20px;" id="add-confirmation"></div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <button id="commit" type="button" class="btn btn-default">Commit</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- RIGHT COLUMN OF ADD_POST BOX-->
                <div class="col-sm-3">
                    <form id="post-info" action="#" class="form-horizontal">
                        <div class="form-group">
                            <h5 class="text-center"><strong>Status</strong></h5> 
                            <select id="status-select" class="form-control">
                                <option value="pending">pending review</option>
                                <option value="draft">draft</option>
                                <option value="published">published</option>
                            </select>
                        </div>
                        <hr/>
                        <h5 class="text-center"><strong>Categories</strong></h5>
                        <div id="category-check-box" class="form-group">
                        </div>
                    </form>
                    <div class="row">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <input type="text" placeholder="Add New Category" class="form-control"/>
                                </div>
                                <div class="col-sm-3">
                                    <button type="submit" class="btn btn-default btn-sm">Add</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <hr/>
                    <div class="row">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <input type="text" class="form-control" placeholder="Comma Separated Tags"/> 
                                </div>
                                <div class="col-sm-3">
                                    <button type="submit" class="btn btn-default btn-sm">Add</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> 
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/addNewPost.js"></script>
    </body>   