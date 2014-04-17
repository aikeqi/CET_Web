<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn"/>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>完成题目页面</title>
</head>

<body>
	<%
		String answers = (String)session.getAttribute("answers");
		
		for (int i = 36; i <= 45; i++)
		{
			String s = request.getParameter("fill_blank" + i);
			if (s == null) s= "";
			answers += s;
			answers += '_';
		}
		for (int i = 46; i <= 65; i++)
		{
			String s = request.getParameter("choose" + i);
			if (s == null || s.isEmpty())	s = "A";
			answers += s;
			if (i != 65)
				answers += '_';
		}
		session.setAttribute("translation", request.getParameter("translation"));
		session.setAttribute("answers", answers);
	%>
</body>
</html>
