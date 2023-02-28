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
	
	String status = String.valueOf(request.getAttribute("status"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/exMain.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx&submodules=geocoder"></script>


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
                    <a href="course/my?npage=1">
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
                </div>
            </div>
            <div id="tab_manu">
           
                <ul>
                <!-- 조건문으로 인기기록일 떄 아니면 최신기록일 때  -->
                <%if(status.equals("e")){ %>
	                    <li class="tabon1 tabon" onclick="location.href='<%=contextPath%>/course?epage=1'">최신기록</li>
	                    <li class="tabon2" onclick="location.href='<%=contextPath%>/course?fpage=1'">인기기록</li>
	                <%}else{ %>
		                <li class="tabon1" onclick="location.href='<%=contextPath%>/course?epage=1'">최신기록</li>
	                    <li class="tabon2 tabon" onclick="location.href='<%=contextPath%>/course?fpage=1'">인기기록</li>
	                <%} %>    
                	
                </ul>
                  
            </div>
            <div id="left_content">
                <div id="content_list">
                    <!-- case 1  조회 결과가 없다. -->
                	<%if(list == null){ %>
				 		<p>조회된 결과가 없습니다.</p>
				 	<%}else{ %>
                    <!-- case 2 반복문으로  -->
                    	<%for(Explore f: list){ %>
                    <div class="exList" id="f<%=f.getFeedIndex()%>">
                        <span class="list_num"><%=f.getFeedIndex() %></span>
                        <div class="innertext">
                            <h6 style="font-weight: bolder; font-size:0.9rem"><%=f.getFeedTitle() %></h6>
                            <table>
                                <tr>
                                    <td class="ct1">전체 거리</td>
                                    <td><%=f.getDistance()%> km</td>
                                </tr>
                                <tr>
                                    <td class="ct1">별점</td>
                                    <td><%=f.getFeedEval() %>/5</td>
                                </tr>
                                <tr>
                                    <td class="ct1">주소</td>
                                    <td id="add<%=f.getFeedIndex()%>" data-toggle="tooltip" data-placement="right" title="" ></td>
                                    <input type="hidden" name="lat" id="lat<%=f.getFeedIndex()%>" value="<%=f.getStartLat()%>">
                                    <input type="hidden" name="lng" id="lng<%=f.getFeedIndex()%>" value="<%=f.getStartLon()%>">
                                </tr>
                            </table>
                            <div id="bottom">
                                <span style="font-size: 0.8rem;"><%=f.getFeedDate() %></span>
                                <span class="btn1 btn btn-sm" onclick="location.href='#'">코스 상세</span>
                            </div>
                        </div>
                    </div>
                    
                    <script>
                    
                    	var lat = $("#lat<%=f.getFeedIndex()%>").val();
                        var lng = $("#lng<%=f.getFeedIndex()%>").val();
                    
	                    naver.maps.Service.reverseGeocode({
	                        location: new naver.maps.LatLng(lat, lng),
	                    }, function(status, response) {
	                        if (status !== naver.maps.Service.Status.OK) {
	                            return alert('Something wrong!');
	                        }
	
	                        var result = response.result, // 검색 결과의 컨테이너
	                            items = result.items; // 검색 결과의 배열
	
	                       
	
	                        var item = items[0].address;
                            var fianl;
	                        if(item.length >9){
                               final = item.substring(0,9)+'...';
                            }
                            $("#add<%=f.getFeedIndex()%>").attr("title",item);
	
	                        $("#add<%=f.getFeedIndex()%>").text(final);
	                    });
                        console.log($(".exList"))

                        
                    </script>
                    	<%} %>
                    <%} %>
                    
                </div>
                <!-- 페이지바 시작 -->
                
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
                <!-- 페이지바 끝 -->
            </div>
        </div>
        <!-- course_left 끝-->
        <div id="content">
            <div id="map"> 


                <script>

                    function startDataLayer(xmlDoc) {
                            map.data.addGpx(xmlDoc);
                            }
                    
                    var lat = 37.4923615;
                    var lng = 127.0292881;

                    var map = new naver.maps.Map('map',{
                        center:new naver.maps.LatLng(lat, lng),
                        zoom: 10
                    })

                    var marker = null;
                    var markers = [];

                    var infowindows = [];

                    var paths = [];

                    // 마커 세팅
                    <%for(Explore e:list){%>
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
                    <%}%>

                    // window 세팅
                   <%for(Explore e: list){%>
                    infowindows.push(new naver.maps.InfoWindow({
                        content:[
                            '<div class="iw_inner">',
                            '   <span><%=e.getFeedTitle()%></span>',
                            '	<span><%=e.getDistance()%> km</span>	',
                            '</div>'	
                        ].join('')
                    }))
                    
                    <%}%>
                    
 
                    $(".exList").click(function(e){
                        $("path").remove();
                        $(".exList").css("backgroundColor","white");
                        $(this).css("backgroundColor","#eceaea");
                        $(".btn1").css("visibility","hidden");

                        $(this).find("span").eq(2).css("visibility","visible").css("borderColor","#ccc")
                        console.log($(this));
                        
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
                            strokeWeight: 5,   //선 두께
                            success: startDataLayer
                            });
                            if(infowindows[index-1].getMap()){
                                infowindows[index-1].close();
                            }else{
                                infowindows[index-1].open(map,markers[index-1]);
                            }
                        
                        })
                        
                        naver.maps.Event.addListener(map, 'click', function(e) {
                            for(let i = 0; i<infowindows.length; i++){
                                infowindows[i].close();
                            }
                        });
                   

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

                            $(".exList").css("backgroundColor","white");
                            $(".btn1").css("visibility","hidden");
                            
                            var num = Number(i+1);
                            $("#f"+num).css("backgroundColor","#eceaea");
                            $("#f"+num).find("span").eq(2).css("visibility","visible").css("borderColor","#ccc");
                            
                            var docu = document.getElementById("f"+num);
                            docu.scrollIntoView({ behavior: "smooth" });
                            
                        });
                    }

                    
                    
                </script>

                
            </div>
        </div>
    </div>
    </div>
    </div>

</body>
</html>