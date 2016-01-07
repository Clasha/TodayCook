<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% %>
 <c:set value="${sessionScope.mnum }" var="id"></c:set>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>관리자 페이지</title>
<!-- 게시글 리스트 페이지
 게시글 리스트를 위한 서블릿 클래스에서는 데이터베이스에서 게시글 정보를 얻어와 이를 list형태로 게시글 리스트 화면으로 보냄
 게시글 리스트 페이지에서는 리스트를 출력하고 게시글 상세보기와 게시글 등록페이지로 이동 
  -->
<link rel="stylesheet" type="text/css" href="/TodayCook_Type1/board/css/board.css">
</head>
<body>
   <div id="wrap" align="center">
      <h1>공지사항</h1>
      <table class="list">
         <tr>
            <td colspan="5" style="border: white; text-align: right"><a
               href="BoardServlet?command=board_write_form">게시글 등록</a></td>
         </tr>
         <tr>
            <th>번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
         </tr>
         <!-- 서블릿에서 속성에 실어 넘겨준 게시글목록 정보를 갖는 boardList에서 글정보를 한개씩 얻어서 var속성값인 board에 저장-->
         <c:forEach var="board" items="${boardList }">
           
               <tr class="record">
                  <td>${board.num }</td>
                  <!-- c:forEach태그에서 게시글 정보 한개를 저장해 둔 board에서 게시글 번호를 얻어와 출력함 -->
                  <td><a href="BoardServlet?command=board_view&num=${board.num}">
                  <!--게시글 상세보기 페이지로 이동하기위해 커맨드에 따라 알맞은 작업을 처리하기 위한 명령처리 클래스인 ActionFactory에 추가 -->
                        ${board.subject } </a></td> <!-- 게시글 제목을 얻어와 출력함  -->
                  <td>${board.nick}</td><!-- 게시글을 등록한 닉네임을 얻어와 출력함  -->
                  <td><fmt:formatDate value="${board.reg_date }" /></td>
               </tr>
          
         </c:forEach>
         <c:if test="${sessionScope.login ne 'admin' }">
         <tr>
            <td colspan="5" style="border: white; text-align: right">
            <a href="recipedatil.recipe">메인으로</a>
            </td>
         </tr>
         </c:if>
      </table>
      <%-- <div>
         <jsp:include page="../board/page.jsp" flush="true"/>
       </div> --%>
   </div>
</body>
</html>