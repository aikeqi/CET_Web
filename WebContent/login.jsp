<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>用户登录</title>
<!-- 最新的 Bootstrap 核心文件 -->
<link rel="stylesheet" href="css/bootstrap.css" />
<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.css" />
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery-2.1.0.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script type="text/javascript" src="js/bootstrap.js"></script>

<!-- 外加样式表 -->
<link rel="stylesheet" href="css/login.css" />
</head>

<body>
<div class="container">
  <div class="login-form">
    <form class="form-horizontal" role="form" action="takelogin.jsp" method="post">
      <h2 class="form-head text-center">用户登陆</h2>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="username">用户名</label>
        <div class="col-sm-8">
          <input class="form-control" type="text" placeholder="输入用户名" autofocus="" required="" name="username" />
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="passwrod">密码</label>
        <div class="col-sm-8">
          <input class="form-control" type="password" placeholder="输入密码" required="" name="password" />
        </div>
      </div>
      <div class="form-group">
        <label class="col-sm-3 control-label" for="register"></label>
        <div class="col-sm-8">
          <button type="submit" name="login" class="btn btn-primary">&nbsp;&nbsp;登陆&nbsp;&nbsp;</button>
          <a href="index.jsp">
          <button type="button" class="btn btn-primary">&nbsp;&nbsp;返回&nbsp;&nbsp;</button>
          </a> </div>
      </div>
    </form>
  </div>
</div>
</body>
</html>
