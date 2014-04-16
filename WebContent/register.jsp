<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CET注册</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="css/layoutit.css" rel="stylesheet">
<link href="css/bootstrap-combined.min.css" rel="stylesheet">
<script src="js/jquery.min.js"></script>
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.min.css">
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.min.js"></script>
<link href="css/login.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="container">

      <form action="takeregister.jsp" method="post" class="form-signin" role="form">
        <h2 class="form-signin-heading">用户注册</h2>
        <input name="username" type="text" class="form-control" placeholder="用户名" required autofocus>
        <input name="password1" type="password" class="form-control" placeholder="密码" required>
        <input name="password2" type="password" class="form-control" placeholder="确认密码" required>
<!--         <label class="checkbox"> -->
<!--           <input type="checkbox" value="remember-me"> 记住我 -->
<!--         </label> -->
        <input class="btn btn-lg btn-primary btn-block" type="submit" value="注册" />
        <br>
        <a href="index.jsp"><input class="btn btn-lg btn-primary btn-block" type="button" value="返回" /></a>
      </form>

</div> <!-- /container -->

</body>
</html>