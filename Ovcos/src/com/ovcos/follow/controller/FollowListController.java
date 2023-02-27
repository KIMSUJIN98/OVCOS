package com.ovcos.follow.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ovcos.common.model.vo.Pageinfo;
import com.ovcos.follow.model.service.FollowService;
import com.ovcos.follow.model.vo.Follow;

/**
 * Servlet implementation class FollowListController
 */
@WebServlet("/list.fw")
public class FollowListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//친구 리스트 select 받아와서 followListView에 뿌려주기 
		
		String userId = request.getParameter("userId");

		
		int listCount;		//현재 총 게시글 개수 저장용
		int currentPage; 	//현재 페이지 (즉, 사용자가 요청한 페이지)
		int pageLimit;		//페이지 하단에 보여질 페이징바의 페이지 최대 개수(몇개 단위씩 배치할건지) 1,2,3,4,....10개/ 5개
		int boardLimit;		//한 페이지 내에 보여질 게시글 최대 개수(몇개 단위씩) 15개씩, 20개씩
		
		//몇번 페이지를 요청했냐(currentPage)에 따라서 시작숫자, 끝 숫자가 달라짐 
		//4번선택시 pageLimit 시작숫자1, 끝숫자10 | 12번 선택시 11~20 
		//위의 4개를 가지고 아래의 3개의 값을 구해낼거임
		int maxPage;		//가장 마지막페이지 (총 페이지 수) 전체게시글에서 가장 끝
		int startPage; 		//페이징 바의 시작 수 4번선택시 1, 12번시 11
		int endPage; 		//페이징 바의 끝 수 4번선택시10, 12선택시 20
		
		//*listCount : 총 게시글 개수 
		listCount = new FollowService().selectListCount(userId);
				//보드 서비스로 이동
		
		//* currentPage : 현재 페이지 (즉, 사용자가 요청한 페이지) 
		// 메뉴바jsp에서 봴떄 cpage=1 로 키값으로 벨류를 담으면 1
		currentPage =  Integer.parseInt(request.getParameter("cpage"));
		//string뱉기떄문에 형변환 (키값);
		
		//* pageLimmit: 페이징 바의 페이지 최대 개수 (단위) 몇개씩
		pageLimit = 10;
		
		//* boardLimit : 게시글 최대 개수 (한페이지에 몇개보여줄거냐)
		boardLimit = 10;
		
		//맨위 4개의 변수를 가ㅣㅈ고 3개를 구해낼거임 => 이게 어려움
		/*
		 * *maxPage : 제일 마지막 페이지 수 ( 총 페이지 수)
		 * 
		 * listCount, boardLimit에 영향을 받음
		 * (100개의게시글을, 20개씩 주여주고싶음
		 * 
		 * ex) 게시글이 10개 단위 씩 보여진다는 가정하에
		 * listCount	boardLit					maxPage
		 *	100.0				10		->10.0			10
		 *	101.0				10		->10.1			11
		 * 	105.0				10		->10.5				11
		 * 110.0				10		->11.0				11
		 * 
		 * 리스트카운트로 보드리밋을 구하는방법 
		 * 	나누기로하면 101/10 하면 10나옴 (몫)
		 * 실수로 바꿈
		 * 더블나누기 int 하면 큰쪽으로 자동형변환 됨 
		 *	0이 아니면 무조건 올림 
		 *'**리스트카운터를 더블로 바꾸고 보드리밋으로 나누고 무조건 올림처리
		 *
		 *	* 게시글이 5개 단위씩 보여진다는 가정하에
		 * listCount	boardLit					maxPage                                                                     
		 *     10.0			5			->2.0			2
		 *     11.0			5			->2.1			3
		 *     14.0			5			->2.4			2
		 *     
		 *     maxPage = 올림처리(총 게시글 개수 (실수형) / boardLImit)                                                                                  
		 */
		
		maxPage = (int)Math.ceil((double)listCount/boardLimit);		
		
		
		/*
		 * * startPage : 페이징바의 시작수
		 * 
		 * pageLimit(21 22 23 24 25), currentPage(현재페이지 28번)에 영향을 받음
		 * 
		 * ex) 페이징바의 목록(pageLimit)이 10개 단위씩 이라는 가정하에 
		 * 		statPage : 1, 11, 21, 31, ...  페이지리밋으로 얘를 어케 구하지
		 * 						-> n * pageLimit +1
		 * 
		 *  currentPage(28) starPage
		 *  	1 				1	-> 0 * pageLimit + 1 	-> n = 0
		 *  	5				1	-> 0 * pageLimit +1 	-> n=0
		 *  	10번찍으면 		1 	-> 0 * pageLimit +1		-> n=0 (n은0이되어야함)
		 *  	
		 *  	11				11	-> 1 * pageLimit + 1 	-> n=1
		 *  	15				11 	-> 1 * pageLimit + 1 	-> n=1
		 *  	20				11 	-> 1 * pageLImit + 1	-> n=1
		 *  
		 *  1~10 사이에 있으면 n=0
		 *  11~20			n=1
		 *  21~30			n=2
		 *  
		 *  어케구하냐
		 *  currentPage-1	/pageLimit => n
		 *  0~9	/10 -> 0
		 *  11에서 1뺴서 10~10 / pageLimit => 1
		 *  20~29			/pageLimit -> 2
		 *  
		 *  startPage =n (n을 구하느게목적)n			*pageLimit +1 몬소리야
		 *  		   (currentPage -1) /pageLimit  * pageLimit +1 
		 *  
		 * 
		 */
		startPage = (currentPage-1)/pageLimit * pageLimit +1;
		
		
		/*
		 * * endPage : 페이징 바의 끝 수
		 * 
		 * startPage, pageLimit(10개씩)에 따라 영향을 받는다 (단, maxPage 에도 영향을 받긴함)
		 * 
		 * ex) pageLimit :10 가정하에 (1 2 3 4 5 6 7 8 9 10)
		 * startPage : 1	이면	=> endPage : 10
		 * startPage : 11		=> endPage : 20
		 * startPage : 21 		=> endPage : 30
		 *   
		 * 
		 */
		endPage = startPage + pageLimit -1;
		
		//문제 startPage 11이여서 endPage가 20으로 됨, (근데 maxPage가 고작 13밖에 안된다면?)-> 엔드페이지가 맥스페이지가 되야함
		if(endPage>maxPage) {//endPage가 maxPage보다 크면
			endPage = maxPage; //endPage를 maxpage로
		}
		
		// src com.kh.common.model.vo 에다가 PageInfo 로 저장할거임
		//* 페이징바를 만들 떄 필요한 객체 pageInfo에 넣어놓고 필요할때마다 쓰겠다~!
		Pageinfo pi = new Pageinfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//* 현재 요청한 페이지 (currentPage)에 보여질 게시글 리스트 boardLimit 수 만큼 조회해가기
		//페이지 누른순간 보드리밋만큼 조회되야함, 여러개으 ㅣ데이터가 뿌려져야하는ㄷ -> arraylist

		
		ArrayList<Follow> list = new FollowService().selectList(pi, userId);
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		//"list"라는 이름으로list 넘기는 거임 jsp로
		
		request.getRequestDispatcher("views/follow/followListView.jsp").forward(request, response);
		//한번도 본적없는 페이지니까 포워딩 방식으로 여기로 pi 넘김 
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
