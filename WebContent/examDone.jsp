<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<jsp:useBean id="htmlEncode" scope="page" class="HTMLEncode.HTMLEncode" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>参考答案</title>
<link rel="stylesheet"
	href="css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="css/bootstrap-theme.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery-2.1.0.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="js/bootstrap.js"></script>

<script src="js/sco.countdown.js" type="text/javascript"></script>

<link href="css/exam.css" rel="stylesheet" type="text/css" />
<link href="css/addword.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	function addword() {
		document.getElementById("modal-body-id").innerHTML = "改变样式";
	}
</script>

</head>
<body>
	<%
		String answer = "";
		String answers = "";
		String name = "";
		String composition = "";
		String translation = "";
		String sql = "SELECT * FROM paper";
		ResultSet rs = connDbBean.executeQuery(sql);
		if (rs.next()) {
			answer = rs.getString("answer");
			name = rs.getString("name");
		}
		sql = "select * from user where name = '" + session.getAttribute("username") + "'";
		rs = connDbBean.executeQuery(sql);
		if (rs.next())
		{
			answers = rs.getString("answers");
			composition = rs.getString("composition");
			translation = rs.getString("translation");
		}
		if (answers == null || answers.isEmpty())
			answers = "A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_______________________________A_A_A_A_A_A_A_A_A_A";
		String[] fill = answers.split("_");
		if (composition == null)
			composition = "（您什么都没写）";
		if (translation == null)
			translation = "（您什么都没写）";
	%>
	<div class="container">
		<div class="row">
		<h1 id="time1">考试结束!请仔细核对答案</h1>
		</div>
		<div class="row">
			<div class="col-md-8" style="background: lightblue; overflow-y:scroll; height:800px;">
				<h1 class="text-center"><%=name%></h1>
				<p>
					<%
						out.println(htmlEncode.HTMLEncode(answer));
						rs.close();
					%>
				</p>
			</div>
			<div class="col-md-4">
				<div>
					<a href="index.jsp"><button type="button" class="btn btn-primary btn-lg btn-block"
						name="submit">&nbsp;&nbsp;返回主页&nbsp;&nbsp;</button></a>
					<!-- 弹出对话框触发按钮-->
					<button type="button" class="btn btn-default btn-lg btn-block"
						data-toggle="modal" data-target="#myModal" name="addword">添加生词</button>
				</div>

				<div class="container-fluid">
					<div class="row-fluid">
						<h3 class="text-center">您的答案如下：</h3>
						<div class="span12">
							<div class="tabbable" id="tabs-780530">
								<ul class="nav nav-tabs">
									<li><a href="#panel-3" data-toggle="tab">作文</a></li>
									<li class="active"><a href="#panel-1" data-toggle="tab">听力</a></li>
									<li><a href="#panel-2" data-toggle="tab">阅读理解</a></li>
									<li><a href="#panel-4" data-toggle="tab">翻译</a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="panel-1" style="overflow-y:scroll; height:300px;">
										<h4>选择题</h4>
										<%
											for (int i = 1; i <= 25; i++) {
												out.println("<P name=\"choose\">");
												out.println("<label style=\"width:62px;\">第" + i
														+ "题&nbsp;&nbsp;&nbsp;&nbsp;</label>");
												out.println("<label>" + fill[i - 1] + "</label>");
												out.println("</P>");
											}
										%>
										<h4>填空</h4>
										<% 
											for(int i=26; i<= 35; i++){
												out.println("<P name=\"choose\">");
												out.println("<label style=\"width:62px;\">第" + i
														+ "题&nbsp;&nbsp;&nbsp;&nbsp;</label>");
												out.println("<label>" + fill[i - 1] + "</label>");
												out.println("</P>");
											}
										%>
									</div>
									<div class="tab-pane" id="panel-2" style="overflow-y:scroll; height:300px;">
										<p>
										<h4>完形填空</h4>
										<%
										for(int i=36; i<= 55; i++){
											out.println("<P name=\"choose\">");
											out.println("<label style=\"width:62px;\">第" + i
													+ "题&nbsp;&nbsp;&nbsp;&nbsp;</label>");
											out.println("<label>" + fill[i - 1] + "</label>");
											out.println("</P>");
										}
										%>
										<h4>阅读</h4>
										<%
										for (int i = 56; i <= 65; i++) {
											out.println("<P name=\"choose\">");
											out.println("<label style=\"width:62px;\">第" + i
													+ "题&nbsp;&nbsp;&nbsp;&nbsp;</label>");
											out.println("<label>" + fill[i - 1] + "</label>");
											out.println("</P>");
										}
										%>
										</p>
									</div>
									<div class="tab-pane" id="panel-3">
										<h3>作文</h3>
										<p><%=composition %></p>
										<br>
									</div>
									<div class="tab-pane" id="panel-4">
										<h3>翻译</h3>
										<p><%=translation %></p>
										<br>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

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
												<input placeholder="在此添加生词" class="input-xlarge" type="text"
													id="newword">
												<p class="help-block"></p>
											</div>
										</div>

										<div class="control-group">

											<!-- Select Basic -->
											<label class="control-label">选择词性</label>
											<div class="controls">
												<select class="input-xlarge" id="property">
													<option value="v.">v.</option>
													<option value="n.">n.</option>
													<option value="adj.">adj.</option>
													<option value="adv.">adv.</option>
													<option value="conj.">conj.</option>
													<option value="pron.">pron.</option>
													<option value="prep.">prep.</option>
												</select>
											</div>

										</div>

										<div class="control-group">

											<!-- Text input-->
											<label class="control-label" for="input01">词意</label>
											<div class="controls">
												<input placeholder="输入单词意思" class="input-xlarge" type="text"
													id="mean">
												<p class="help-block"></p>
											</div>
										</div>
									</fieldset>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal" id="closeBtn">关闭</button>
								<button type="button" class="btn btn-primary"
									onClick="saveprogress()">保存</button>
								<script type="text/javascript">
									function saveprogress() {
										//alert("保存进度1");
										var xmlhttp;
										//判断一下用户有没有输入生词信息，或者信息输入是否合法
										var word = document
												.getElementById("newword").value;
										var property = document
												.getElementById("property").value;
										var mean = document
												.getElementById("mean").value;
										//alert("保存进度2");
										if (word != "" && property != ""
												&& mean != "") {
											if (window.XMLHttpRequest) {
												xmlhttp = new XMLHttpRequest();
											} else {
												xmlhttp = new ActiveXObject(
														"Microsoft.XMLHTTP");
											}
											xmlhttp.onreadystatechange = function() {
												if (xmlhttp.readyState == 4
														&& xmlhttp.status == 200) {
													var resText = xmlhttp.responseText;
													if (resText.indexOf("ok") != -1) {
														document
																.getElementById(
																		"closeBtn")
																.click();
													} else if (resText
															.indexOf() != -1) {
														alert("提交失败！");
													}
												}
											}
											xmlhttp.open("POST", "handle.jsp",
													true);
											xmlhttp
													.setRequestHeader(
															"Content-type",
															"application/x-www-form-urlencoded");
											xmlhttp.send("word=" + word
													+ "&property=" + property
													+ "&mean=" + mean);
										} else {
											alert("单词：" + word + "词性："
													+ property + "词意：" + mean);
										}
									}
								</script>
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