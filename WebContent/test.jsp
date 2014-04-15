<%@page contentType="text/html;chatset=gb2312"%>
<%@page import ="java.sql.*"%>

<%!

//定义mysqlJDBC驱动名
 String DBDRIVER = "com.mysql.jdbc.Driver";

//定义连接的mysql数据库
 String DBURL ="jdbc:mysql://localhost:3306/cet";
 String DBUSER ="root";
 String DBPASSWORD ="123456";
 Connection conn = null;
 Statement stmt = null;
ResultSet rs = null;
%>
<%
 try
 {
  Class.forName(DBDRIVER);

//连接数据库需要使用到数据源，用户名，密码
  conn=DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD);

//测试连接，在test数据库中创建test1表
   String sql = "select password from user where name = 'Hcindy';";
  stmt =conn.createStatement();
  rs = stmt.executeQuery(sql);
  if (rs.next())
{
out.print(rs.getString(1));
}
  stmt.close();
  conn.close();
 }
 catch(Exception e)
 {
  out.println(e);
 }
%>