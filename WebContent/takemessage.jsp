<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<jsp:useBean id="connDbBean" class="dataconn.dataconn" />
<%
	request.setCharacterEncoding("utf-8");
// 	String answers = null;
// 	String username = (String) session.getAttribute("username");
// 	/* System.out.println("ssssssssssssssssssssss");
// 	System.out.println(username); */

// 	String sql1 = "SELECT * FROM user WHERE name = '" + username + "'";
// 	ResultSet rs1 = connDbBean.executeQuery(sql1);
// 	if (rs1.next()) {
// 		answers = rs1.getString("answers");
// 		if (answers == null)
// 			answers = "";
// 	/* System.out.println("bbbbbbbbbbbbbbb");
// 		System.out.println(answers); */
// 		answers = answers + answer;
// 	}

// 	String sql2 = "UPDATE user set answers = '"+answers+"' WHERE name = '"+username+"'";
// 	int result = connDbBean.executeUpdate(sql2);
// 	if (result != 0) {
		String sql3 = "SELECT * FROM paper";
		ResultSet rs2 = connDbBean.executeQuery(sql3);
		if (rs2.next()) {
			out.println(rs2.getString("stagetwo"));
		}
// 	}
%>