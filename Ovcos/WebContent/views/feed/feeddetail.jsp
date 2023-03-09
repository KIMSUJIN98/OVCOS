<%@ include file="../common/nav.jsp" %>
<%@ page import="com.ovcos.feed.model.vo.Feeddetails" %>
<%@ page import="com.ovcos.feed.model.vo.Feed" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% Feeddetails f=(Feeddetails)request.getAttribute("f"); %>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>OVCOS - 상세피드</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/exMy.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feeddetail2.css">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx&submodules=geocoder"></script>

</head>
<body>
    <div id="course">
        <div id="left" class="floatWrap">
            
            <!-- 피드 상세 전체 -->
            <div  id="feeddox">
                <!-- 피드 90% 사이즈 -->
                <div id="feed90">
                    <div id="feed1">
                        <div style="border-bottom: 1px solid black;" >
                            <div id="feeds">피드 상세</div>
                        </div>
                    </div>
    

                    <!-- 유저 아이디 및 찜 조회수 다운로드 -->
                    <div  id="userid">
                        <div id="mypage1">
            
                            <span style="margin-left:15px; ">
                                <img width="40px;" style="border-radius: 50%;"
                                    src="${pageContext.request.contextPath}/resources/image/mypage.png">
                                <br>
            
                            </span>
                            <span>
                                <div>
                                    <b id="name">
                                        <%=f.getMemId()%>
                                    </b>
                                </div>
            
                                <div>
                                    <div id="detail">
                                        <%=f.getFeedDate()%>
                                    </div>
                                </div>
                                <div style="display: flex; padding-left: 10px; ">
                                    <div id="eval">
                                        <img src="${pageContext.request.contextPath}/resources/image/eval.png"
                                            style="width: 20px; padding-top: 2px;" alt="">
                                    </div>
                                    <div style="padding-left: 3px;">
                                        <%=f.getFeedEval()%>
                                    </div>
                                </div>
                            </span>
                        </div>
                        <!-- 조회수, 찜, 다운로든 -->
                        <div style="border-bottom: 1px solid black;  padding-left: 15px;display: flex; padding-bottom: 26px;">
                            <div>
                                <img id="eye" src="${pageContext.request.contextPath}/resources/image/eye.png"
                                    alt="">
                            </div>
                            <div style="padding-left: 5px;">
                                <%=f.getHit() %>
                            </div>
                            <div>
                                <img style="box-sizing: none;" id="love"
                                    src="${pageContext.request.contextPath}/resources/image/love.png" alt="">
                            </div>
                            <div style="padding-left: 5px;">
                                <%=f.getWishCount() %>
                            </div>
            
                            <div style="margin-left: 150px;">
                                <a download="<%=f.getOriginName()%>"
                                    href="<%=contextPath%>/resources/gpx_upfiles/<%=f.getChangeName()%>"><img
                                        id="download1"
                                        src="${pageContext.request.contextPath}/resources/image/download.png"
                                        style="width: 17px;" alt=""></a>
                            </div>
            
                        </div>
                    </div>
                    <!-- 유저 아이디 및 찜 조회수 다운로드 끝 -->
        
                    <!-- 피드 제목  -->
                <div id="feedy">
                    <!-- 피드 내용 -->
                    <div id="run" align="center">
                        <div style="font-weight: 900;">피드 제목</div>
        
                    </div>
                    <div align="center" id="feedt" style="border-bottom: 1px solid black;">
                        <%=f.getFeedTitle() %>
                    </div>
                </div>
                <!-- 피드 제목 끝 -->
                
                
                
                <!-- 피드 내용  -->
                <div id="feed4">
                    <div id="run" align="center" style="border-bottom: 1px solid black;">
                        <b>피드 내용</b>
        
                    </div>
                    <div id="distance" style="border-bottom: 1px solid black;">
        
                        <div style="padding-left: 15px; height: 150px;">
                            <%=f.getFeedCnt() %>
                        </div>
                    </div>
                </div>
                <!-- 피드 내용 끝-->
    
                <!-- 운동 기록 -->
                <div id="run1" >
                    <div id="run" align="center" style="border-bottom: 1px solid black;">
                        <b>운동기록</b>
                    </div>
                    <div id="distance" style="border-bottom: 1px solid black;">
                        <div>
                            <b style="padding-left: 15px;">운동거리 : <%=f.getDistance()%> KM</b>
        
                        </div>
                        <br>
                        <div>
                            <b style="padding-left: 15px;" id="start"> </b>
                        	<script>
	                        	naver.maps.Service.reverseGeocode({
	    	                        location: new naver.maps.LatLng(<%=f.getStartLat()%>, <%=f.getStartLon()%>),
	    	                    }, function(status, response) {
	    	                        if (status !== naver.maps.Service.Status.OK) {
	    	                            return alert('Something wrong!');
	    	                        }
	    	
	    	                        var result = response.result, // 검색 결과의 컨테이너
	    	                        items = result.items; // 검색 결과의 배열
	    	
	    	                        var address = items[0].address;
	                                $("#start").html("시작위치 : "+address);
	    	                    });
                        		
                        	</script>
                        </div>
                    </div>
                </div>
                <!-- 운동 기록 끝 -->
                <!-- 댓글 담기는 부분 -->
                <div id="comment">
                    <div id="com" style=" overflow: auto; padding-left: 10px;" >
                        <table>
                        
                        </table>
                    </div>
                </div>
                <!-- 댓글 담기는 부분 끝-->
                </div>
               
                <!-- 댓글 부분 -->
            <div  id="comm1" >
                <div id="reply-area" >
                    <table style="margin: auto;">
                        <thead>
                            <tr>
                                <th id="fontth">댓글</th>
                                <td style="padding-right: 0;">
                                    <input type="text" id="feed_cmn_cnt" placeholder="댓글 입력..."></input>
                                </td>
                                <td style="padding-right: 0;">
                                    <button onclick="insertReply();" id="btn00" type="submit">전송</button>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
    
                        </tbody>
                    </table>
                </div>
            </div>
            <!-- 댓글 부분 끝 -->
        
            </div>
                <!-- 댓글 구간 -->
            <!-- 피드 상세 끝 -->

            
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
                            feed_index: <%= f.getFeedIndex() %>,
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

                                    + "<td style= 'border-bottom: 3px solid rgb(67, 115, 176); font-weight:600'>" + result[i].feed_cmn_id + "</td>"
                                    + "<td style=''>" + result[i].feed_cmn_cnt + "</td>"
                                    + "<td style='font-size:0.8rem; padding-left: 70px;  ' > " + timeForToday(result[i].feed_cmn_date) + "</td>"
                                    + "</tr>";
                                console.log(result[i].feed_cmn_date)

                            }
                            function timeForToday(value) {
                            const today = new Date();
                            const timeValue = new Date(value);
                            timeValue.setHours(timeValue.getHours()+9);
                            console.log("dsadsadas");

                            const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
                            console.log(betweenTime +"dsadfegrg");
                            if (betweenTime < 1) return '방금전';
                            if (betweenTime < 60) {
                                return betweenTime+'분전';
                            }

                            const betweenTimeHour = Math.floor(betweenTime / 60);
                            if (betweenTimeHour < 24) {
                                return betweenTimeHour+'시간전';
                            }

                            const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
                            if (betweenTimeDay < 365) {
                                return betweenTimeDay+'일전';
                            }

                            return Math.floor(betweenTimeDay / 365)+'년전';
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
                    var map = new naver.maps.Map('map', {
                        center: new naver.maps.LatLng(<%=f.getStartLat()%>, <%=f.getStartLon()%>),
                        zoom: 12
                    })
                    setTimeout(function () {

                        $.ajax({
                        	url: '<%=contextPath%>/resources/gpx_upfiles/<%=f.getChangeName()%>',
                            dataType: 'xml',
                            strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                            strokeOpacity: 0.8, //선 투명도 0 ~ 1
                            strokeWeight: 5,   //선 두께
                            success: startDataLayer
                        });
                    var marker = new naver.maps.Marker({
                        position: new naver.maps.LatLng(<%=f.getStartLat()%>, <%=f.getStartLon()%>),
                        map: map,
                        icon: {
                                content: '<img src=/Ovcos/resources/image/location3.png alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 45px; height: 45px; left: 0px; top: 0px;">',
                            size: new naver.maps.Size(45, 45),
                            anchor: new naver.maps.Point(26, 40)
                        }
                    });
                        
                        
                    }, 100);


                </script>
            </div>
        </div>
    </div>
    </div>
    </div>

</body>

</html>