package HTMLEncode;

public class HTMLEncode {
	public String HTMLEncode(String str) {
		   str = str.replace(">", "&gt;");
		   str = str.replace("<", "&lt;");
		   char ch;
		   ch = (char) 32; // space
		   str = str.replace(String.valueOf(ch), "&nbsp;");
		   ch = (char) 34; // ''
		   str = str.replace(String.valueOf(ch), "&quot;");
		   ch = (char) 39; // '
		   str = str.replace(String.valueOf(ch), "&#39;");
		   ch = (char) 13; // carriage return
		   str = str.replace(String.valueOf(ch), "");
		   ch = (char) 10; // new line
		   str = str.replace(String.valueOf(ch), "<BR>");
		   return str;
		}
}