<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<%
	request.setCharacterEncoding("utf-8");
	String word = request.getParameter("word");
	String property = request.getParameter("property");
	String mean = request.getParameter("mean");
	String bookid = (String)session.getAttribute("bookid");

	String sql1 = "select * from book where bookid='" + bookid + "' AND english='" + word + "' AND chinese='" + mean + "'";
	ResultSet rs = connDbBean.executeQuery(sql1);
	if (rs.next()) {
		out.println("exist");
	} else {
		String sql2 = "INSERT INTO book(bookid, english, englishtype, chinese) VALUES('"
				+ bookid + "','" + word + "', '" + property + "', '" + mean + "');";
		int result = connDbBean.executeUpdate(sql2);
		if (result != 0) {
			out.println("ok");
		} else {
			out.println("no");
		}
	}
%>
