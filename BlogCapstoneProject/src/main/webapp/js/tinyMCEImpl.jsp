<%-- 
    Author     : terry
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
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
        </script>
    </head>
    <body>
        <h1>Hello World!</h1>
        <form method="post">
            <textarea name="content"></textarea>
            <button type="submit" name="Submit">Submit</button>
        </form>
    </body>
</html>
