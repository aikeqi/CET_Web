<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn"/>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>状态转换页面</title>
</head>

<body>
	<%
		String answers = "";
		for (int i = 1; i <= 25; i++)
		{
			String s = request.getParameter("choose" + i);
			if (s == null || s.isEmpty())	s = "A";
			answers += s;
			answers += '_';
		}
		for (int i = 26; i <= 35; i++)
		{
			String s = request.getParameter("fill_blank" + i);
			if (s == null) s= "";
			answers += s;
			answers += '_';
		}
		session.setAttribute("composition", request.getParameter("composition"));
		session.setAttribute("answers", answers);
		
		response.sendRedirect("state_2.jsp");
	%>
</body>
</html>
