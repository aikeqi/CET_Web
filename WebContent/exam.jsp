<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线测试</title>
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>

<script src="js/sco.countdown.js" type="text/javascript"></script>

<link href="css/index.css" rel="stylesheet" type="text/css" />

</head>
<body>
	<%
		String name = "";
		String stageone = "";
		String stagetwo = "";
		String sql = "SELECT * FROM paper";
		ResultSet rs = connDbBean.executeQuery(sql);
		while (rs.next()) {
			name = rs.getString("name");
			stageone = rs.getString("stageone");
			stagetwo = rs.getString("stagetwo");
		}
	%>
	<div class="container">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span12">
					<h3 class="text-center">
						<%
							out.println("name");
						%>
					</h3>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span8">
					<p>
						<%
							out.println(stageone);
							out.println(stagetwo);
							rs.close();
						%>
					</p>
				</div>
				<div class="span4">
					<form>
						<fieldset>
							<legend>表单项</legend>
							<label>表签名</label><input type="text" /> <span class="help-block">这里填写帮助信息.</span>
							<label class="checkbox"><input type="checkbox" /> 勾选同意</label>
							<button type="submit" class="btn">提交</button>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
		<div class="left">
			<p></p>
		</div>
		<div class="right"></div>
	</div>


</body>
</html>