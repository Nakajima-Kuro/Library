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
                    <form method = "POST" action="doDangki.jsp">
                        <div class="row">
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" name="username" placeholder="username" required>

                            </div>
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="password" class="form-control" name="password" placeholder="password" required>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="input-group form-group col-12">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" name="fullname" placeholder="fullname" required>
                            </div>
                        </div>
                        
                        <div class="row">
                        	<div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="date" class="form-control" name="dateofbirth" placeholder="DOB" required>
                            </div>
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="email" class="form-control" name="email" placeholder="email" required>
                            </div>
                        </div>
                        
                        <div class="row">
                        	<div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="text" class="form-control" name="phone" placeholder="phone" required>
                            </div>
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <input type="text" class="form-control" name="securityid" placeholder="securityid" required>

                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-key"></i></span>
                                </div>
                                <input type="text" class="form-control" name="address" placeholder="address" required>
                            </div>
                            <div class="input-group form-group col-6">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                                </div>
                                <select class="form-control" name="gender" required>
                                	<option value="" disabled selected>Gender</option>
							      	<option>male</option>
							      	<option>female</option>
							      	<option>other</option>
							    </select>
                            </div>
                        </div>
                        <div class="form-group">
						<input type="submit" value="Signup" class="btn float-right login_btn">
					</div>
                    </form>
                </div>
                <div class="card-footer">
                    <div class="d-flex justify-content-center links">
                        Already have an account?<a href="./gdDangnhap.jsp">Sign in?</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

</html>