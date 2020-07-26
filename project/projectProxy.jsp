<%

	String _url = request.getParameter("url");
	StringBuffer message = new StringBuffer();

	

	URL url = new URL(_url);
	InputStream in = url.openStream();
	BufferedReader br = new BufferedReader(new InputStreamReader(in,"utf-8"));
	String readLine=null;
	
	while((readLine = br.readLine())!=null){
		message.append(readLine);	
	}

	br.close();
	in.close();

%><%=message.toString()%>
<%@ page import="java.net.*,java.io.*" contentType="application/xml; charset=utf-8"
    pageEncoding="utf-8"%>