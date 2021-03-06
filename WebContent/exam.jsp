<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<jsp:useBean id="htmlEncode" scope="page" class="HTMLEncode.HTMLEncode" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线测试</title>
<link rel="stylesheet" href="css/bootstrap.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet" href="css/bootstrap-theme.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="js/jquery-2.1.0.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="js/bootstrap.js"></script>

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
		String stageone = "";
		String name = "";
		String state = (String) session.getAttribute("state");
		String time = (String)session.getAttribute("time");
		String answers = (String)session.getAttribute("answers");
		String composition = (String)session.getAttribute("composition");
		String translation = (String)session.getAttribute("translation");
		if (answers == null || answers.isEmpty())
			answers = "A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_A_______________________________A_A_A_A_A_A_A_A_A_A";
		if (composition == null)
			composition = "";
		if (translation == null)
			translation = "";
		String[] fill = answers.split("_");
		String sql = "SELECT * FROM paper";
		ResultSet rs = connDbBean.executeQuery(sql);
		while (rs.next()) {
			stageone = rs.getString("stageone");
			name = rs.getString("name");
		}
	%>
	<div class="container">
		<div class="row">
			<h1 id="time">
			<script  type="text/javascript">

			/*此处是网页计时器,到时自动提交数据*/
			function Timer(id) {
				this.id = id;
				this.timer = null;
				this.count = 0;
				this.begin = function(count) {
					this.count = count;
					Timer.show(this)();
					this.timer = setInterval(Timer.show(this), 1000);
					if (count < 20)
						takemessage1();
				}

				Timer.show = function(obj) {
					return function() {
						if (obj.count == 20) {
							takemessage1();
						}else if(obj.count < 0){
							takemessage2();
							clearInterval(obj.timer);
							return;
						}
						//document.form.lastedTime.value = (obj.count).toString();
						document.getElementById(obj.id).innerHTML = "剩余时间："
								+ obj.count;
						obj.count--;
					}
				}
			}
			
			/*当计时器结束，触发事件*/
			function takemessage2() {
				document.getElementById("submit").click();
			}

			/*ajax对象处理*/
			function takemessage1() {
				if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
					xmlhttp = new XMLHttpRequest();
				} else {// code for IE6, IE5
					xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
				}
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4
							&& xmlhttp.status == 200) {
						document.getElementById("txtHint").innerHTML = xmlhttp.responseText;
						changeLabel();
						//alert(xmlhttp.responseText);
					}
				}
				xmlhttp.open("POST", "takemessage.jsp", true);
				xmlhttp.setRequestHeader("Content-type",
						"application/x-www-form-urlencoded");
				xmlhttp.send("answer=");
			}

			/*该方法是用来改变选项卡*/
			function changeLabel() {
				document.getElementById("#panel-3").href = "";
				document.getElementById("#panel-1").href = "";
				document.getElementById("#panel-2").href = "#panel-2";
				document.getElementById("#panel-4").href = "#panel-4";
				document.getElementById("#panel-2").click();
			}

			/*这个方法是用来获取选择题*/
			function getChoose() {
				var str = "";
				var topicId = document.getElementsByName("choose");
				for (var k = 0; k < topicId.length; k++) {
					var topic = document
							.getElementsByName("choose" + k);
					for (var i = 0; i < topic.length; i++) {
						if (topic[i].checked == true) {
							if (str == "") {
								str = topic[i].value;
							} else {
								str = str + "_" + topic[i].value;
							}
						}
					}
				}
				return str;
			}
			/*这个方法功能是用来获取作文的答案*/
			function getComposition() {
				return document.getElementById("composition");
			}

			/*这个方法是用来获取完型填空题答案*/
			function getBlank() {
				var str = "";
				var blanks = document.getElmentsByName("fill_blank");
				for (var i = 0; i < blanks.length; i++) {
					str = str + "_" + blacks[i].value;
				}
				return str;
			}

			/*这个方法是用来获取选择题*/
			function getRead() {
				var str = "";
				var topicId = document.getElementsByName("read");
				for (var k = 0; k < topicId.length; k++) {
					var topic = document.getElementsByName("read" + k);
					for (var i = 0; i < topic.length; i++) {
						if (topic[i].checked == true) {
							if (str == "") {
								str = topic[i].value;
							} else {
								str = str + "_" + topic[i].value;
							}
						}
					}
				}
				return str;
			}

			/*这个方法是用来获取翻译题答案*/
			function getTranslation() {
				return document.getElementById("translation");
			}
			t1 = new Timer("time");
			var x = <%=time %>
			t1.begin(parseInt(x));

			</script>
			</h1>
		</div>
		<div class="row">
			<div class="col-md-8"
				style="background: lightblue; overflow-y: scroll; height: 800px;">
				<h1 class="text-center"><%=name%></h1>
				<p id="txtHint">
					<%
						out.println(htmlEncode.HTMLEncode(stageone));
						rs.close();
					%>
				</p>
			</div>
			<div class="col-md-4">
			<form action="takesubmit.jsp" method="post">
				<input type="hidden" id="lastedtime"/>
				<div>
					
					<button type="submit" class="btn btn-primary btn-lg btn-block" id="submit"
						name="submit">&nbsp;&nbsp;提交&nbsp;&nbsp;</button>
						
					<!-- 弹出对话框触发按钮-->
					<button type="button" class="btn btn-default btn-lg btn-block"
						data-toggle="modal" data-target="#myModal" name="addword">添加生词</button>
					 <a href="index.jsp"><button type="button" class="btn btn-primary btn-lg btn-block" >
					&nbsp;&nbsp;返回&nbsp;&nbsp;</button></a>
				</div>

				<div class="container-fluid">
				
					<div class="row-fluid">
						<h3 class="text-center">请在此处答题</h3>
						<div class="span12">
							<div class="tabbable" id="tabs-780530">
								<ul class="nav nav-tabs">
									<%
										if (state != "2") {
											out.println("<li><a id=\"#panel-3\" href=\"#panel-3\" data-toggle=\"tab\">作文</a></li>");
											out.println("<li class=\"active\"><a id=\"#panel-1\" href=\"#panel-1\" data-toggle=\"tab\">听力</a></li>");
											out.println("<li><a id=\"#panel-2\" href=\"\" data-toggle=\"tab\">阅读理解</a></li>");
											out.println("<li><a id=\"#panel-4\" href=\"\" data-toggle=\"tab\">翻译</a></li>");
										} else {
											out.println("<li><a id=\"#panel-3\" href=\"\" data-toggle=\"tab\">作文</a></li>");
											out.println("<li><a id=\"#panel-1\" href=\"\" data-toggle=\"tab\">听力</a></li>");
											out.println("<li class=\"active\"><a id=\"#panel-2\" href=\"#panel-2\" data-toggle=\"tab\">阅读理解</a></li>");
											out.println("<li><a id=\"#panel-4\" href=\"#panel-4\" data-toggle=\"tab\">翻译</a></li>");
										}
									%>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="panel-1"
										style="overflow-y: scroll; height: 500px;">
										<h4>选择题</h4>
										<%
											for (int i = 1; i <= 25; i++) {
												out.println("<P name=\"choose\">");
												out.println("<label style=\"width:62px;\">第" + i
														+ "题&nbsp;&nbsp;&nbsp;&nbsp;</label>");
												if (fill[i - 1].equals("A")){
													out.println("<label><input type=\"radio\" name=\"choose" 
															+ i + "\" checked=\"checked\" value=\"A\" /> A</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"B\" /> B</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"C\" /> C</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"D\" /> D</label>");
												}
												if (fill[i - 1].equals("B")){
													out.println("<label><input type=\"radio\" name=\"choose" 
															+ i + "\"  value=\"A\" /> A</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" checked=\"checked\" value=\"B\" /> B</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"C\" /> C</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"D\" /> D</label>");
												}
												if (fill[i - 1].equals("C")){
													out.println("<label><input type=\"radio\" name=\"choose" 
															+ i + "\" value=\"A\" /> A</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"B\" /> B</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" checked=\"checked\" value=\"C\" /> C</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"D\" /> D</label>");
												}
												if (fill[i - 1].equals("D")){
													out.println("<label><input type=\"radio\" name=\"choose" 
															+ i + "\" value=\"A\" /> A</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"B\" /> B</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"C\" /> C</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" checked=\"checked\" value=\"D\" /> D</label>");
												}
												out.println("</P>");
											}
										%>
										<h4>填空</h4>
										<%
											for (int i = 26; i <= 35; i++) {
												out.println("<div class=\"form-group\">");
												out.println("<label for=\"inputAnswer\" class=\"col-sm-2 control-label\">第"
														+ i + "题</label>");
												out.println("<div class=\"col-sm-8\">");
												if (fill[i- 1] == "" || fill[i - 1].isEmpty())
													out.println("<input name=\"fill_blank" + i
															+ "\"type=\"text\" class=\"form-control\" id=\"inputAnswer\" placeholder=\"请输入答案\">");
												else
													out.println("<input name=\"fill_blank" + i
															+ "\"type=\"text\" class=\"form-control\" id=\"inputAnswer\" value=\""+ fill[i - 1] +"\">");
												out.println("</div>");
												out.println("</div>");
											}
										%>
									</div>
									<div class="tab-pane" id="panel-2"
										style="overflow-y: scroll; height: 500px;">
										<p>
										<h4>填空</h4>
										<%
											for (int i = 36; i <= 55; i++) {
												out.println("<div class=\"form-group\">");
												out.println("<label for=\"inputAnswer\" class=\"col-sm-2 control-label\">第"
														+ i + "题</label>");
												out.println("<div class=\"col-sm-8\">");
												if (fill[i- 1] == "" || fill[i - 1].isEmpty())
													out.println("<input name=\"fill_blank" + i
															+ "\"type=\"text\" class=\"form-control\" id=\"inputAnswer\" placeholder=\"请输入答案\">");
												else
													out.println("<input name=\"fill_blank" + i
															+ "\"type=\"text\" class=\"form-control\" id=\"inputAnswer\" value=\""+ fill[i - 1] +"\">");
												out.println("</div>");
												out.println("</div>");
											}
										%>
										<h4>阅读</h4>
										<%
											for (int i = 56; i <= 65; i++) {
												out.println("<P name=\"read\">");
												out.println("<label style=\"width:62px;\">第" + i
														+ "题&nbsp;&nbsp;&nbsp;&nbsp;</label>");
												if (fill[i - 1].equals("A")){
													out.println("<label><input type=\"radio\" name=\"choose" 
															+ i + "\" checked=\"checked\" value=\"A\" /> A</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"B\" /> B</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"C\" /> C</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"D\" /> D</label>");
												}
												if (fill[i - 1].equals("B")){
													out.println("<label><input type=\"radio\" name=\"choose" 
															+ i + "\"  value=\"A\" /> A</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" checked=\"checked\" value=\"B\" /> B</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"C\" /> C</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"D\" /> D</label>");
												}
												if (fill[i - 1].equals("C")){
													out.println("<label><input type=\"radio\" name=\"choose" 
															+ i + "\" value=\"A\" /> A</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"B\" /> B</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" checked=\"checked\" value=\"C\" /> C</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"D\" /> D</label>");
												}
												if (fill[i - 1].equals("D")){
													out.println("<label><input type=\"radio\" name=\"choose" 
															+ i + "\" value=\"A\" /> A</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"B\" /> B</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" value=\"C\" /> C</label>");
													out.println("<label><input type=\"radio\" name=\"choose" + i
															+ "\" checked=\"checked\" value=\"D\" /> D</label>");
												}
												out.println("</P>");
											}
										%>
										</p>
									</div>
									<div class="tab-pane" id="panel-3">
										<h3>作文</h3>
										<textarea name="composition" cols="60" rows="15"><%=composition %></textarea>
										<br>
									</div>
									<div class="tab-pane" id="panel-4">
										<h3>翻译</h3>
										<textarea name="translation" cols="60" rows="10"><%=translation %></textarea>
										<br>
									</div>
								</div>
							</div>

						</div>
					</div>
					</from>
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
													<option value="verb">动词</option>
													<option value="noun">名词</option>
													<option value="adjective">形容词</option>
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