<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn"/>  

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

		
		try {
			String sql = "select * from user where name='"+username+"' AND password='"+password+"'";
			ResultSet rs = connDbBean.executeQuery(sql);
			if(rs.next())
			{
				out.println("成功！");
				session.setAttribute("username", username);
				session.setAttribute("password", password);
				response.sendRedirect("index.jsp");
			}else{
				out.println("失败");
			}
			rs.close();
			connDbBean.closeStmt();
			connDbBean.closeConn();
		} catch (Exception e1) {
			out.print(e1);
		}
	%>

</body>
</html>
