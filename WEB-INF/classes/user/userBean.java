package user;

import user.UserDao;

public class User
{
	private UserDao userDao;

	private String name;
	private String password;

	private String password1;
	private String password2;

	public User()
	{
		super();
		userDao = new UserDao();
	}

	public User(String name, String password)
	{
		super();
		this.name = name;
		this.password = password;
		userDao = new UserDao();
	}

	public User(String name, String password1, String password2)
	{
		super();
		this.name = name;
		this.password1 = password1;
		this.password2 = password2;
		userDao = new UserDao();
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getPassword()
	{
		return password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public boolean loginCheack()
	{
		if (name.isEmpty())
		{
			JOptionPane.showMessageDialog(null, "用户名不能为空");
			return false;
		}
		else if (password.isEmpty())
		{
			JOptionPane.showMessageDialog(null, "密码不能为空");
			return false;
		}
		else if (userDao.exist(name, password))
			return true;
		else
		{
			JOptionPane.showMessageDialog(null, "用户名/密码错误");
			return false;
		}
	}

	public boolean registerCheack()
	{
		// 检查用户名是否为空
		if (name.isEmpty())
		{
			out.println("用户名不能为空!");
			return false;
		}
		// 检查密码是否为空
		else if (password1.isEmpty())
		{
			out.println("密码不能为空!");
			return false;
		}
		// 检查密码两次输入是否相同
		else if (!password1.equals(password2))
		{
			out.println("密码两次输入不相同！");
			return false;
		}
		// 用户名格式限制
		else if (!name.matches("[A-Z|a-z|0-9]{2,10}"))
		{
			out.println("用户名必须只包含字母数字，且长度在2至10之间！");
			return false;
		}
		// 密码格式限制
		else if (!password1.matches("[A-Z|a-z|0-9]{6,12}"))
		{
			out.println("密码必须只包含字母数字，且长度在6至12之间！");
			return false;
		}
		else
		{
			if (userDao.exist(name))
			{
				out.println("用户名已存在!");
				return false;
			}
			else if (userDao.save(name, password1))
			{
				out.println("恭喜，注册成功！");
				return true;
			}
			else
			{
				JOptionPane.showMessageDialog(null, "注册失败，请重试");
				return false;
			}
		}
	}

}
