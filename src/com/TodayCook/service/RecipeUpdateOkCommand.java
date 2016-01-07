package com.TodayCook.service;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.TodayCook.DAO.JoinDAO;
import com.TodayCook.DAO.RecipeDAO2;
import com.TodayCook.VO.CookStepVO;
import com.TodayCook.VO.RecipeVO;
import com.TodayCook.command.RecipeCommand;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class RecipeUpdateOkCommand implements RecipeCommand{
	//레시피 수정완료 시 실행되는 command

	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("커맨드 진입");
		HttpSession session = request.getSession(); //세션 생성
		
		request.setCharacterEncoding("utf-8");
		String savePath = request.getServletContext().getRealPath("recipeImg");
		int sizeLimit = 1024*1024*5;
		
		//파일이 포함되어 있기 때문에 multipartrequest를 사용한다
		MultipartRequest mr = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		System.out.println(savePath);
		
		String title = mr.getParameter("title"); //레시피 제목을 받는다
		String image = mr.getFilesystemName("image"); //레시피 대표 이미지를 받는다
		if(image==null) {//image값이 변경되지 않았을때 원래 있던 기존의 이미지를 가져온다.
			image=mr.getParameter("m_img");
		}
		String cooktype = mr.getParameter("cooktype"); //요리 종류
		String situation = mr.getParameter("situation"); //요리 상황
		String person = mr.getParameter("person"); //인원수
		String cooktime = mr.getParameter("cooktime"); //요리 시간
		String material = mr.getParameter("material"); //요리 재료
		String hardly = mr.getParameter("hardly"); //난이도
		String tip = mr.getParameter("tip"); //요리 팁
		String pay = mr.getParameter("pay"); //요리 비용
		int mnum = (int) session.getAttribute("mnum"); //세션에서 로그인한 회원번호를 받는다
		

		String stepcontent[] = mr.getParameterValues("step[]");//배열로 받아온다
		System.out.println(title);
		System.out.println(image);
		System.out.println(cooktype);
		System.out.println(situation);
		System.out.println(person);
		System.out.println(cooktime);
		System.out.println(material);
		System.out.println(hardly);
		System.out.println(tip);
		System.out.println(pay);
		for(int i=0;i<stepcontent.length;i++) { //확인용
			System.out.println(stepcontent[i]+i);
			if(stepcontent[i]==null) break;
		}
		
		Enumeration<String> fileupload = mr.getFileNames();
		String[] files = new String[20];
		for(int i=0;i<stepcontent.length;i++) { //설명 배열 길이만큼 돌면서
			files[i] = mr.getFilesystemName("fileupload["+i+"]"); //이미지를 files[]에 담는다
			if(mr.getFilesystemName("fileupload["+i+"]")==null) { //사용자가 요리순서에 대한 이미지를 수정 안했을 경우
				files[i]=mr.getParameter("h_img"+i); //hidden으로 숨겨져 있던 사용자의 원래 이미지를 받는다
			}
			System.out.println("cnt  f:"+i);
			System.out.println("files["+i+"] :" + files[i]);
		}
		int num = Integer.parseInt(mr.getParameter("num")); //레시피 번호를 받는다
		RecipeVO vo = new RecipeVO(num, title, situation, material, cooktime, hardly, person, tip, image, pay, mnum, cooktype);
		
		RecipeDAO2 dao = RecipeDAO2.getInstance(); //DB접속
		dao.update(vo); //레시피 수정
		String images, contents;
		for(int i=0;i<stepcontent.length;i++) {
			images=files[i]; //이미지를 넣어준다
			contents=stepcontent[i];//타입을 맞춰주기 위해 배열의 값을 하나씩 넣어준다
			System.out.println(images+"\t"+contents);
			CookStepVO cVO = new CookStepVO(num, i+1,images,contents); //cVO에 담는다
			/*if(i==0) {
				dao.CookStepupdatedel(cVO, vo);
			}*/
			dao.CookStepupdate(cVO, vo);//새로 순서를 insert한다.
		}
	}//recipe
	
}
