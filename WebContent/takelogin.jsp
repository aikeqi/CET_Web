<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>处理登陆信息页面</title>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String uri = "jdbc:mysql://localhost:3306/cet";
		String dbuser = "root";
		String dbpass = "123456";
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
		} catch (Exception e) {
			out.print(e);
		}
		try {
			conn = DriverManager.getConnection(uri, dbuser, dbpass);
			stmt = conn.createStatement();
			String sql = "select * from user where name='"+username+"' AND password='"+password+"'";
			rs = stmt.executeQuery(sql);
			if(rs.next())
			{
				out.println("成功！");
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				response.sendRedirect("index.jsp");
			}else{
				out.println("失败");
			}
			stmt.close();
			conn.close();
		} catch (SQLException e1) {
			out.print(e1);
		}
	%>

</body>
</html>
