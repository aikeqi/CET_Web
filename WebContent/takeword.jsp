<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单词本功能</title>
</head>
<body>
<%
	String username = (String)session.getAttribute("username");
	String bookid = "";

	request.setCharacterEncoding("utf-8");
	String word = request.getParameter("word");
	String type = request.getParameter("type");
	String meaning = request.getParameter("meaning");
	
	try {
		String sql = "select * from user where name='"+username +"'";
		ResultSet rs = connDbBean.executeQuery(sql);
		if (rs.next())
		{
			bookid = rs.getString("bookid");
			sql = "select * from book where bookid='" + bookid + "'AND english=" + word + "' AND chinese=" + meaning + "'";
			rs = connDbBean.executeQuery(sql);
			if (rs.next())
				out.println("该单词已存在");
			else
			{
				sql = "insert into book(english, englishtype, chinese) values ('" + word + "','" + type + "'," + meaning + ");";
				int res = connDbBean.executeUpdate(sql);
				if (res != 0)
					out.println("单词添加成功");
				else
					out.println("单词添加失败，请稍后重试");
			}
			response.sendRedirect("addword.jsp");
		}
		else
		{
			out.println("该用户不存在,请重新登录");
			session.invalidate();
			response.sendRedirect("index.jsp");
		}
	} catch(Exception ex) {
		
	}
%>
</body>
</html>