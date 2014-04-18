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
		String answers = "";
		for (int i = 1; i <= 25; i++)
		{
			String s = request.getParameter("choose" + i);
			if (s == null || s.isEmpty())	s = "A";
			answers += s;
			answers += '_';
		}
		for (int i = 26; i <= 55; i++)
		{
			String s = request.getParameter("fill_blank" + i);
			if (s == null) s= "";
			answers += s;
			answers += '_';
		}
		for (int i = 56; i <= 65; i++)
		{
			String s = request.getParameter("choose" + i);
			if (s == null || s.isEmpty())	s = "A";
			answers += s;
			if (i != 65)
				answers += '_';
		}
		String composition = request.getParameter("composition");
		String translation = request.getParameter("translation");
		String bookid = (String)session.getAttribute("bookid");
		String state = (String)session.getAttribute("state");
		String time = (String)session.getAttribute("time");
		String sql = "update user set answers='" + answers + "', composition='" + composition + "', translation='"
				+ translation + "', state='"+ state +"', time='"+time+"' where bookid='" + bookid + "';";
		try {
			int res = connDbBean.executeUpdate(sql);
			if (res != 0)
			{
				out.print(time);
				response.sendRedirect("examDone.jsp");
			}
			out.print("OH ho");
			response.sendRedirect("examDone.jsp");
		} catch(Exception e) {
			
		}
		out.print(answers +  composition + translation);
	%>
</body>
</html>
