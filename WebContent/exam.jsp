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

<link href="css/exam.css" rel="stylesheet" type="text/css" />
<link href="css/addword.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function addword(){
	document.getElementById("modal-body-id").innerHTML = "改变样式";
}
</script>

</head>
<body>
	<%
		String stageone = "";
		String name = "";
		String sql = "SELECT * FROM paper";
		ResultSet rs = connDbBean.executeQuery(sql);
		while (rs.next()) {
			stageone = rs.getString("stageone");
			name = rs.getString("name");
		}
	%>
	<div class="container">
		<div class="row">
			<h1></h1>
			<div class="progress">
				<div class="progress-bar" role="progressbar" aria-valuenow="60"
					aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
					<span class="sr-only">60% Complete</span>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8" style="background: lightblue;">
				<h1 class="text-center"><%=name%></h1>
				<p>
					<%
						out.println(stageone);
						rs.close();
					%>
				</p>
			</div>
			<div class="col-md-4">
				<h3>在此处答题</h3>
				<form action="" method="post">
					<%
						for (int i = 1; i <= 20; i++) {
							out.println("<P>");
							out.println("<label style=\"width:60px;\">第" + i
									+ "题&nbsp;&nbsp;&nbsp;&nbsp;</label>");
							out.println("<label><input type=\"radio\" checked=\"checked\" name=\""
									+ i + "\" value=\"A\" /> A</label>");
							out.println("<label><input type=\"radio\" name=\"" + i
									+ "\" value=\"B\" /> B</label>");
							out.println("<label><input type=\"radio\" name=\"" + i
									+ "\" value=\"C\" /> C</label>");
							out.println("<label><input type=\"radio\" name=\"" + i
									+ "\" value=\"D\" /> D</label>");
							out.println("</P>");
						}
					%>
					<button type="button" class="btn btn-primary btn-lg btn-block"
						name="submit">&nbsp;&nbsp;提交&nbsp;&nbsp;</button>
					<!-- 弹出对话框触发按钮-->
					<button type="button" class="btn btn-default btn-lg btn-block"
						data-toggle="modal" data-target="#myModal" name="addword">添加生词</button>
					<!-- 弹出对话框样式 -->
					<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel">添加生词</h4>
								</div>
								<div class="modal-body" id="modal-body-id">
									<form>
										<fieldset>
											<div class="control-group">

												<!-- Text input-->
												<label class="control-label" for="input01">生词</label>
												<div class="controls">
													<input placeholder="在此添加生词" class="input-xlarge"
														type="text">
													<p class="help-block"></p>
												</div>
											</div>

											<div class="control-group">

												<!-- Select Basic -->
												<label class="control-label">选择词性</label>
												<div class="controls">
													<select class="input-xlarge">
														<option>动词</option>
														<option>名词</option>
														<option>形容词</option>
													</select>
												</div>

											</div>

											<div class="control-group">

												<!-- Text input-->
												<label class="control-label" for="input01">词意</label>
												<div class="controls">
													<input placeholder="输入单词意思" class="input-xlarge"
														type="text">
													<p class="help-block"></p>
												</div>
											</div>
										</fieldset>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary">保存</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
				</form>
			</div>
		</div>
	</div>


</body>
</html>