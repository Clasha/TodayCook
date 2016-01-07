<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>레시피 입력 페이지</title>
<link rel="stylesheet" type="text/css" href="../css/index.css">
<link rel="stylesheet" type="text/css" href="../css/recipe.css">
<!-- <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script> -->
<script type="text/javascript" src="../js/index.js"></script>
</head>
<body>
<header style="height: 150px;">
<%@include file="../include/headerOrigin.jsp" %>
</header>
<section>

<center>
	<form action="../recipewrite.recipe" method="post" enctype="multipart/form-data">
<!-- 	<form action="../recipewrite.recipe" method="post" enctype="multipart/form-data"> -->
		<div class="cont_box pad_l_60">
			<div class="regi_title">레시피 등록</div>
			<div id="divMainPhotoUpload" class="cont_pic2">
				<br>
				<img src="" id="img_preview" name="img_preview" style="width: 200px; background-color: #f5f5f5; height: 200px; background-color: AEAAAA; border-radius: 5px; box-shadow: 5px 5px gray;"/>
				<!-- image에서 선택한 파일의 미리보기를 출력 -->
				<br>
				<br>
				<input type="file" id="image" name="image" style="background-color: white; width: 100px; border-color: white;">
				<!-- 메인 사진 선택 -->
			</div>	
			<div class="cont_line">
			<p class="cont_tit4">레시피 제목</p>
			<input type="text" name="title" id="title" style="width: 410px;"/>
			</div>
		<br>
		<div class="cont_line">
			<p class="cont_tit4">카테고리</p>
			<select name="cooktype" id="cooktype" style="width:200px;">
				<option value="종류별">종류별</option>
				<option value="메인반찬">메인반찬</option>
				<option value="밑반찬">밑반찬</option>
				<option value="국/탕">국/탕</option>
				<option value="찌개">찌개</option>
				<option value="간식/디저트">간식/디저트</option>
				<option value="면/만두">면/만두</option>
				<option value="밥/죽/떡">밥/죽/떡</option>
				<option value="퓨전">퓨전</option>
				<option value="김치/젓갈/장류">김치/젓갈/장류</option>
				<option value="양념/소스/잼">양념/소스/잼</option>
				<option value="양식">양식</option>
				<option value="샐러드/스프">샐러드/스프</option>
				<option value="베이킹">베이킹</option>
				<option value="차/음료/술">차/음료/술</option>
				<option value="기타">기타</option>
			</select>
			<select name="situation" id="situation" style="width:200px;">
				<option value="상황별">상황별</option>
				<option value="일상">일상</option>
				<option value="초스피드">초스피드</option>
				<option value="손님접대">손님접대</option>
				<option value="술안주">술안주</option>
				<option value="다이어트쿡">다이어트쿡</option>
				<option value="나들이">나들이</option>
				<option value="영양식">영양식</option>
				<option value="간식">간식</option>
				<option value="야식">야식</option>
				<option value="해장">해장</option>
				<option value="명절">명절</option>
				<option value="기타">기타</option>
			</select>
		</div>
		<br>
		<div class="cont_line" >
			<p class="cont_tit4">요리정보</p>
			인원<select name="person" id="person" style="width:100px;">
			<option value="1인">1인</option>
			<option value="2인">2인</option>
			<option value="3인">3인</option>
			<option value="4인">4인</option>
			<option value="5인">5인</option>
			<option value="6인이상">6인이상</option>
			</select>
		
			시간<select name="cooktime" id="cooktime">요리시간
			<option value="10분">10분</option>
			<option value="20분">20분</option>
			<option value="30분">30분</option>
			<option value="40분">40분</option>
			<option value="50분">50분</option>
			<option value="1시간이상">1시간이상</option>
			<option value="2시간이상">2시간이상</option>
			</select>
			난이도
			<select name="hardly" id="hardly" style="width:90px;">난이도
			<option value="아무나">아무나</option>
			<option value="초급">초급</option>
			<option value="중급">중급</option>
			<option value="고급">고급</option>
			</select>
		</div>
		</div>
		<div class="cont_box pad_l_60">
			<p class="cont_tit4">비용</p>
			<input type="text" name="pay" id="pay" style="width: 530px;"/>
			<br>
			<p class="cont_tit4">재료, 양념</p>
			<textarea name="material" id="material" cols="30" rows="10" class="textareas" style="height: 100px; width: 530px; resize: none;"></textarea>
		</div>
		<div class="cont_box pad_l_60">
			<p class="cont_tit4" style="width:670px;">요리순서</p>
				<div id="mystep">
						<p class="cont_tit2_1 ui-sortable-handle" style="vertical-align: middle;">Step1</p>
						<img id="step_img[0]" name="step_img[0]" class="imgs0" style="width: 160px; background-color: #f5f5f5; height: 160px; border-radius: 5px;"/>
						<textarea rows="5" cols="40" name="step[]" id="step[]"  class="textareas" style="height: 160px; width: 410px; resize: none;"></textarea>
						<input type="file" name="fileupload[0]" id="fileupload[0]" class="files0" onclick="JavaScript:preview(0)" style="background-color:white; border-color: white; width: 100px; float: right; display: inline-block;"/><br><br>
				</div>
			<input name="btnButton" id="btnButton" class="btn btn-default" type="button" value="(+) 순서추가" onClick="JavaScript:fncCreateElement();" style="background-color: white; border-color: white; cursor: pointer;">
			<!-- 요리순서를 추가하는 버튼 -->
		</div>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="../js/main_img.js"></script>
<script src="../js/step_img.js"></script>
		<script>
		var i=1;
			function fncCreateElement(){
				if(i==20){alert('더 이상 추가할 수 없습니다.'); return;}/* 20개를 넘어가면 더이상 추가할 수 없다 */
				   var mySpan = document.getElementById('mystep');
					
				   var myStepnum = document.createElement('p');/* 태그를 생성 */
				   var Stepnum = document.createTextNode("Step"+(i+1));/* p태그에 출력할 문자 생성 */
				   myStepnum.setAttribute('class', "cont_tit2_1 ui-sortable-handle");//속성설정
				   myStepnum.setAttribute('style', "vertical-align: middle;");//속성설정
				   myStepnum.appendChild(Stepnum);//문자 삽입
				   mystep.appendChild(myStepnum);//mySpan영역에 p태그를 추가한다
				  
				   
				   
				   var myElements = document.createElement('img');
				   myElements.setAttribute('name',"step_img["+i+"]");
					myElements.setAttribute('id',"step_img["+i+"]");
					myElements.setAttribute('class', "imgs"+i);
					myElements.setAttribute('style', "width: 160px; background-color: #f5f5f5; height: 160px; border-radius: 5px;");
					mystep.appendChild(myElements);
					
					 
					var myElement4 = document.createElement('textarea');
					myElement4.setAttribute('rows',"5");
					myElement4.setAttribute('cols',"40");
					/* myElement4.setAttribute('name',"step"+i);
					myElement4.setAttribute('id',"step"+i); */
					myElement4.setAttribute('name',"step[]");
					myElement4.setAttribute('id',"step[]"); 
					myElement4.setAttribute('class', "textareas");
					myElement4.setAttribute('style', "height: 160px; width: 410px; resize: none; margin-left: 4px;");
					mystep.appendChild(myElement4);	   
					
					var myElement1 = document.createElement('input');
					myElement1.setAttribute('type',"file");
					myElement1.setAttribute('name',"fileupload["+i+"]");
					myElement1.setAttribute('id',"fileupload["+i+"]");
					myElement1.setAttribute('class', "files"+i);
					myElement1.setAttribute('onclick', "JavaScript:preview("+i+")");
					myElement1.setAttribute('style', "background-color:white; width: 100px; float: right; border-color: white; display: inline-block;");
					mystep.appendChild(myElement1);
					//*** Remove Element ***//
					/*
					var deleteEle = document.getElementById('txt1');
					mySpan.removeChild(deleteEle);
					*/

				   var myElement2 = document.createElement('br');
					mystep.appendChild(myElement2);
				   var myElement3 = document.createElement('br');
					mystep.appendChild(myElement3);
					i++;/* i증가 */
				}
			
		</script>
		<div class="cont_box pad_l_60">
			<p>요리팁</p>
			<textarea rows="5" cols="80" class="textareas" id="tip" name="tip" style="resize:none;"></textarea>
		</div>
			<div class="regi_btn">
			<br>
				<input type="submit" value="작성하기" class="btn-lg btn-primary" style="background-color: #74b243"/>
				<input type="reset" value="취소하기" class="btn-lg btn-warning"/>
				<input type="button" value="뒤로가기" class="btn-lg btn-default" onclick="backtogo()"/>
				<script type="text/javascript">
				function backtogo(){
					history.back();
				};//function
				</script>
			<br>
			<br>
			</div>
		</div>
	</form>
</center>
</section>
</body>
</html>