package user;

import dataconn.dataconn;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao
{
	public String sql = null;
	public PreparedStatement pst = null;
	public ResultSet rs = null;

	// 登陆查询
	public boolean exist(String name, String password)
	{
		Connection conn = null;
		try
		{
			conn = JdbcUtil.getConnection();
			sql = "select id from user where name = '" + name + "' and password = '" + password
					+ "';";// 定义查询语句
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next())
				return true;
			else
				return false;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			JdbcUtil.closeAll(rs, pst, conn);
		}
		return false;
	}

	// 注册查询
	public boolean exist(String name)
	{
		Connection conn = null;
		try
		{
			conn = JdbcUtil.getConnection();
			sql = "select id from user where name = '" + name + "';";// 定义查询语句
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();

			if (rs.next())
				return true;
			else
				return false;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			JdbcUtil.closeAll(rs, pst, conn);
		}
		return false;
	}

	// 注册用户
	public boolean save(String name, String password)
	{
		Connection conn = null;
		try
		{
			conn = JdbcUtil.getConnection();
			int bookid = name.hashCode();
			sql = "insert into user (name, password, bookid) values ('" + name + "','" + password
					+ "'," + bookid + ");";// 定义查询语句
			pst = conn.prepareStatement(sql);
			int res = pst.executeUpdate(sql);
			return true;
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		finally
		{
			JdbcUtil.closeAll(rs, pst, conn);
		}
		return false;
	}

}
