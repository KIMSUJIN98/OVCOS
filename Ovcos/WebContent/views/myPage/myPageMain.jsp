<%@page import="com.ovcos.myPage.model.vo.MyPage"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/nav.jsp" %>
<% double monthDistance; 
   if(session.getAttribute("monthDistance") == null){
	   monthDistance = 0; 
   }else{
	   monthDistance = (double)session.getAttribute("monthDistance");
   }
%>
<%
   double calculations = 0;
   String calMsg;
   if(monthDistance>loginUser.getMemGoalDtn()){
   		calculations = monthDistance-loginUser.getMemGoalDtn();
   		calMsg = "목표치보다 " + calculations + "km 초과 달성했습니다!";
   }else if(monthDistance<loginUser.getMemGoalDtn()){
		calculations = loginUser.getMemGoalDtn()-monthDistance;
   		calMsg = "목표치까지 " + calculations +"km 남았습니다!";
   }else{
	   if(loginUser.getMemGoalDtn()== 0){
		   calMsg = "목표를 세워볼까요?";
	   }else{
	       calMsg = "목표치를 달성했습니다!";
	   }
   }
%>
<%
	ArrayList<MyPage> list = (ArrayList<MyPage>)session.getAttribute("dayList");
	String today = (String)session.getAttribute("today");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OVCOS - 마이페이지</title>
<link rel="stylesheet" href="<%= contextPath %>/resources/css/myPageStyle.css">

<!-- 페이징 연결자료 -->
<link rel="stylesheet" href="<%= contextPath %>/resources/css/paginate.css">
    <link rel="stylesheet" href="<%= contextPath %>/resources/css/ligne.css">
    <script type="text/javascript" src="<%= contextPath %>/resources/js/paginate.js"></script>

    <style>
        *{
            font-family: sans-serif;
        }
    </style>


</head>
<body>
	
	<div class="mp-wrap">
		
		<input type="hidden" name="userId" id="userId" value="<%= loginUser.getMemId() %>"> <!--로그인 아이디-->
		
        <!-- 배경이미지 및 프로필 관리 영역 -->
        <div class="mp-section1">
            <table id="back-table">
                <tr height="300" class="back-img" onclick ="window.open('views/myPage/resizeBackgroundImage.jsp')">
                    <td width="15%"></td>
                    <td width="100px"><img src="<%= contextPath %>/resources/image/mypage.png" alt="프로필이미지"></td>
                    <td id="name"><%= loginUser.getMemName() %> <span id="nick">(<%= loginUser.getMemNick() %>)</span></td>
                    <td></td>
                </tr>
                <tr height="50">
                    <td></td>
                    <td></td>
                    <td id="introduce">
                    	<% if(loginUser.getMemIntro() != null){ %>
                    			<%= loginUser.getMemIntro() %>
                    	<% } %>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>


        <!-- 운동기록 관리 영역 -->
        <div class="mp-section2">
            <div id="myHealth">
                <div class="sec2-blank"><!-- 상단 여백 --></div>
                <div id="display_list">
                    <div class="sec2-blank2">
                        <!-- 좌측 여백 -->
                    </div>
                    <div id="list_content">
                        <!-- 테두리 안에 들어가 있는 내용 -->
                        <h1>나의 운동로그</h1>
                        
                        
                    	
                    	<div id="inList_content">
                    	<!-- 하루에 운동기록피드를 많이 올리는 경우 100km를 넘을 수 있음 => 이때 막대 그래프는 100%로 설정하고, 아래 텍스트로 km를 알려주도록 한다. 그래프로 표시할 수 있는 하루 최대 km를 넘겼습니다! alertMsg-->
                    		<h4 align="center">이번주 운동기록</h4>
                    		<br>
                    		<div class="vertical_chart_box">
								 <div class="chart_box">
								 	<ul class="axis_y">
								    	<li class="item">0<span class="blind">km</span></li>
								     	<li class="item">10<span class="blind">km</span></li>
								     	<li class="item">20<span class="blind">km</span></li>
								     	<li class="item">30<span class="blind">km</span></li>
								     	<li class="item">40<span class="blind">km</span></li>
								     	<li class="item">50<span class="blind">km</span></li>
								 	</ul>
								   	<ul class="axis_x">
									   	<% for(int i=6; i>0; i--){ %>
									   		<% if((Integer.parseInt(today.substring(6))-i)>0){%>
									   		<% double a = 0; %>
										     	<li class="item">
										       		<div class="text_box">
										         		<strong class="day"><%= Integer.parseInt(today.substring(6))-i%>일</strong>
										         		<span class="time" style="height: 15px;">
										         		<%for(int j=0; j<list.size(); j++){ %>
										         			<%if(Integer.parseInt(list.get(j).getRunDate().substring(6))==(Integer.parseInt(today.substring(6))-i)){ %>
										         				<%=list.get(j).getDistance() %>km
										         				<% a = list.get(j).getDistance(); %>
										         			<%} %>
										         		<%} %>
										         		</span>
										       		</div>
										       		<button type="button" class="graph">
										         		<span class="time data1" style="height:<%=a*2%>%;"><span class="blind">data 타입 1</span></span>
										       		</button>
										     	</li>
									     	<% } %>
									     <% } %>
								     	
								      	<li class="item">
								        	<div class="text_box">
								          		<strong class="day sun">TODAY</strong>
								          		<span class="time" style="height: 15px;">
								          		<% double a = 0; %>
								         		<%for(int j=0; j<list.size(); j++){ %>
								         			<%if(Integer.parseInt(list.get(j).getRunDate().substring(6))==(Integer.parseInt(today.substring(6)))){ %>
								         				<%=list.get(j).getDistance() %>km
								         				<% a = list.get(j).getDistance(); %>
								         			<%} %>
								         		<%} %>
								         		</span>
								        	</div>
								        	<button type="button" class="graph">
								        		<span class="time data1" style="height:<%=a*2%>%;"><span class="blind">data 타입 1</span></span>
								        	</button>
								      	</li>
								      	
								    </ul>
								</div>                                                 
							</div>
                    	
                    	</div>
                    	
                    	<div id="inList_content_right">
                        	
                        	<br>
                        	
                       		<span>이번달 <%= loginUser.getMemNick() %>님의 목표기록은 <br></span>
                    		<b><%= loginUser.getMemGoalDtn() %>km</b>
                    		<span> 입니다. <br><br></span>
                    		<span>현재까지 달성한 총 러닝기록은 <br></span>
                    		<b><%= monthDistance %>km</b>
                    		<span>로, <br></span>
                    		<span><p><%= calMsg%></p></span>
                        	
                        	<br><br>
                        	
                        	<!-- modal 구동 버튼 (trigger) -->
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myGoal" style="margin-left: 20px; width: 280px;">목표설정</button>
							
							<!-- Modal -->
							<div class="modal fade" id="myGoal" tabindex="-1" role="dialog" aria-labelledby="myGoalLabel">
								<div class="modal-dialog" role="document">
							    	<div class="modal-content">
							      		<div class="modal-header">
							        		<h4 class="modal-title" id="myGoalLabel">목표설정</h4>
							        		<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							        			<span aria-hidden="true">&times;</span>
							        		</button>
							      		</div>
							      		
								      	<form action="<%= contextPath %>/goalSet.me" method="get">
								      	<div class="modal-body">
							      			<input type="hidden" id="goal-userId" name="goal-userId" value="<%= loginUser.getMemId()%>">
								      		목표 km를 입력하세요 : <input type="number" name="userGoal" id="userGoal" value="<%= loginUser.getMemGoalDtn()%>">
								      	</div>
								      	
								      	<div class="modal-footer">
								        	<button type="submit" class="btn btn-primary">저장하기</button>
								      	</div>
								      	</form>
							    	</div>
							  	</div>
							 </div>
							 
                    	
                    	</div>
                    	
                    	
                    </div>
                    <div class="sec2-blank2">
                        <!-- 우측 여백 -->
                    </div>
                </div>
                <div class="sec2-blank"><!-- 하단 여백--></div>
            </div>
        </div>

        <!-- 게시글 관리 영역 -->
        <div class="mp-section3">
            <div id="myActivity">
                <div class="sec2-blank"><!-- 상단 여백 --></div>
                <div id="activity_list">
                    <div class="sec2-blank2">
                        <!-- 좌측 여백 -->
                    </div>
                    <div id="activity_content">
                        <!-- 테두리 안에 들어가 있는 내용 -->

                        <div class="container">
                            <div>
                                <h1>조회</h1>
                            </div>
                            <div class="panel">
                                <div class="body">
                                    <div class="input-group">
                                        <label for="searchBox"></label>
                                        <input type="search" id="searchBox" style="width: 500px;" placeholder="키워드를 입력하세요">
                                        <a href="#" class="btn btn-secondary filter-btn" id="myFeed">피드조회</a>
                                        <a href="#" class="btn btn-secondary filter-btn" id="myComment">댓글조회</a>
                                        <a href="#" class="btn btn-secondary filter-btn" id="myPick">찜목록조회</a>
                                    </div>
                                </div>
                            </div>
                            <table class="myTable table hover">
                                <tbody>
                                <tr>
                                	<th>no.</th>
                                    <th>제목</th>
                                    <th>작성자</th>
                                    <th>작성일</th>
                                    <th>공개범위</th>
                                </tr>
                                
                                <tr>
                                    <td>카운트</td>
                                    <td><a>어디 뛰고 왔습니다</a></td>
                                    <td>닉네임</td>
                                    <td>2023-03-09</td>
                                    <td>전체공개</td>
                                </tr>
                                
                                </tbody>
                            </table>
                        </div>
                    </div>
                        

                    </div>
                    <div class="sec2-blank2">
                        <!-- 우측 여백 -->
                    </div>
                </div>
                <div class="sec2-blank"><!-- 하단 여백--></div>
            </div>







        <script>
            let options = {
                numberPerPage:10,
                goBar:true,
                pageCounter:true,
            };
        
            let filterOptions = {
                el:'#searchBox'
            };
        
            paginate.init('.myTable',options,filterOptions);
        </script>
        
        
        <!-- 푸터구역 -->
        <div id="footer">
            <div id="f1" align="center">
                <a href="#"><br>이용약관&nbsp;</a> 
                <a href="#">&nbsp;개인정보취급방침&nbsp;</a> 
                <a href="#">&nbsp;고객센터&nbsp;</a>
                <p style="margin-bottom: 0px;"> 
                	<br>© 2023 KH OVCOS<br>
                </p>
            </div>
        </div>


    </div>
</body>
</html>