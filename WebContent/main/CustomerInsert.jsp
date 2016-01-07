<%@page import="mail.SMTPAuthenticator"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.Address"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  //고객의견 전달 페이지
request.setCharacterEncoding("utf-8");
 
//String from = request.getParameter("from"); //보내는 사람
//String to = request.getParameter("customerEmail");//받는 사람
//String subject = request.getParameter("subject");
StringBuffer sb = new StringBuffer();
String board = request.getParameter("board_txt"); //컨텐트 내용
String customerEmail = request.getParameter("customerEmail");
sb.append(board);
sb.append("<br>["+customerEmail+"]");

//String content = request.getParameter("board_txt");//컨텐트 내용
//content += request.getParameter("customerEmail");
String content = sb.toString();
// 입력값 받음
 
Properties p = new Properties(); // 정보를 담을 객체
 
p.put("mail.smtp.user", "jihun85112");
p.put("mail.smtp.host","smtp.naver.com"); // 네이버 SMTP
//p.put("mail.smtp.host","smtp.mail.nate.com"); // 네이트 SMTP
 
p.put("mail.smtp.port", "465");
p.put("mail.smtp.starttls.enable", "true");
p.put("mail.smtp.auth", "true");
p.put("mail.smtp.debug", "true");
p.put("mail.smtp.socketFactory.port", "465");
p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
p.put("mail.smtp.socketFactory.fallback", "false");
// SMTP 서버에 접속하기 위한 정보들
 
try{
	Authenticator auth = new SMTPAuthenticator();
    Session ses = Session.getInstance(p, auth);
     
    ses.setDebug(true);
     
    MimeMessage msg = new MimeMessage(ses); // 메일의 내용을 담을 객체
    msg.setSubject("고객 의견사항 전달내용"); // 제목
     
    Address fromAddr = new InternetAddress("jihun85112@naver.com");
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress("jihun85112@naver.com");//받는 사람 이메일
    msg.addRecipient(Message.RecipientType.TO, toAddr); // 받는 사람
     
    msg.setContent(content, "text/html;charset=UTF-8"); // 내용과 인코딩
     
    Transport.send(msg); // 전송
    
} catch(Exception e){
    e.printStackTrace();
    //out.println("<script>alert('Send Mail Failed..');history.back();</script>");
    // 오류 발생시 뒤로 돌아가도록
    return;
}
 
//out.println("<script>alert('Send Mail Success!!');location.href='successMail.jsp';</script>");
// 성공 시
%>