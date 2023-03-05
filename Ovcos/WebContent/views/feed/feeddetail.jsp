<%@page import="com.ovcos.feed.model.vo.Feeddetails"%>
<%@page import="com.ovcos.feed.model.vo.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 
    	Feeddetails f = (Feeddetails)request.getAttribute("f"); 
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/exMy.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feeddetail2.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>
<%-- <%= contextPath %>'/views/feeddetail2.jsp' --%>


</head>
<body>
<%@ include file="../common/nav.jsp" %>

    <div id="course">
        <div id="left" class="floatWrap" > 
            <div id="feed1">
                <div style="border-bottom: 1px solid black;">
                    <div  id="feeds" >피드 상세</div>
                </div>
            </div>
            
            <div id="mypage1" >
                
                <span style="margin-left:15px; ">
                    <img width="40px;"style="border-radius: 50%;" src="${pageContext.request.contextPath}/resources/image/mypage.png">
                    <br>
                      
                </span>
                <span>
                    <div>
                        <b id="name"><%=f.getMemId()%></b>
                    </div>
    
                    <div>
                        <div id="detail"><%=f.getFeedDate()%></div>
                    </div>
                    <div style="display: flex; padding-left: 10px; ">
                        <div id="eval">
                            <img src="${pageContext.request.contextPath}/resources/image/eval.png" style="width: 20px; padding-top: 2px;" alt="">
                        </div>
                        <div style="padding-left: 3px;"><%=f.getFeedEval()%></div> 
                    </div>
                </span>
            </div>
            <!-- 조회수, 찜, 다운로든 -->
            <div style="border-bottom: 1px solid black;  padding-left: 15px;display: flex; padding-bottom: 15px;">
                <div>
                    <img id="eye" src="${pageContext.request.contextPath}/resources/image/eye.png" alt="">
                </div>
                <div style="padding-left: 5px;"><%=f.getHit() %></div>
                <div>
                    <img style="box-sizing: none;" id="love" src="${pageContext.request.contextPath}/resources/image/love.png" alt="">
                </div>
                <div style="padding-left: 5px;"><%=f.getWishCount() %></div>
                
                <div style="margin-left: 150px;">
                    <a download="<%=f.getOriginName()%>" href="<%=contextPath%>/resources/gpx_upfiles/<%=f.getChangeName()%>"><img  id="download1" src="${pageContext.request.contextPath}/resources/image/download.png" style="width: 17px;" alt=""></a>
                </div>
                
            </div>
            
                
            <!-- 피드 내용 -->
            <div id="run" align="center">
                <div style="font-weight: 900;">피드 제목</div>
                
            </div> 
                <div align="center" id="feedt" style="border-bottom: 1px solid black;">
                    <%=f.getFeedTitle() %>
                </div>

            <div id="run" align="center" style="border-bottom: 1px solid black;">
                <b>피드 내용</b>
                
            </div>
            <div id="distance" style="border-bottom: 1px solid black;">
                
                <div style="padding-left: 15px; height: 150px;">
                    <%=f.getFeedCnt() %>
                </div>
            </div>

            <div id="run" align="center" style="border-bottom: 1px solid black;">
                <b>운동기록</b>
            </div>
            <div id="distance" style="border-bottom: 1px solid black;">
                <div>
                    <b style="padding-left: 15px;">운동거리 : <%=f.getDistance()%>KM</b>
    
                </div>
                <br>
                <div>
                    <b style="padding-left: 15px;">시작위치 : (<%= f.getStartLat()%>, <%=f.getStartLon() %>)</b>
                </div>
            </div>
            <!-- 댓글 구간 -->
            <div id="com" style="height: 280px;  height:20%; overflow: auto; padding-left: 10px;">
               <table>
               	
               
               </table>
                
            </div>
           
                <div id="reply-area">
                    <table style="margin: auto;">
                        <thead> 
                            <tr>
                                <th id="fontth">댓글</th>
                                <td style="padding-right: 0;">
                                    <input  type="text" id="feed_cmn_cnt"  style="resize: none; margin-top: 5px; width: 320px;"></input>
                                </td>
                                <td style="padding-right: 0;"><button onclick="insertReply();" id="btn00" type="submit" class="btn btn-sm btn-info">전송</button></td>
                            </tr>
                        </thead>
                        <tbody>
                            
                        </tbody>
                    </table>
                </div>
  
            <script>
             
            
            $(function () {
            	selectdetail2();
               // setInterval(selectdetail2, 1000);
            })
            
            $(document).keyup(function (e) {
                if ($("#feed_cmn_cnt").is(":focus") && (e.keyCode == 13)) {
                    // Do something
                    insertReply();
                }
            });

            function insertReply() {
                $.ajax({
                    url: "insertcomm.de",
                    data: {
                    	feed_index: <%= f.getFeedIndex()%>,
                    	feed_cmn_id: "<%= loginUser.getMemId()%>",
                    	feed_cmn_cnt: $("#feed_cmn_cnt").val()
            },
                    type: "post",
                    success: function (result) {
                        if (result > 0) { //댓글 작성 성공
                        	selectdetail2();
                            $("#feed_cmn_cnt").val("");
                        }
                    },
                    error: function () {
                        console.log("댓글 작성용 ajax 통신 실패");
                    }
                })
            }
            
            function selectdetail2() {
                $.ajax({
                    url: "rselect.de",
                    data: { feed_index:<%=f.getFeedIndex() %>},
                    success: function (result) {
                        let value = "";
                        for (let i = 0; i < result.length; i++) {
                            value += "<tr>"
                                
                                + "<td>" + result[i].feed_cmn_id + "</td>"
                                + "<td>" + result[i].feed_cmn_cnt + "</td>"
                                + "<td style='font-size:0.8rem'>" + displayedAt(result[i].feed_cmn_date) + "</td>"
                                + "</tr>";
                                //console.log(result[i].feed_cmn_date)
                                
                        }
                        function displayedAt(createdAt) {
                            const milliSeconds = new Date() - new Date(createdAt);
                            const seconds = milliSeconds / 1000;
                            if (seconds < 60) 
                                return `방금 전`;
                            const minutes = seconds / 60;
                            if (minutes < 60) 
                                return `${Math.floor(minutes)}분 전`;
                            const hours = minutes / 60;
                            if (hours < 24){
                               console.log(hours);
                               return `${Math.floor(hours)}시간 전`;
                            }
                            const days = hours / 24;
                            if (days < 7) 
                                return `${Math.floor(days)}일 전`;
                            const weeks = days / 7;
                            if (weeks < 5)
                                return `${Math.floor(weeks)}주 전`;
                            const months = days / 30;
                            if (months < 12) 
                                return `${Math.floor(months)}개월 전`;
                            const years = days / 365;
                            return `${Math.floor(years)}년 전`;
                        }
                        
                        	
                        $("#com table").html(value);

                    },
                    error: function () {
                        console.log("ajax 통신 실패");
                    }
                })
            } 
            
            </script>
        </div>
       
        
        <!-- course_left 끝-->
        <div id="content">
            <div id="map"> 
                <script>


                    function startDataLayer(xmlDoc) {
                        map.data.addGpx(xmlDoc);
                    }
                    var map = new naver.maps.Map('map',{
                        center: new naver.maps.LatLng(37.492,127.029),
                        zoom:12
                    })
					setTimeout(function(){

                        $.ajax({
                            url: '<%=contextPath%>/resources/gpx_upfiles/<%=f.getChangeName()%>',
                            dataType: 'xml',
                            strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                            strokeOpacity: 0.8, //선 투명도 0 ~ 1
                            strokeWeight: 5,   //선 두께
                            success: startDataLayer
                        });
                    },100);
                    
                    
                </script>
            </div>
        </div>
    </div>
    </div>
    </div>

</body>
</html>