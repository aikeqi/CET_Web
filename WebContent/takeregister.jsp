<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn"/>  

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>处理注册信息页面</title>
</head>

<body>
	<%
		request.setCharacterEncoding("utf-8");
		String username = request.getParameter("username");
		String password1 = request.getParameter("password1");
		String password2 = request.getParameter("password2");
		
		if (!password1.equals(password2))
		{
			out.println("两次密码输入不相等!");
			response.sendRedirect("register.jsp");
		}
		else
		{
			try {
				String sql = "select * from user where name='"+username+"'";
				ResultSet rs = connDbBean.executeQuery(sql);
				if (rs.next())
				{
					out.println("该用户已存在!");
					response.sendRedirect("register.jsp");
				}
				else
				{
					int bookid = username.hashCode();
					sql = sql = "insert into user (name, password, bookid) values ('" + username + "','" + password1 + "'," + bookid + ");";
					int res  = connDbBean.executeUpdate(sql);
					if(res != 0)
					{
						out.println("注册成功！");
						session.setAttribute("username", username);
						session.setAttribute("password", password1);
						response.sendRedirect("login.jsp");
					}else{
						out.println("注册失败,请稍后再试");
						response.sendRedirect("resgister.jsp");
					}
				}
				rs.close();
				connDbBean.closeStmt();
				connDbBean.closeConn();
			} catch (Exception e1) {
				out.print(e1);
			}
		}
	%>

</body>
</html>
