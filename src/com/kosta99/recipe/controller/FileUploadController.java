package com.kosta99.recipe.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.kosta99.recipe.model.MyPageDAO;

@WebServlet("/fileUpload")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 1, // 1 MB
maxFileSize = 1024 * 1024 * 5, // 5 MB
maxRequestSize = 1024 * 1024 * 10, 
//location="D:/2015KOSTA/04.Servlet/workspace/TodayCook_Type1/WebContent/jsp/test/upload/")
// 10 MB
//location="D:/2015KOSTA/04.Servlet/workspace/.metadata/.plugins/org.eclipse.wst.server.core/tmp1/work/Catalina/localhost/TodayCook_Type1")
location="D:/2015KOSTA/04.Servlet/workspace/TodayCook_Type1/WebContent/userimg")
public class FileUploadController extends HttpServlet {

 private static final long serialVersionUID = 1L;

 protected void doPost(HttpServletRequest request,
   HttpServletResponse response) throws ServletException, IOException {
	 
	 System.out.println("FileUploadController...");
	 
  Part part = request.getPart("blob");
  String fileName = null;
  int mnum = 0;
  
  //회원번호를 가져옴
  if(request.getParameter("mnum")!=null) { 					//System.out.println("íìë²í¸: " + request.getParameter("mnum"));
	  mnum = Integer.parseInt(request.getParameter("mnum"));
  }
  if (part != null) {
   //writing blob
   fileName = request.getParameter("blobName");
   
   // 이미지파일 데이터를 가져옴
   part.write("" + File.separator + fileName);
   

  } else {
   //Writing image or file
   part = request.getPart("file");
   fileName = getFileName(part);				//System.out.println("íì¼ì´ë¦: "+fileName);
   part.write("" + File.separator + fileName);
   
   int result = updateProfilPicture(mnum, fileName);
   if(result == 1) {	// 업데이트 성공하면
	// 세션 재설정 - 프로필 이미지 
	   HttpSession session = request.getSession();
	   session.setAttribute("picture", fileName);
   }  
  }

  // Extra logic to support multiple domain - you may want to remove this
  response.setHeader("Access-Control-Allow-Origin", "*");
  response.getWriter().print(fileName + " uploaded successfully");
 }

 /** 데이터베이스에서 회원의 프로필사진 파일이름 변경 */
 private int updateProfilPicture(int mnum, String fileName) {
	// TODO Auto-generated method stub
	MyPageDAO dao = MyPageDAO.getInstance();
	return dao.updatePicture(mnum, fileName);	
}

 /** part의 헤더에서 filename 값만 분리해서 리턴*/
private String getFileName(Part part) {
  String contentDisp = part.getHeader("content-disposition");
  System.out.println("content-disposition header= " + contentDisp);
  String[] tokens = contentDisp.split(";");
  for (String token : tokens) {
   if (token.trim().startsWith("filename")) {
    return token.substring(token.indexOf("=") + 2,
      token.length() - 1);
   }
  }
  return "";
 }
}
