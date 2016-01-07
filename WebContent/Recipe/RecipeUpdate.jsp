<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="../error/error404.jsp"  %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="../include/cdn.jsp" %>
<title>레시피 입력 페이지</title>
<link rel="stylesheet" type="text/css" href="./css/recipe.css">
<link href="${pageContext.request.contextPath}/img/favicon.ico" rel="shortcut icon" type="image/x-icon">
<script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="./js/index.js"></script>
</head>
<body>
<header>
<%@include file="../include/headerOrigin.jsp" %>
</header>
<c:set var="Recipe" value="${Recipe }"/>
<c:set var="Step" value="${Step }"/>
<c:set var="User" value="${User }"/>
<section>

<center>

   <form action="./recipeupdate.recipe?num=${Recipe.getNum() }" method="post" enctype="multipart/form-data">
      <div class="cont_box pad_l_60">
         <div class="regi_title">레시피 등록</div>
         <div name="num" id="num" style="visibility: hidden;">${Recipe.getNum() }</div>
         <!-- 현재 수정하는 레시피 번호를  -->
         <div id="divMainPhotoUpload" class="cont_pic2">
            <br>
            <img src="${pageContext.request.contextPath}/recipeImg/${Recipe.getImage()}" id="img_preview" name="img_preview" style="width: 200px; background-color: #f5f5f5; height: 200px; background-color: AEAAAA; border-radius: 5px; box-shadow: 5px 5px gray;" value="${pageContext.request.contextPath}/recipeImg/${Recipe.getImage()}" >
            <br>
            <br>
            <input type="file" id="image" name="image" style="background-color: white; width: 100px; border-color: white;">
            <input type="hidden" name="m_img" id="m_img" value="${Recipe.getImage()}"/></input>
         	<!-- 이미지가 바뀌지 않았을 경우 이미지 값을 넘겨준다 -->
         </div>   
         <div class="cont_line">
         <p class="cont_tit4">레시피 제목</p>
         <input type="text" name="title" id="title" style="width: 410px;" value="${Recipe.getTitle() }">
         
         </div>
      <br>
      <div class="cont_line">
         <p class="cont_tit4">카테고리</p>
        <select name="cooktype" id="cooktype" style="width:200px;">         
            <c:set var="cooktype" value="${Recipe.getCooktype() }"></c:set>
            <option value="종류별">종류별</option>
            <c:if test="${cooktype=='메인반찬'}"> <!-- cooktype이 option의 value와 동일하다면 선택된 option이 출력된다 -->
               <option value="메인반찬" selected="selected">메인반찬</option>
            </c:if>
            <c:if test="${cooktype!='메인반찬'}">
               <option value="메인반찬">메인반찬</option>
            </c:if>
            <c:if test="${cooktype=='밑반찬'}">
               <option value="밑반찬" selected="selected">밑반찬</option>
            </c:if>
            <c:if test="${cooktype!='밑반찬'}">
               <option value="밑반찬">밑반찬</option>
            </c:if>
            <c:if test="${cooktype=='국/탕'}">
               <option value="국/탕" selected="selected">국/탕</option>
            </c:if>
            <c:if test="${cooktype!='국/탕'}">
               <option value="국/탕">국/탕</option>
            </c:if>
            <c:if test="${cooktype=='찌개'}">
               <option value="찌개" selected="selected">찌개</option>
            </c:if>
            <c:if test="${cooktype!='찌개'}">
               <option value="찌개">찌개</option>
            </c:if>
            <c:if test="${cooktype=='간식/디저트'}">
               <option value="간식/디저트" selected="selected">간식/디저트</option>
            </c:if>
            <c:if test="${cooktype!='간식/디저트'}">
               <option value="간식/디저트">간식/디저트</option>
            </c:if>
            <c:if test="${cooktype=='면/만두'}">
               <option value="면/만두" selected="selected">면/만두</option>
            </c:if>
            <c:if test="${cooktype!='면/만두'}">
               <option value="면/만두">면/만두</option>
            </c:if>
            <c:if test="${cooktype=='밥/죽/떡'}">
               <option value="밥/죽/떡" selected="selected">밥/죽/떡</option>
            </c:if>
            <c:if test="${cooktype!='밥/죽/떡'}">
               <option value="밥/죽/떡">밥/죽/떡</option>
            </c:if>
            <c:if test="${cooktype=='퓨전'}">
               <option value="퓨전" selected="selected">퓨전</option>
            </c:if>
            <c:if test="${cooktype!='퓨전'}">
               <option value="퓨전">퓨전</option>
            </c:if>
            <c:if test="${cooktype=='김치/젓갈/장류'}">
               <option value="김치/젓갈/장류" selected="selected">김치/젓갈/장류</option>
            </c:if>
            <c:if test="${cooktype!='김치/젓갈/장류'}">
               <option value="김치/젓갈/장류">김치/젓갈/장류</option>
            </c:if>
            <c:if test="${cooktype=='양념/소스/잼'}">
               <option value="양념/소스/잼" selected="selected">양념/소스/잼</option>
            </c:if>
            <c:if test="${cooktype!='양념/소스/잼'}">
               <option value="양념/소스/잼">양념/소스/잼</option>
            </c:if>
            <c:if test="${cooktype=='양식'}">
               <option value="양식" selected="selected">양식</option>
            </c:if>
            <c:if test="${cooktype!='양식'}">
               <option value="양식">양식</option>
            </c:if>
            <c:if test="${cooktype=='샐러드/스프'}">
               <option value="샐러드/스프" selected="selected">샐러드/스프</option>
            </c:if>
            <c:if test="${cooktype!='샐러드/스프'}">
               <option value="샐러드/스프">샐러드/스프</option>
            </c:if>
            <c:if test="${cooktype=='베이킹'}">
               <option value="베이킹" selected="selected">베이킹</option>
            </c:if>
            <c:if test="${cooktype!='베이킹'}">
               <option value="베이킹">베이킹</option>
            </c:if>
            <c:if test="${cooktype=='차/음료/술'}">
               <option value="차/음료/술" selected="selected">차/음료/술</option>
            </c:if>
            <c:if test="${cooktype!='차/음료/술'}">
               <option value="차/음료/술">차/음료/술</option>
            </c:if>
            <c:if test="${cooktype=='기타'}">
               <option value="기타" selected="selected">기타</option>
            </c:if>
            <c:if test="${cooktype!='기타'}">
               <option value="기타">기타</option>
            </c:if>

         </select>
         
         <select name="situation" id="situation" style="width:200px;">
            <c:set var="situation" value="${Recipe.getSituation()}"></c:set>
            <option value="상황별">상황별</option>
            <c:if test="${situation=='일상'}">
               <option value="일상" selected="selected">일상</option>
            </c:if>
            <c:if test="${situation!='일상'}">
               <option value="일상">일상</option>
            </c:if>
            <c:if test="${situation=='초스피드'}">
               <option value="초스피드" selected="selected">초스피드</option>
            </c:if>
            <c:if test="${situation!='초스피드'}">
               <option value="초스피드">초스피드</option>
            </c:if>
            <c:if test="${situation=='손님접대'}">
               <option value="손님접대" selected="selected">손님접대</option>
            </c:if>
            <c:if test="${situation!='손님접대'}">
               <option value="손님접대">손님접대</option>
            </c:if>
            <c:if test="${situation=='술안주'}">
               <option value="술안주" selected="selected">술안주</option>
            </c:if>
            <c:if test="${situation!='술안주'}">
               <option value="술안주">술안주</option>
            </c:if>
            <c:if test="${situation=='다이어트쿡'}">
               <option value="다이어트쿡" selected="selected">다이어트쿡</option>
            </c:if>
            <c:if test="${situation!='다이어트쿡'}">
               <option value="다이어트쿡">다이어트쿡</option>
            </c:if>
            <c:if test="${situation=='나들이'}">
               <option value="나들이" selected="selected">나들이</option>
            </c:if>
            <c:if test="${situation!='나들이'}">
               <option value="나들이">나들이</option>
            </c:if>
            <c:if test="${situation=='영양식'}">
               <option value="영양식" selected="selected">영양식</option>
            </c:if>
            <c:if test="${situation!='영양식'}">
               <option value="영양식">영양식</option>
            </c:if>
            <c:if test="${situation=='간식'}">
               <option value="간식" selected="selected">간식</option>
            </c:if>
            <c:if test="${situation!='간식'}">
               <option value="간식">간식</option>
            </c:if>
            <c:if test="${situation=='야식'}">
               <option value="야식" selected="selected">야식</option>
            </c:if>
            <c:if test="${situation!='야식'}">
               <option value="야식">야식</option>
            </c:if>
            <c:if test="${situation=='해장'}">
               <option value="해장" selected="selected">해장</option>
            </c:if>
            <c:if test="${situation!='해장'}">
               <option value="해장">해장</option>
            </c:if>
            <c:if test="${situation=='명절'}">
               <option value="명절" selected="selected">명절</option>
            </c:if>
            <c:if test="${situation!='명절'}">
               <option value="명절">명절</option>
            </c:if>
            <c:if test="${situation=='기타'}">
               <option value="기타" selected="selected">기타</option>
            </c:if>
            <c:if test="${situation!='기타'}">
               <option value="기타">기타</option>
            </c:if>
         </select>
      </div>
      <br>
      <div class="cont_line" >
         <p class="cont_tit4">요리정보</p>
         <p class="cont_tit4">요리정보</p>
         인원<select name="person" id="person" style="width:100px;">
         <c:set var="person" value="${Recipe.getPerson() }"></c:set>
         <c:if test="${person=='1인'}">
            <option value="1인" selected="selected">1인</option>
         </c:if>
         <c:if test="${person!='1인'}">
            <option value="1인">1인</option>
         </c:if>
         <c:if test="${person=='2인'}">
            <option value="2인" selected="selected">2인</option>
         </c:if>
         <c:if test="${person!='2인'}">
            <option value="2인">2인</option>
         </c:if>
         <c:if test="${person=='3인'}">
            <option value="3인" selected="selected">3인</option>
         </c:if>
         <c:if test="${person!='3인'}">
            <option value="3인">3인</option>
         </c:if>
         <c:if test="${person=='4인'}">
            <option value="4인" selected="selected">4인</option>
         </c:if>
         <c:if test="${person!='4인'}">
            <option value="4인">4인</option>
         </c:if>
         <c:if test="${person=='5인'}">
            <option value="5인" selected="selected">5인</option>
         </c:if>
         <c:if test="${person!='5인'}">
            <option value="5인">5인</option>
         </c:if>
         <c:if test="${person=='6인'}">
            <option value="6인" selected="selected">6인</option>
         </c:if>
         <c:if test="${person!='6인'}">
            <option value="6인">6인</option>
         </c:if>
         <c:if test="${person=='6인이상'}">
            <option value="6인이상" selected="selected">6인이상</option>
         </c:if>
         <c:if test="${person!='6인이상'}">
            <option value="6인이상">6인이상</option>
         </c:if>
         </select>
      
         시간<select name="cooktime" id="cooktime">요리시간
         <c:set var="cooktime" value="${Recipe.getCooktime() }"></c:set>
         <c:if test="${cooktime=='10분'}">
            <option value="10분" selected="selected">10분</option>
         </c:if>
         <c:if test="${cooktime!='10분'}">
            <option value="10분">10분</option>
         </c:if>
         
         <c:if test="${cooktime=='20분'}">
            <option value="20분" selected="selected">20분</option>
         </c:if>
         <c:if test="${cooktime!='20분'}">
            <option value="20분">20분</option>
         </c:if>
         
         <c:if test="${cooktime=='30분'}">
            <option value="30분" selected="selected">30분</option>
         </c:if>
         <c:if test="${cooktime!='30분'}">
            <option value="30분">30분</option>
         </c:if>
         
         <c:if test="${cooktime=='40분'}">
            <option value="40분" selected="selected">40분</option>
         </c:if>
         <c:if test="${cooktime!='40분'}">
            <option value="40분">40분</option>
         </c:if>
         
         <c:if test="${cooktime=='50분'}">
            <option value="50분" selected="selected">50분</option>
         </c:if>
         <c:if test="${cooktime!='50분'}">
            <option value="50분">50분</option>
         </c:if>
         
         <c:if test="${cooktime=='1시간이상'}">
            <option value="1시간이상" selected="selected">1시간이상</option>
         </c:if>
         <c:if test="${cooktime!='1시간이상'}">
            <option value="1시간이상">1시간이상</option>
         </c:if>
         
         <c:if test="${cooktime=='2시간이상'}">
            <option value="2시간이상" selected="selected">2시간이상</option>
         </c:if>
         <c:if test="${cooktime!='2시간이상'}">
            <option value="2시간이상">2시간이상</option>
         </c:if>
         </select>
         난이도
         <select name="hardly" id="hardly" style="width:90px;">난이도
            <c:set var="hardly" value="${Recipe.getHardly()}"></c:set>
            <c:if test="${hardly=='아무나'}">
               <option value="아무나" selected="selected">아무나</option>
            </c:if>
            <c:if test="${hardly!='아무나'}">
               <option value="아무나">아무나</option>
            </c:if>
            <c:if test="${hardly=='초급'}">
               <option value="초급" selected="selected">초급</option>
            </c:if>
            <c:if test="${hardly!='초급'}">
               <option value="초급">초급</option>
            </c:if>
            <c:if test="${hardly=='중급'}">
               <option value="중급" selected="selected">중급</option>
            </c:if>
            <c:if test="${hardly!='중급'}">
               <option value="중급">중급</option>
            </c:if>
            <c:if test="${hardly=='고급'}">
               <option value="고급" selected="selected">고급</option>
            </c:if>
            <c:if test="${hardly!='고급'}">
               <option value="고급">고급</option>
            </c:if>
         </select>
      </div>
      </div>
      <div class="cont_box pad_l_60">
         <p class="cont_tit4">비용</p>
         <input type="text" name="pay" id="pay" style="width: 530px;" value="${Recipe.getPay() }"/>
         <br>
         <p class="cont_tit4">재료, 양념</p>
         <textarea name="material" id="material" cols="30" rows="10" class="textareas" style="height: 100px; width: 530px; resize: none;">${Recipe.getMaterial() }</textarea>
      </div>
      <div class="cont_box pad_l_60">
         <p class="cont_tit4" style="width:670px;">요리순서</p>
            <div id="mystep">               
			<c:set var="i" value="0"/>
               <c:forEach items="${Step}" var="s" varStatus="status">
                  <p class="cont_tit2_1 ui-sortable-handle" style="vertical-align: middle;">Step${i+1}</p>
                  <img src="${pageContext.request.contextPath}/recipeImg/${s.getImage()}" 
                  id="step_img[${i }]" name="step_img[${i }]" class="imgs${i }" 
                  style="width: 160px; background-color: #f5f5f5; height: 160px; border-radius: 5px;"/>
                  <textarea rows="5" cols="40" name="step[]" id="step[]"  class="textareas" 
                  style="height: 160px; width: 410px; resize: none;">${s.getContents()}</textarea>
                                    
                  <input type="file" name="fileupload[${i}]" id="fileupload[${i}]" 
                  class="files${i}" onclick="JavaScript:preview(${i})" style="background-color:white; 
                  border-color: white; width: 100px; float: right; display: inline-block;">
                  <input type="hidden" name="h_img${i }" id="h_img${i }" value="${s.getImage()}"/></input><br><br>
            	<c:set var="i" value="${i+1 }"/>
                   <!-- 원래 있던 순서까지 for문이 돈다 -->
               </c:forEach>
              </div>
         <input name="btnButton" id="btnButton" class="btn btn-default" type="button" value="(+) 순서추가" onClick="JavaScript:fncCreateElement();" style="background-color: white; border-color: white; cursor: pointer;">
         <br><p>요리순서는 20개까지만 추가할 수 있습니다.</p>
      </div>
<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="./js/main_img.js"></script>
<script src="./js/step_img.js"></script>
      <script>
      var j= ${i };//j는 i+1이다
      
      console.log(j);
         function fncCreateElement(){ //요리순서에 관련된 element들 추가하는 function.
            console.log(j);
            
            if(j>20){alert('더 이상 추가할 수 없습니다.'); return;}
               var mySpan = document.getElementById('mystep');
               
               var myStepnum = document.createElement('p');
               var Stepnum = document.createTextNode("Step"+(j+1));
               myStepnum.setAttribute('class', "cont_tit2_1 ui-sortable-handle");
               myStepnum.setAttribute('style', "vertical-align: middle;");
               myStepnum.appendChild(Stepnum);
               mystep.appendChild(myStepnum);
              
               
               
               var myElements = document.createElement('img');
               myElements.setAttribute('name',"step_img["+j+"]");
               myElements.setAttribute('id',"step_img["+j+"]");
               myElements.setAttribute('class', "imgs"+j);
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
               myElement1.setAttribute('name',"fileupload["+j+"]");
               myElement1.setAttribute('id',"fileupload["+j+"]");
               myElement1.setAttribute('class', "files"+j);
               myElement1.setAttribute('onclick', "JavaScript:preview("+j+")");
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
               j++;
            }
         
      </script>
      <div class="cont_box pad_l_60">
         <p>요리팁</p>
         <textarea rows="5" cols="80" class="textareas" id="tip" name="tip" style="resize:none;">${Recipe.getTip() }</textarea>
      </div>
         <div class="regi_btn">
         <br>
            <input type="submit" value="수정하기" class="btn-lg btn-primary" style="background-color: #74b243"/>
            <input type="reset" value="취소하기" class="btn-lg btn-warning"/>
            <input type="button" value="뒤로가기" class="btn-lg btn-default" onclick="history.go(-1)"/>
         <br>
         <br>
         </div>
      </div>
   </form>
</center>
</section>
</body>
</html>