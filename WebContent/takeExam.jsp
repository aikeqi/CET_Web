<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn"/>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>准备考试页面</title>
</head>

<body>
	<%
		String bookid = (String)session.getAttribute("bookid");
		String sql = "select * from user where bookid='" + bookid + "'";
		
		String state = null;
		String time = null;
		String answers = null;
		String composition = null;
		String translation = null;
		
		try {
			
			ResultSet rs = connDbBean.executeQuery(sql);
			if (rs.next())
			{
				state = rs.getString("state");
				time = rs.getString("time");
				answers = rs.getString("answers");
				composition = rs.getString("composition");
				translation = rs.getString("translation");
			}
			session.setAttribute("state", state);
			session.setAttribute("time", time);
			session.setAttribute("answers", answers);
			session.setAttribute("compostion", composition);
			session.setAttribute("translation", translation);
			response.sendRedirect("exam.jsp");
			rs.close();
		} catch(Exception e) {
			
		}
		connDbBean.closeStmt();
		connDbBean.closeConn();
	%>
</body>
</html>
