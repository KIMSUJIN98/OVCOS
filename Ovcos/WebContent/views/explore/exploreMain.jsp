<%@page import="com.ovcos.explore.model.vo.Explore"%>
<%@page import="com.ovcos.common.model.vo.Pageinfo"%>
<%@page import="com.ovcos.feed.model.vo.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Explore> list = (ArrayList<Explore>)request.getAttribute("list");
	Pageinfo pi = (Pageinfo)request.getAttribute("pi");

	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/exMain.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>

<style>
    path{
        visibility: hidden;
    }
</style>

</head>
<body>
<%@ include file="../common/nav.jsp" %>

    <div id="course">
        <!-- course_nav 시작-->
        <div id="course_nav">
            <ul>
                <li class="li1">
                    <a onclick="location.href='<%=contextPath%>/course?epage=1'">
                        <span class="nav1"><img src="${pageContext.request.contextPath}/resources/image/flagWhite.png" alt="깃발"></span>
                        <span class="li1text" align="center">코스검색</span>
                    </a>
                </li>
                <li>
                    <a href="course/my">
                        <span class="nav1"> <img src="${pageContext.request.contextPath}/resources/image/exploreuser.png" alt="유저"></span>
                        <span class="li2text" align="center">나의코스</span>
                    </a>
                </li>
            </ul>
        </div>
        <!--course_nav 끝-->
        <!--course_left 시작-->
        <div id="course_left">
            <div id="sectiontop">
                <div id="title">코스검색</div>
                <div id="search">
                    <input type="text" name="searchcourse" placeholder="제목,코스명 검색">
                    <img src="${pageContext.request.contextPath}/resources/image/search.png" alt="검색">
                    <!--여기에 form태그를 넣어야 할지 고민이다.-->
                </div>
            </div>
            <div id="tab_manu">
                <ul>
                    <li class="tabon tabon1">최신기록</li>
                    <li class="tabon1">인기기록</li>
                </ul>
            </div>
            <div id="left_content">
                <div id="content_list">
                    <!-- case 1  조회 결과가 없다.-->
                	<%if(list == null){ %>
				 		<p>조회된 결과가 없습니다.</p>
				 	<%}else{ %>
                    <!-- case 2 반복문으로  -->
                    	<%for(Explore f: list){ %>
                    <div class="exList">
                        <span class="list_num"><%=f.getFeedIndex() %></span>
                        <div class="innertext">
                            <h5><%=f.getFeedTitle() %></h5>
                            <table>
                                <tr>
                                    <td>전체 거리</td>
                                    <td><%=f.getDistance()%> km</td>
                                </tr>
                                <tr>
                                    <td>등록유저</td>
                                    <td><%=f.getMemId() %></td>
                                </tr>
                                <tr>
                                    <td>별점</td>
                                    <td><%=f.getFeedEval() %></td>
                                </tr>
                            </table>
                            <span><%=f.getFeedDate() %></span>
                        </div>
                    </div>
                    	<%} %>
                    <%} %>
                    
                </div>
                <div id="list_page">
                    <ul>
                    	<%if(currentPage != 1){ %>
                        	<li class="befpage" onclick="location.href='<%=contextPath%>/course?epage=<%=currentPage-1%>'">&lt;</li>
                        <%} else{%>
                        	<li class="befpage">&lt;</li>
                        <%} %>
                        <%for(int i = startPage; i<=endPage; i++){ %>
                        	<%if(i== currentPage){ %>
                        		<li class="pagenum on"><%=i%></li>
                        	<%}else{ %>
                        		<li class="pagenum" onclick="location.href='<%=contextPath%>/course?epage=<%=i%>'"><%=i%></li>
                        	<%} %>
                        <%} %>
                        <%if(currentPage != maxPage){ %>
                        	<li class="aftpage" onclick="location.href='<%=contextPath%>/course?epage=<%=currentPage+1%>'">&gt;</li>
                        <%} else{%>
                        	<li class="aftpage">&gt;</li>
                        <%} %>
                    </ul>
                </div>
            </div>
        </div>
        <!-- course_left 끝-->
        <div id="content">
            <div id="map"> 


                <script>

                    function startDataLayer(xmlDoc) {
                            map.data.addGpx(xmlDoc);
                            }
                    navigator.geolocation.getCurrentPosition(geoSuccess);
                    function geoSuccess(position) {
                    // 위도
                    var lat = position.coords.latitude;
                    // 경도
                    var lng = position.coords.longitude;
                    
                    setMap(lat, lng);
                    }

                    function setMap(lat, lng){
                        var markers = [];
                        var marker;

                        map = new naver.maps.Map('map',{
                            center: new naver.maps.LatLng(lat,lng),
                            zoom: 8
                        })
                                    
                                                     
 						
                        <%for(Explore e:list){%>
                            // $.ajax({
                            //         url: 'resources/gpx_upfiles/<%=e.getPath()%>',
                            //         dataType: 'xml',
                            //         strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                            //         strokeOpacity: 0.8, //선 투명도 0 ~ 1
                            //         strokeWeight: 3,   //선 두께
                            //         success: startDataLayer
                            //     });
                            //     function startDataLayer(xmlDoc) {
                            //         map.data.addGpx(xmlDoc);
                            //         }   
                        <%}%>

                        <%for(Explore e:list){%>
                            marker = new naver.maps.Marker({
                                map:map,
                                position: new naver.maps.LatLng(<%=e.getStartLat()%>,<%=e.getStartLon()%>),
                                icon: {
                                    content: 
                                    "<span class='list_num'><%=e.getFeedIndex()%></span>",
                                    // size: new naver.maps.Size(38, 58),
                                    anchor: new naver.maps.Point(19, 58),
                                }

                            })
                            markers.push(marker);
                        <%}%>
                        
                        map.panTo(new naver.maps.LatLng(lat,lng));
                        
                        $(".exList").click(function(e){
                            console.log(markers)
                            var index = $(this).children("span").text()%10;
                            if($(this).children("span").text() == 10){
                                index = 10;
                            }
                            console.log(index);
                           
                            e.preventDefault();
                            
                            $.ajax({
                                    url: 'resources/gpx_upfiles/20230219114357-f_95529.gpx',
                                    dataType: 'xml',
                                    strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                                    strokeOpacity: 0.8, //선 투명도 0 ~ 1
                                    strokeWeight: 3,   //선 두께
                                    success: startDataLayer
                                });
                                function startDataLayer(xmlDoc) {
                                    map.data.addGpx(xmlDoc);
                                    }  

                            map.panTo(markers[index-1].position);
                            var paths = document.getElementsByTagName("path");
                            console.log($("path").eq(0));
                            $("path").eq(index-1).css("visibility","visible");
                            
                            for(var i = 0; i<$("path").length; i++){
                                if(i != (index-1)){
                                    $("path").eq(i).css("visibility","hidden");
                                }
                            }
                            

                        })
                        


                    }
                    

                
                    

                
                </script>

                
            </div>
        </div>
    </div>
    </div>
    </div>

    
    <script>
        $(function(){

            $(".tabon1").click(function(){
                console.log("성공");
                $(this).addClass("tabon")
                //ajax로 left_content와 content를 리로딩 시켜야함
                $(this).siblings().removeClass("tabon");
            });

        })
    </script>

</body>
</html>