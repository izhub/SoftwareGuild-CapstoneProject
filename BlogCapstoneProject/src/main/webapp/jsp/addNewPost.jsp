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
                    <li id="admin-nav-item"><a href="#">Posts</a></li>
                    <li id="admin-nav-item"><a href="#">Pages</a></li>
                    <li id="admin-nav-item"><a href="#">Comments</a></li>
                </ul>
            </div>
            <div class="col-sm-10" id="admin-view-box">

                <div id="text-content-box" class="col-sm-9">
                    <h3><strong>Add New Post</strong></h3>
                    <div class="row">
                        <div class="col-sm-4">
                            <input type="text" class="form-control" placeholder="Title"/>
                        </div>
                        <div class="col-sm-8"></div>
                    </div>
                    <br/>
                    <div class="row">
                        <div class="col-sm-12">
                            <textarea rows="20" cols="90">
                        
                            </textarea>
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-default">Save</button>
                    </div>
                </div>
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
</html>