<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8">
    <jsp:include page="../include.jsp" />
    <!--Custom styles-->
    <style type="text/css">
        <%@include file="../vendor/css/signup.css" %>
    </style>
    <title>Sign up</title>
</head>

<body>
    <div class="container">
        <div class="d-flex justify-content-center h-100">
            <div class="card">
                <div class="card-header">
                    <h3 class="text-center">Sign up</h3>
                </div>
                <div class="card-body">
                    <form>
                        <div class="row">
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" placeholder="username">

                            </div>
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" placeholder="password">
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" placeholder="username">

                            </div>
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" placeholder="password">
                            </div>
                        </div>
                        <div class="row">
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" placeholder="username">

                            </div>
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" placeholder="password">
                            </div>
                        </div>
                        <div class="form-group">
						<input type="submit" value="Signup" class="btn float-right login_btn">
					</div>
                    </form>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center links">
                        Already have an account?<a href="./GDDangnhap.jsp">Sign in?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>
<%@
// java code go here
%>