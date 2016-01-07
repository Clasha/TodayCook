<%@ page language="java" contentType="text/html; charset=EUC-KR" 
pageEncoding="EUC-KR"%>

<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.net.*, java.util.*, java.io.*" %>

<%
	String realPath = ""; //웹 어플리케이션 상의 절대경로
	String savePath = "upload"; //
	String encType = "EUC-KR";
	int max_size = 1024*1024*5; //최대 업로드 파일 크기 
	ServletContext context = getServletContext();
	realPath = context.getRealPath(savePath + "\\");
	
	out.println("realPath is : " + realPath + "<br>");
	
	try{
		MultipartRequest multi = null;
		//전송을 담당할 컴포넌트를 생성하고 파일을 전송
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
			out.println(name + " = " + value + "<br>");
		}//end while
			
		out.println("<hr>");
		
		//전송할 파일 정보를 가져와서 출력함
		Enumeration files = multi.getFileNames();
		while(files.hasMoreElements()) {
			String name = (String)files.nextElement();
			String fileName = multi.getFilesystemName(name); 	//리네임된 이름.확장자
			String original = multi.getOriginalFileName(name);	//리네임전이름.확장자
			String type = multi.getContentType(name);			//
			
			File file = multi.getFile(name);
			
			out.println("파라미터 이름: " + name + "<br>"); //uploadFile
			out.println("실제 파일 이름: " + original + "<br>"); //Chrysanthemum.jpg
			out.println("저장된 파일 이름: " + fileName + "<br>"); //Chrysanthemum1.jpg
			out.println("파일 타입: " + type + "<br>"); // image/jpeg
			
			if(file != null) {
				out.println("크기 : " + file.length() + "<br>");
			}
		}
		
	} catch (Exception e) {
		System.out.print("★ --- " + e.getMessage() + " --- ★");
	} 
	
%>







