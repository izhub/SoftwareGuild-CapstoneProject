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
        <div class="container">
            <h2>Admin Login</h2>
            <div id="login-form-div" class="row">
                <form class="form-horizontal" id="login-form">
                    <div class="form-group">
                        <label class="col-sm-4 control-label" for="username">Username</label>
                        <div class="col-sm-4">
                            <input type="text" id="username" placeholder="Username" class="form-control"/>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label" for="password">Password</label>
                        <div class="col-sm-4">
                            <input type="text" id="password" placeholder="Password" class="form-control"/>
                        </div>
                        <div class="col-sm-4"></div>
                    </div>                  
                </form>  
            </div>          
        </div>
    </body>
</html>