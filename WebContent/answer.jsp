<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
	<jsp:useBean id="connDbBean" class="dataconn.dataconn" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>答题卷</title>
</head>
<body>
	<%
		try {
			String sql = "select * from paper";
			ResultSet rs = connDbBean.executeQuery(sql);
			while (rs.next()) {
				String answer = rs.getString("answer");
				out.println(answer);
				rs.close();
			}
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>