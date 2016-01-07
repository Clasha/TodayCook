<%@ page language="java" contentType="text/html; charset=EUC-KR" 
pageEncoding="EUC-KR"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.net.*, java.util.*, java.io.*" %>

<%
	String realPath = ""; //�� ���ø����̼� ���� ������
	String savePath = "upload"; //	
	int max_size = 1024*1024*2; //�ִ� ���ε� ���� ũ�� 
	String encType = "UTF-8";
	ServletContext context = getServletContext();
	//realPath = context.getRealPath(savePath + "\\");
	realPath = "D:/2015KOSTA/04.Servlet/workspace/TodayCook_Type1/WebContent/userimg";
	
	//out.println("realPath is : " + realPath + "<br>");
	
	try{
		MultipartRequest multi = null;
		//������ ����� ������Ʈ�� �����ϰ� ������ ����
		multi = new MultipartRequest(
						request,
						realPath,
						max_size,
						encType,
						new DefaultFileRenamePolicy()
						);
		Enumeration params = multi.getParameterNames();
		
		while(params.hasMoreElements()) {
			String name = (String)params.nextElement();
			String value = multi.getParameter(name);
			//out.println(name + " = " + value + "<br>");
		}//end while
			
		out.println("<hr>");
		
		//������ ���� ������ �����ͼ� �����
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String name = (String)files.nextElement();
			String fileName = multi.getFilesystemName(name); 	//�����ӵ� �̸�.Ȯ����
			String original = multi.getOriginalFileName(name);	//���������̸�.Ȯ����
			String type = multi.getContentType(name);			//
			
			File file = multi.getFile(name);
			
			out.println("�Ķ���� �̸�: " + name + "<br>"); //uploadFile
			out.println("���� ���� �̸�: " + original + "<br>"); //Chrysanthemum.jpg
			out.println("����� ���� �̸�: " + fileName + "<br>"); //Chrysanthemum1.jpg
			out.println("���� Ÿ��: " + type + "<br>"); // image/jpeg
			
			if(file != null) {
				out.println("ũ�� : " + file.length() + "<br>");
			}
		}
		
	} catch (Exception e) {
		System.out.print("�� --- " + e.getMessage() + " --- ��");
	} 
	







