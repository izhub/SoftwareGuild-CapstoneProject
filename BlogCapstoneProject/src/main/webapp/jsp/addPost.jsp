<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Admin Portal</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png">
        <script src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
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

            // category and tags array
            var categories = [];
            var tags = [];
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
                <%@include file="adminMenuFragment.jsp" %>
            </div>
            <div class="col-sm-10" id="add-post-box">  

                <!-- LEFT COLUMN OF ADD_POST BOX - TEXT EDITOR AND TITLE-->
                <div id="text-content-box" class="col-sm-9">
                    <c:set var="type" value="${postType}"/>
                    <c:if test="${fn:startsWith(type, 'blog')}">
                        <h3><strong>Add Blog Post</strong></h3>
                    </c:if>
                    <c:if test="${fn:startsWith(type, 'page')}">
                        <h3><strong>Add Static Page</strong></h3> 
                    </c:if>

                    <form class="form-horizontal">  
                        <input type="hidden" id="postType" name="postType" value="${postType}"/>
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
                                <sec:authorize access="hasRole('ROLE_ADMIN')">
                                    <button id="commit" type="button" class="btn btn-default">Publish</button>
                                </sec:authorize>

                                <sec:authorize access="hasRole('ROLE_MARKETING')">
                                    <button id="approval" type="button" class="btn btn-default">Submit for Approval</button>
                                </sec:authorize>

                                <button id="draft" type="button" class="btn btn-default">Save as Draft</button>
                            </div>
                        </div>
                    </form>
                </div>
                <!-- RIGHT COLUMN OF ADD_POST BOX-->
                <div class="col-sm-3">
                    <div class="row" style="margin-top: 100px">
                        <span class="text-center"><strong>Status: </strong>draft</span>
                    </div>
                    <hr/>
                    <div class="row">
                        <form class="form-horizontal">
                            <h5 class="text-center"><strong>Categories</strong></h5>
                            <div id="categoryList" class="col-sm-11" style="height:100px; overflow:auto; margin-bottom: 10px">
                                <c:forEach var="category" items="${categoryList}">
                                    <c:set var="categoryId" value="${fn:toLowerCase(category)}" />
                                    <br /><input type="checkbox" id="${categoryId}" name="${categoryId}"> ${category}</input>
                                </c:forEach>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <input type="text" id="category" placeholder="Add New Category" class="form-control" autocomplete="off">
                                </div>
                                <div class="col-sm-3">
                                    <button id="addCategory" type="button" class="btn btn-default btn-sm">Add</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <hr/>
                    <div class="row">
                        <form class="form-horizontal">
                            <h5 class="text-center"><strong>Tags</strong></h5>
                            <div class="form-group">
                                <div class="col-sm-9">
                                    <input type="text" id="tags" placeholder="Comma Separated Tags" class="form-control" autocomplete="off">
                                </div>
                                <div class="col-sm-3">
                                    <button id="addTag" type="button" class="btn btn-default btn-sm">Add</button>
                                </div>
                            </div>
                            <div id="tagList" class="col-sm-11" style="height:100px; overflow:auto; margin-top: 10px">
                                <c:forEach var="tag" items="${tagList}" varStatus="item">

                                    <span class="tag">
                                        <button type="button" class="btnTag btn btn-default btn-xs" style="margin-top: 2px" value="0">
                                            <span id="${item.index}" class="glyphicon glyphicon-remove"></span> ${tag}
                                        </button>
                                    </span>

                                </c:forEach>

                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div> 
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/addPost.js"></script>
    </body>
</html>