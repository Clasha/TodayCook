<%@page import="com.TodayCook.DAO.JoinDAO"%>
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
<% //메일 발송 페이지
request.setCharacterEncoding("utf-8");
 
//String from = request.getParameter("from"); //보내는 사람
String to = request.getParameter("passwordEmail");//받는 사람
//String subject = request.getParameter("subject");
// String content = request.getParameter("board_txt");//컨텐트 내용
// content += "[ ";
// content += request.getParameter("customerEmail");
// content += " ]";
String password = ""; //난수 비밀번호 발생기
  for(int i = 0; i < 8; i++){
   //char upperStr = (char)(Math.random() * 26 + 65);
   char lowerStr = (char)(Math.random() * 26 + 97); //소문자 생성
   if(i%2 == 0){ //짝수번째에 10이하의 난수 생성
    password += (int)(Math.random() * 10);
   }else{ //홀수번째에 소문자 생성
    password += lowerStr;
   }
  }
System.out.println(to);
System.out.println(password);
StringBuffer sb = new StringBuffer();
sb.append("안녕하세요. 오늘의 요리입니다.");
sb.append("<br>");
sb.append("["+to+"]님께서 요청하신 새로운 비밀번호는 ");
sb.append("<br>");
sb.append(" {"+password+"} 입니다.");
sb.append("<br>");
sb.append("받으신 비밀번호로 새로이 로그인하셔서 비밀번호를 바꿔주세요!");
String content = sb.toString();
System.out.println(content);
// 입력값 받음
 
//JoinDAO에 새로운 비밀번호를 업데이트한다.
JoinDAO dao = JoinDAO.getInstance();
dao.newPassword(to, password);


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
    msg.setSubject("[오늘의 요리]새로운 비밀번호"); // 제목
     
    Address fromAddr = new InternetAddress("jihun85112@naver.com");
    msg.setFrom(fromAddr); // 보내는 사람
     
    Address toAddr = new InternetAddress(to);//받는 사람 이메일
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