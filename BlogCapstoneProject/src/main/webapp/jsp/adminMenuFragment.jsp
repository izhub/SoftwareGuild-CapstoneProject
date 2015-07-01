<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<h4>
    Welcome <sec:authentication property="principal.username" />
</h4>

<ul id="admin-nav" class="nav nav-pills nav-stacked">
    <li id="admin-nav-item" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="listBlogPosts">Posts</a>
        <ul class="dropdown-menu">
            <li id="all-posts-button"><a href="${pageContext.request.contextPath}/adminBlogView">All Posts</a></li>
            <li id="add-post-button"><a href="${pageContext.request.contextPath}/addNewPost">Add Post</a></li> 
        </ul>
    </li>
    <li id="admin-nav-item" class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="listStaticPages">Pages</a>
        <ul class="dropdown-menu">
            <li id="all-pages-button"><a href="${pageContext.request.contextPath}/adminPageView">All Pages</a></li>
            <li id="add-static-page-button"><a href="${pageContext.request.contextPath}/addNewPage">Add Page</a></li>
        </ul>
    </li>
    <li id="admin-nav-item" class="dropdown"><a href="${pageContext.request.contextPath}/adminCommentView">Comments</a></li>

    <!-- #1 - Logout link -->
    <li>
        <a href="${pageContext.request.contextPath}/j_spring_security_logout">Log Out</a>
    </li>
</ul>