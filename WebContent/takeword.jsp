<%@ page contentType="text/html; charset=utf-8" language="java"
	import="java.sql.*" errorPage=""%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>单词本功能</title>
<SCRIPT language=javascript>
	function go()
	{
	 window.history.go(-1);
	}
	setTimeout("go()",0);
</SCRIPT>
</head>
<body>
<%
	String username = (String)session.getAttribute("username");
	String bookid = "";

	request.setCharacterEncoding("utf-8");
	String word = request.getParameter("word");
	String type = request.getParameter("type");
	String meaning = request.getParameter("meaning");
	ResultSet rs= null;
	
	out.println(word + "  "  + type + "   " + meaning); 
	
	if (word != null && !word.equals(""))
	{
		try {
			String sql = "select * from user where name='"+username +"'";
			bookid = (String)session.getAttribute("bookid");
			out.println(bookid);
			///rs.close();
			sql = "select * from book where bookid='" + bookid + "' AND english='" + word + "' AND chinese='" + meaning + "'";
			rs = connDbBean.executeQuery(sql);
			if (rs.next())
			{	
				out.println("该单词已存在");
			}
			else
			{
				//rs.close();
				sql = "insert into book(bookid, english, englishtype, chinese) values ("+bookid + ",'"+ word + "','" + type + "','" + meaning + "');";
				out.println(sql);
				int res = connDbBean.executeUpdate(sql);
				if (res != 0)
					out.println("单词添加成功");
				else
					System.out.println("单词添加失败，请稍后重试");
			}
			
		} catch(Exception ex) {
			System.out.println("exception");
		}
		rs.close();
	}
	//response.sendRedirect("addword.jsp");
	connDbBean.closeStmt();
	connDbBean.closeConn();
%>
</body>
</html>