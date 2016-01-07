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

public class RecipeOkCommand implements RecipeCommand{
	//레시피 작성 시 실행되는 command

	@Override
	public void recipe(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("커맨드 진입");
		HttpSession session = request.getSession(); //세션을 생성한다
		
		request.setCharacterEncoding("utf-8");
		
		//Meta Data
		String savePath = request.getServletContext().getRealPath("recipeImg");
		
		int sizeLimit = 1024*1024*100; //100mb
		
		//file이 포함되어 있기 때문에 MultipartRequest를 사용해야 한다
		MultipartRequest mr = new MultipartRequest(request, savePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
		System.out.println(savePath);
		
		//System.out.println("파라미터를 받자받자");
		String title = mr.getParameter("title"); //레시피 제목
		String image = mr.getFilesystemName("image"); //레시피 대표 사진
		String cooktype = mr.getParameter("cooktype"); //레시피 요리 재료
		String situation = mr.getParameter("situation"); //레시피 요리 상황
		String person = mr.getParameter("person"); //인원수
		String cooktime = mr.getParameter("cooktime"); //요리 시간
		String material = mr.getParameter("material"); //요리 재료
		String hardly = mr.getParameter("hardly"); //난이도
		String tip = mr.getParameter("tip"); //요리 팁
		String pay = mr.getParameter("pay"); //요리에 드는 비용
		int mnum = (int) session.getAttribute("mnum"); //세션의 회원 번호를 받는다
		Enumeration<String> fileupload = mr.getFileNames(); //Enumeration형으로 받아온다 => 
		int st = 0;
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
		
		for(int i=0;i<stepcontent.length;i++) { //배열에 담긴 크기만큼 반복한다(제대로 담겼는지 확인용)
			System.out.println(stepcontent[i]+i);
			if(stepcontent[i]==null) break; //비어있는 값을 만났을 때 반복을 멈춘다
		}
		
		
		String[] files = new String[20]; //요리순서에 해당하는 사진은 최대 20개까지만 가능하다
		for(int i=0;i<stepcontent.length;i++) {//enumeration에 담긴 파일 업로드에 값이 존재할 때까지
			files[i] = mr.getFilesystemName("fileupload["+i+"]"); //fileupload 배열에 해당하는 값을 files[]에 담는다
			if(mr.getFilesystemName("fileupload["+i+"]")==null) break;//fileupload에 값이 없을경우 while문을 탈출한다
			System.out.println("cnt :"+i);
			System.out.println("files["+i+"] :" + files[i]);
		}
		
		//레시피 vo에 해당 내용을 담는다
		RecipeVO vo = new RecipeVO(title, situation, material, cooktime, hardly, person, tip, image, pay, mnum, cooktype);
		
		RecipeDAO2 dao = RecipeDAO2.getInstance();//DB접속!
		dao.insert(vo);//레시피 내용을 DB에 넣는다
		String images, contents;
		//요리 순서에 해당하는 내용을 담는다
		for(int i=0;i<stepcontent.length;i++) {
			images=files[i]; //요리순서 이미지
			contents=stepcontent[i]; //요리순서 설명
			//배열의 값을 하나씩 가져온다
			System.out.println(images+"\t"+contents);
			CookStepVO cVO = new CookStepVO(i+1,images,contents); //요리순서, 이미지, 설명을 순차적으로 cVO에 담는다
			dao.CookStepinsert(cVO); //순차적으로 담긴 cVO을 요리순서 DB에 담는다
		}
	}//recipe
	
}
