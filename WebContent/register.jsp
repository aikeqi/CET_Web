<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html lang="zh-cn">
<head>
<<<<<<< HEAD
<meta charset="utf-8">
<title>用户注册</title>
<!-- 最新的 Bootstrap 核心文件 -->
<link rel="stylesheet" href="css/bootstrap.css" />
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.css" />
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery-2.1.0.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- 外加样式表 -->
<link rel="stylesheet" href="css/register.css" />
=======
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
>>>>>>> origin/master
</head>

<body>
<div class="container">
<<<<<<< HEAD
  <div class="register-form">
    <form class="form-horizontal" action="takeregister.jsp" method="post">
      <h2 class="form-head text-center">用户注册</h2>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="username">用户名</label>
        <div class="col-sm-8">
          <input class="form-control" type="text" placeholder="输入用户名" name="username" />
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="passwrod">密码</label>
        <div class="col-sm-8">
          <input class="form-control" type="password" placeholder="输入密码" name="password" />
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="repasswrod">重复密码</label>
        <div class="col-sm-8">
          <input class="form-control" type="password" placeholder="再次输入密码" name="repassword" />
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="register"></label>
        <div class="col-sm-8">
          <button type="submit" class="btn btn-primary">&nbsp;&nbsp;注册&nbsp;&nbsp;</button>
          <a href="login.jsp">
          <button type="button" class="btn btn-primary">&nbsp;&nbsp;返回登陆&nbsp;&nbsp;</button>
          </a> </div>
      </div>
    </form>
  </div>
</div>
=======

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

>>>>>>> origin/master
</body>
</html>
