<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer class="footer"><!-- section section-primary -->
		<div class="container" style="width:95%; padding-top:10px;">
			<div class="row">
				<div class="col-xs-5">
					<p>
					<a href="../TodayCook_Type1/etcDoc/userInformation.jsp">개인정보보호정책</a> | <a href="../TodayCook_Type1/etcDoc/useruse.jsp">이용약관</a>
					| <a href="../TodayCook_Type1/etcDoc/help.jsp">도움말</a>
					</p>
					<p>
						대표 : Sauce / E : jihun85112@naver.com / T : 070) 5039-5802 ~ 10 <br>
						경기도 성남시 분당구 삼평동 대왕판교로 670길 유스페이스2 B동 8층 8강의실<br>
						<br>
						(주)Sauce / 사업자등록번호 111-11-11111 / 통신정보제공 <br> 
						취업 할 수 있겠지? <br>
						서울지방중소기업청 제 xxxxxxxxx-Y-xxxxx호 <br>
						발행인 : Sauce, 편집인 : Sauce<br>
						<br>
						Copyright ©오늘의요리 Inc. All Rights Reserved
					</p>
				</div>
				
				<div class="col-xs-2">
					<img src="${pageContext.request.contextPath}/img/btm_app.gif">
					<br><br>
					
					<img src="${pageContext.request.contextPath}/img/todaycook.png" style="width:200px;">
				</div>
				<div class="col-xs-2">
					<img src="${pageContext.request.contextPath}/img/strun.gif" style="width:200px;">
				</div>
				<div class="col-xs-3 comment">
				<form id="customer" name="customer">
        		<textarea id="customerSend" name="board_txt" placeholder="오늘의 요리에 전하고 싶으신 의견을 남겨주세요"></textarea><br>
        		<input type="email" name="customerEmail" id="customerEmail" placeholder="회신받으실 이메일을 적어주세요" size="46px" required><br>
        		<p class="text-center">
        		<input type="button" class="btn btn-success" id="customerbtn" value="의견제출">
        		</p>
				</form>
				</div>
				
				
			</div><!-- class: row -->
		</div><!-- container -->
	</footer>
