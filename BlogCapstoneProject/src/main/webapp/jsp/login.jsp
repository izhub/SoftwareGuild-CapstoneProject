<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"/>
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/img/icon.png"/>
        <style>
            #login-form-div {
                margin-top: 100px;
            }
            h2 {
                margin-top:100px;
                font-family: "Times New Roman", "Times", serif;
                font-weight: bold;
                text-align: center;                
            }
            body {
                background-color: lightsteelblue;
            }
        </style>
    </head>
    <body>
        <div>
            <h2>Admin Login Page</h2>
            <!-- #1 - If login_error == 1 then there was a failed login attempt --> 
            <!--      so display an error message                                -->
            <hr />

            <!-- #2 - Post to Spring security to check our authentication -->
            <div class="container">
                <c:if test="${param.login_error == 1}">
                    <div class="row">
                        <div class="col-sm-12 text-warning text-center">
                            Wrong id or password!
                        </div>
                    </div>
                </c:if>

                <div class="row">
                    <div class="col-sm-12">
                        <form method="post" class="form-horizontal" action="j_spring_security_check">
                            <div class="form-group">
                                <label for="username" class="col-sm-offset-4 col-sm-1 control-label">Username: </label>
                                <div class="col-sm-1">
                                    <input id="username" name="j_username" type="text" />
                                </div>                          
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-offset-4 col-sm-1 control-label">Password: </label>
                                <div class="col-sm-1">
                                    <input id="password" name="j_password" type="password" />
                                </div>                          
                            </div>
                            <div class="form-group">
                                <div  class="col-sm-offset-5 col-sm-2">
                                    <button type="submit" class="btn btn-default">Sign In</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </body>
</html>