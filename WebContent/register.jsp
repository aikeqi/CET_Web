<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html lang="zh-cn">
<head>
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
</head>

<body>
<div class="container">
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
</body>
</html>
