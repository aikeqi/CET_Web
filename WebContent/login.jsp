<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CET登录</title>
<<<<<<< HEAD
<!-- 最新的 Bootstrap 核心文件 -->
<link rel="stylesheet" href="css/bootstrap.css" />
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.css" />
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery-2.1.0.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="js/bootstrap.js"></script>

=======
<!-- 最新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.min.js"></script>
>>>>>>> origin/master
<link href="css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
	String username = (String)session.getAttribute("username");
	if (username == null)
		username = "";
%>
<div class="container">

      <form action="takelogin.jsp" method="post" class="form-signin" role="form">
        <h2 class="form-signin-heading">用户登录</h2>
<<<<<<< HEAD
        <input value="<%=username%>" name="username" type="text" class="form-control" placeholder="用户名" required autofocus  />
        <input name="password" type="password" class="form-control" placeholder="密码" required />
        <button class="btn btn-lg btn-primary btn-block" type="submit">登陆</button>
=======
        <input value="<%=username%>" name="username" type="text" class="form-control" placeholder="用户名" required autofocus>
        <input name="password" type="password" class="form-control" placeholder="密码" required>
<!--         <label class="checkbox"> -->
<!--           <input type="checkbox" value="remember-me"> 记住我 -->
<!--         </label> -->
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="登陆" />
        <br>
        <a href="index.jsp"><input class="btn btn-lg btn-primary btn-block" type="button" value="返回" /></a>
>>>>>>> origin/master
      </form>

    </div> <!-- /container -->
</body>
</html>