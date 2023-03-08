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
                    <td id="introduce"><%= loginUser.getMemIntro() %></td>
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
								     	<li class="item">20<span class="blind">km</span></li>
								     	<li class="item">40<span class="blind">km</span></li>
								     	<li class="item">60<span class="blind">km</span></li>
								     	<li class="item">80<span class="blind">km</span></li>
								     	<li class="item">100<span class="blind">km</span></li>
								 	</ul>
								   	<ul class="axis_x">
								     	<li class="item">
								       		<div class="text_box">
								         		<strong class="day">01(수)</strong>
								         		<span class="time">87km</span>
								       		</div>
								       		<button type="button" class="graph">
								         		<span class="time data1" style="height:87%;"><span class="blind">data 타입 1</span></span>
								       		</button>
								     	</li>
								     	<li class="item">
								       		<div class="text_box">
								         		<strong class="day">02(목)</strong>
								         		<span class="time">50km</span>
								       		</div>
								       		<button type="button" class="graph">
								         		<span class="time data1" style="height:50%;"><span class="blind">data 타입 1</span></span>
								       		</button>
								     	</li>
								     	<li class="item">
								       		<div class="text_box">
								         		<strong class="day">03(금)</strong>
								         		<span class="time">100km</span>
								       		</div>
								       		<button type="button" class="graph">
								         		<span class="time data1" style="height:100%;"><span class="blind">data 타입 1</span></span>
								       		</button>
								     	</li>
								     	<li class="item">
								       		<div class="text_box">
								         		<strong class="day">04(토)</strong>
								         		<span class="time">100km</span>
								       		</div>
								       		<button type="button" class="graph">
								         		<span class="time data1" style="height:100%;"><span class="blind">data 타입 1</span></span>
								       		</button>
								     	</li>
								     	<li class="item">
								       		<div class="text_box">
								         		<strong class="day">05(일)</strong>
								         		<span class="time">40km</span>
								       		</div>
								       		<button type="button" class="graph">
								         		<span class="time data1" style="height:40%;"><span class="blind">data 타입 1</span></span>
								       		</button>
								     	</li>
								     	<li class="item">
								       		<div class="text_box">
								         		<strong class="day sat">06(월)</strong>
								         		<span class="time">20km</span>
								       		</div>
								       		<button type="button" class="graph">
								         		<span class="time data1" style="height:20%;"><span class="blind">data 타입 1</span></span>
								        	</button>
								      	</li>
								      	<li class="item">
								        	<div class="text_box">
								          		<strong class="day sun">TODAY</strong>
								          		<span class="time">0km</span>
								        	</div>
								        	<button type="button" class="graph"></button>
								      	</li>
								    </ul>
								</div>                                                 
							</div>
                    	
                    	</div>
                    	
                    	<div id="inList_content_right">
                    		<!-- 버튼 눌러서 모달로 목표 변경 -->
                        	<button type="button" id="btnSetGoal">목표설정</button>
                        	<input type="text" name="userGoal" id="userGoal" value="<%= loginUser.getMemGoalDtn() %>" style="padding-left: 10px" readonly>
                        	<br><br>
                        	
                    		<span>이번달 <%= loginUser.getMemNick() %>님의 목표기록은 <%= loginUser.getMemGoalDtn() %>km입니다. 현재까지 달성한 총 러닝기록은 <%= monthDistance %>km로, 목표치를 몇km 초과 달성했습니다! 목표치까지 몇km 남았습니다! </span>
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
                                        <a href="#" class="btn btn-primary filter-btn" id="myFeed">피드조회</a>
                                        <a href="#" class="btn btn-primary filter-btn" id="myComment">댓글조회</a>
                                        <a href="#" class="btn btn-primary filter-btn" id="myPick">찜목록조회</a>
                                    </div>
                                </div>
                            </div>
                            <table class="myTable table hover">
                                <tbody>
                                <tr>
                                    <th>USER ID</th>
                                    <th>ID</th>
                                    <th>TITTLE</th>
                                    <th>COMPLETED</th>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>delectus aut autem</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>quis ut nam facilis et officia qui</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>3</td>
                                    <td>fugiat veniam minus</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>4</td>
                                    <td>et porro tempora</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>5</td>
                                    <td>laboriosam mollitia et enim quasi adipisci quia provident illum</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>qui ullam ratione quibusdam voluptatem quia omnis</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>illo expedita consequatur quia in</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>8</td>
                                    <td>quo adipisci enim quam ut ab</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>9</td>
                                    <td>molestiae perspiciatis ipsa</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>illo est ratione doloremque quia maiores aut</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>11</td>
                                    <td>vero rerum temporibus dolor</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>ipsa repellendus fugit nisi</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>delectus aut autem</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>quis ut nam facilis et officia qui</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>3</td>
                                    <td>fugiat veniam minus</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>4</td>
                                    <td>et porro tempora</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>5</td>
                                    <td>laboriosam mollitia et enim quasi adipisci quia provident illum</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>qui ullam ratione quibusdam voluptatem quia omnis</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>illo expedita consequatur quia in</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>8</td>
                                    <td>quo adipisci enim quam ut ab</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>9</td>
                                    <td>molestiae perspiciatis ipsa</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>illo est ratione doloremque quia maiores aut</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>11</td>
                                    <td>vero rerum temporibus dolor</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>ipsa repellendus fugit nisi</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>delectus aut autem</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>quis ut nam facilis et officia qui</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>3</td>
                                    <td>fugiat veniam minus</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>4</td>
                                    <td>et porro tempora</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>5</td>
                                    <td>laboriosam mollitia et enim quasi adipisci quia provident illum</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>qui ullam ratione quibusdam voluptatem quia omnis</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>illo expedita consequatur quia in</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>8</td>
                                    <td>quo adipisci enim quam ut ab</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>9</td>
                                    <td>molestiae perspiciatis ipsa</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>illo est ratione doloremque quia maiores aut</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>11</td>
                                    <td>vero rerum temporibus dolor</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>ipsa repellendus fugit nisi</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>delectus aut autem</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>quis ut nam facilis et officia qui</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>3</td>
                                    <td>fugiat veniam minus</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>4</td>
                                    <td>et porro tempora</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>5</td>
                                    <td>laboriosam mollitia et enim quasi adipisci quia provident illum</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>qui ullam ratione quibusdam voluptatem quia omnis</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>illo expedita consequatur quia in</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>8</td>
                                    <td>quo adipisci enim quam ut ab</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>9</td>
                                    <td>molestiae perspiciatis ipsa</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>illo est ratione doloremque quia maiores aut</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>11</td>
                                    <td>vero rerum temporibus dolor</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>ipsa repellendus fugit nisi</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>1</td>
                                    <td>delectus aut autem</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>2</td>
                                    <td>quis ut nam facilis et officia qui</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>3</td>
                                    <td>fugiat veniam minus</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>4</td>
                                    <td>et porro tempora</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>5</td>
                                    <td>laboriosam mollitia et enim quasi adipisci quia provident illum</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>6</td>
                                    <td>qui ullam ratione quibusdam voluptatem quia omnis</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>7</td>
                                    <td>illo expedita consequatur quia in</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>8</td>
                                    <td>quo adipisci enim quam ut ab</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>9</td>
                                    <td>molestiae perspiciatis ipsa</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>illo est ratione doloremque quia maiores aut</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>11</td>
                                    <td>vero rerum temporibus dolor</td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td>1</td>
                                    <td>12</td>
                                    <td>ipsa repellendus fugit nisi</td>
                                    <td></td>
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
        
        
        <!-- footer 영역 -->
        <div class="mp-section4">
            
        </div>

    </div>

</body>
</html>