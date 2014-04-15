<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>CET在线模拟测试系</title>
<!-- 最新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>
<link href="css/index.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div class="container">
<div class="choose">
  <form class="form-horizontal">
    <fieldset>
      <div id="legend" class="">
        <legend class="">CET4/CET6模拟测试</legend>
      </div>
      <div class="control-group"> 
        
        <!-- Select Basic -->
        <label class="control-label">CET4</label>
        <div class="controls">
          <select class="input-xlarge">
            <option>请选择试卷</option>
            <option>2012年6月</option>
            <option>2012年12月</option>
            <option>2012年6月</option>
          </select>
        </div>
      </div>
      <div class="control-group"> 
        
        <!-- Select Basic -->
        <label class="control-label">CET6</label>
        <div class="controls">
          <select class="input-xlarge">
            <option>请选择试卷</option>
            <option>2012年6月</option>
            <option>2012年12月</option>
          </select>
        </div>
      </div>
      <div class="control-group">
        <label class="control-label"></label>
        
        <!-- Button -->
        <div class="controls">
          <button class="btn btn-primary">确定</button>
        </div>
      </div>
    </fieldset>
  </form>
  </div>
</div>
<%
if(session.getAttribute("username")==null){
   out.println("未登录");
}else{
   out.println(session.getAttribute("username"));
}
//session.invalidate();
%>
</body>
</html>