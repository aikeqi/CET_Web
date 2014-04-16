<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<jsp:useBean id="connDbBean" scope="page" class="dataconn.dataconn" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试卷</title>
</head>
<body>
	<%
		try {
			String sql = "select * from paper";
			ResultSet rs = connDbBean.executeQuery(sql);
			while (rs.next()) {
				String stageone = rs.getString("stageone");
				String stagetwo = rs.getString("stagetwo");
				out.println(stageone);
				out.println(stagetwo);
				rs.close();
			}
		} catch (Exception e) {
			out.print(e);
		}
	%>


</body>
</html>