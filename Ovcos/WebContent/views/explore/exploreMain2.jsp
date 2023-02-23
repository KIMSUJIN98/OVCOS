<%@page import="com.ovcos.explore.model.vo.Explore"%>
<%@page import="com.ovcos.common.model.vo.Pageinfo"%>
<%@page import="com.ovcos.feed.model.vo.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
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
                    <form action="search.ex">
                        <input type="text" name="searchcourse" placeholder="제목,코스명 검색" autocomplete="off">

                        <button type="submit" id="submitimg"></button>
                        <!-- <img src="${pageContext.request.contextPath}/resources/image/search.png" alt="검색"> -->
                    </form>
                    <!--여기에 form태그를 넣어야 할지 고민이다.-->
                </div>
            </div>
            <div id="tab_manu">
                <ul>
                    <li class="tabon1 tabon">최신기록</li>
                    <li class="tabon2">인기기록</li>
                </ul>
            </div>
            <div id="left_content">
                <div id="content_list">
                   <!-- 조회된 데이터 들어갈 자리 -->
                    
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
                    $(function(){
                        $.ajax({
                            url:"course1",
                            data: {currentPage:<%=currentPage%>},
                            type:"get",
                            success:function(result){
                                console.log("성공");
                            }
                        })
                    })

                    function startDataLayer(xmlDoc) {
                            map.data.addGpx(xmlDoc);
                            }
                    
                    var lat = 37.4923615;
                    var lng = 127.0292881

                    var map = new naver.maps.Map('map',{
                        center:new naver.maps.LatLng(lat, lng),
                        zoom: 10
                    })

                    var marker = null;
                    var markers = [];

                    var infowindows = [];

                    var paths = [];

                    // 마커 세팅
                    <%-- <%for(Explore e:list){%>
                        marker = new naver.maps.Marker({
                            map:map,
                            position: new naver.maps.LatLng(<%=e.getStartLat()%>,<%=e.getStartLon()%>),
                            icon: {
                                content: 
                                "<span class='list_num'><%=e.getFeedIndex()%></span>",
                                // size: new naver.maps.Size(38, 58),
                                anchor: new naver.maps.Point(19, 40),
                            }
                        })
                        markers.push(marker);
                        paths.push("<%=e.getPath()%>");
                    <%}%> --%>

                    // window 세팅
                   <%-- <%for(Explore e: list){%>
                    infowindows.push(new naver.maps.InfoWindow({
                        content:[
                            '<div class="iw_inner">',
                            '   <h6><%=e.getFeedTitle()%></h6>',
                            '    <span src="<%=contextPath%>/resources/image/route.png">',
                            '	<span><%=e.getDistance()%> km</span>	',
                            '</div>'	
                        ].join('')
                    }))
                    
                    <%}%> --%>
                    
 
                    $(".exList").click(function(e){
                        $("path").remove();
                        $(".exList").css("backgroundColor","white");
                        $(this).css("backgroundColor","#f8f8f8");
                        $(".btn1").css("visibility","hidden");

                        $(this).find("span").eq(2).css("visibility","visible").css("borderColor","#ccc")

                        
                        // index 뽑기
                        var index = $(this).children("span").text()%10;
                        if($(this).children("span").text() == 10){
                            index = 10;
                        }

                        e.preventDefault();
                      
                        $.ajax({
                            url: '<%=contextPath%>/resources/gpx_upfiles/'+paths[index-1],
                            dataType: 'xml',
                            strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                            strokeOpacity: 0.8, //선 투명도 0 ~ 1
                            strokeWeight: 3,   //선 두께
                            success: startDataLayer
                            });
                            if(infowindows[index-1].getMap()){
                                infowindows[index-1].close();
                            }else{
                                infowindows[index-1].open(map,markers[index-1]);
                            }

                            
                            
                    })

                   

                    for(let i=0; i<markers.length; i++){
                        naver.maps.Event.addListener(markers[i], "click", function(e) {

                            $("path").remove();
                            $.ajax({
                            url: '<%=contextPath%>/resources/gpx_upfiles/'+paths[i],
                            dataType: 'xml',
                            strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                            strokeOpacity: 0.8, //선 투명도 0 ~ 1
                            strokeWeight: 3,   //선 두께
                            success: startDataLayer
                            });

                            console.log("이벤트")
                            if(infowindows[i].getMap()){
                                infowindows[i].close();
                            }else{
                                infowindows[i].open(map,markers[i]);
                            }
                            
                            
                        });
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
                $(this).addClass("tabon")
                //ajax로 left_content와 content를 리로딩 시켜야함
                $(".tabon2").removeClass("tabon");
                location.href="course?epage=1";
            });
            
            $(".tabon2").click(function(){
            	$(this).addClass("tabon");
            	$(".tab")
            })
            
            

        })
    </script>

</body>
</html>