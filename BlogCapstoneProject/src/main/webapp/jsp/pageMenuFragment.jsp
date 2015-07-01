<div class="navbar">
    <ul class="nav nav-tabs">
        <li role="presentation"><a href="${pageContext.request.contextPath}/index">Home</a></li>
        <c:forEach var="category" items="${categories}">
            <li role="presentation">
                <a href="${pageContext.request.contextPath}/category/${category}">${category}</a>
            </li>
        </c:forEach>
    </ul>
</div>  