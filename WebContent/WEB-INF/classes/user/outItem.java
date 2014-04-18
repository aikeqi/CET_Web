package user;

public class out 
{
	public void outChoose(String fill, int i)
	{
		out.println("<P name=\"choose\">");
		out.println("<label style=\"width:62px;\">第" + i + "题&nbsp;&nbsp;&nbsp;&nbsp;</label>");
		if (fill.equals("A")){
			out.println("<label><input type=\"radio\" name=\"choose"+ i + "\" checked=\"checked\" value=\"A\" /> A</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" value=\"B\" /> B</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" value=\"C\" /> C</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" value=\"D\" /> D</label>");
		}
		if (fill.equals("B")){
			out.println("<label><input type=\"radio\" name=\"choose"+ i + "\"  value=\"A\" /> A</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" checked=\"checked\" value=\"B\" /> B</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" value=\"C\" /> C</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" value=\"D\" /> D</label>");
		}
		if (fill.equals("C")){
			out.println("<label><input type=\"radio\" name=\"choose"+ i + "\" value=\"A\" /> A</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" value=\"B\" /> B</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" checked=\"checked\" value=\"C\" /> C</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" value=\"D\" /> D</label>");
		}
		if (fill.equals("D")){
			out.println("<label><input type=\"radio\" name=\"choose"+ i + "\" value=\"A\" /> A</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" value=\"B\" /> B</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" value=\"C\" /> C</label>");
			out.println("<label><input type=\"radio\" name=\"choose" + i+ "\" checked=\"checked\" value=\"D\" /> D</label>");
		}
		out.println("</P>");
	}
	
	public void outFill_blank(String fill, int i) {
		out.println("<div class=\"form-group\">");
		out.println("<label for=\"inputAnswer\" class=\"col-sm-2 control-label\">第"+ i + "题</label>");
		out.println("<div class=\"col-sm-8\">");
		if (fill == "" || fill.isEmpty())
			out.println("<input name=\"fill_blank" + i+ "\"type=\"text\" class=\"form-control\" id=\"inputAnswer\" placeholder=\"请输入答案\">");
		else
			out.println("<input name=\"fill_blank" + i+ "\"type=\"text\" class=\"form-control\" id=\"inputAnswer\" value=\""+ fill +"\">");
		out.println("</div>");
		out.println("</div>");
	}
}