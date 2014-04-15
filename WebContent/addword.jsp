<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加生词</title>


<!-- 最新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap.min.css">

<!-- 可选的Bootstrap主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.0.3/css/bootstrap-theme.min.css">



<link rel="stylesheet" type="text/css" href="css/addword.css">

</head>
<body>
<div class="container">

	<form class="form-addword">
		<fieldset>
			<div id="legend" class="head">
				<legend class="">添加生词</legend>
			</div>
			<div class="control-group">

				<!-- Text input-->
				<label class="control-label" for="input01">生词</label>
				<div class="controls">
					<input placeholder="在此添加生词" class="input-xlarge" type="text">
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
					<input placeholder="输入单词意思" class="input-xlarge" type="text">
					<p class="help-block"></p>
				</div>
			</div>

			<div class="control-group">
				<label class="control-label"></label>

				<!-- Button -->
				<div class="controls">
					<button class="btn btn-primary">提交</button>
				</div>
			</div>

		</fieldset>
	</form>
</div>


</body>
</html>