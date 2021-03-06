package dataconn;  
import java.sql.*;  
  
public class  dataconn{  
      
    String sConnStr = "jdbc:mysql://localhost:3306/cet";  
    String user="root";   
    String password="123456";   
    Connection conn = null;  
    Statement stmt = null;  
    ResultSet rs = null;  
  
public dataconn() {  
	try {  
		Class.forName("com.mysql.jdbc.Driver");   
		}  
	catch(java.lang.ClassNotFoundException e) {  
		System.err.println("news_conn(): " + e.getMessage());  
	}  
}  
  
public ResultSet executeQuery(String sql) {  
	rs = null;  
	try { 
		conn = DriverManager.getConnection(sConnStr,user,password);   
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);  
		rs = stmt.executeQuery(sql); 
		}   
	catch(Exception ex) {   
		System.err.println("aq.executeQuery: " + ex.getMessage());  
		System.err.println("aq.executeQuerystrSQL: " + sql);  
	}  
	return rs;  
}  
  
          
public int executeUpdate(String sql) {  
	try {  
		conn = DriverManager.getConnection(sConnStr,user,password);   
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);  
		int res = stmt.executeUpdate(sql);  
		return res;
		}   
	catch(Exception ex) {   
		System.err.println("aq.executeUpdate: " + ex.getMessage());  
		System.err.println("aq.executeUpadatestrSQL: " + sql);  
		} 
	return 0;
}  
          
public void closeStmt()  
    {  
	try{  
		stmt.close();  
	   }  
	catch(Exception e){  
		e.printStackTrace();  
	   }  
    }  
  
      
public void closeConn()  
	{  
	try{  
		conn.close();  
	   }  
	catch(Exception e){  
		e.printStackTrace();  
	   }  
	}  
  
} 