<%@ include file="../common/nav.jsp" %>
<%@ page import="com.ovcos.explore.model.vo.Explore"%>
<%@ page import="com.ovcos.feed.model.vo.Feed"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String message = (String)session.getAttribute("enrollFeed");
   //System.out.print(message);
   //ArrayList<Explore> allList = (ArrayList<Explore>)request.getAttribute("allList");
   ArrayList<Feed> allList = (ArrayList<Feed>)request.getAttribute("allList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedMainStyle.css?문자열">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Create.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedContent.css">

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx"></script>
<title>OVCOS - 메인피드</title>
<script src="https://kit.fontawesome.com/f54b74b3a0.js" crossorigin="anonymous"></script>

<style>
    path{
    stroke: red !important;
}
</style>
</head>
<body>
<!-- feed관련 페이지 작성 -->
   <%if(message != null && message.equals("success")){ %>
      <div class="alert alert-primary alert-dismissable" id="succ">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
            <strong>피드등록에 성공헀습니다!</strong>   
        </div>
    <%}%>
    <%if(message != null && message.equals("fail")){ %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>피드등록에 실패했습니다!!</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    <%}%>
    <%session.removeAttribute("enrollFeed"); %>
    
    <% if(alertMsg != null) { %>
		alert("<%= alertMsg %>");
	<% session.removeAttribute("alertMsg"); %>
	<% } %>
    

    <script>
        
    </script>



    <div id="feedWrap">
        <input type = "hidden" name="userId" id="userId" value="<%= loginUser.getMemId() %>"><!--로그인아이디-->
            <div id="ct1">
                <div id="record">
                    <!-- 운동기록구역입니다 -->
                    <div id="recode1">
                        <div id="profile">
                            <div id="profile_img">
                                <img src="${pageContext.request.contextPath}/resources/image/mypage.png" alt="프로필이미지">
                            </div>
                            <a href="#" id="username"><h3><%= loginUser.getMemName() %>( <%= loginUser.getMemNick() %> )</h3></a>
                            
                        </div>
                        <div id="ac_recode">
                            <div id="last_ac1">
                                <div class="h51"><h5>LAST ACTIVITY</h5></div>
                                <div id="last_info"><a href="#" id="f_title">피드제목&nbsp;<span>2023-02-11</span></a></div>
                                
                            </div>
                            <div id="last_ac2">
                                <div class="h51"><h5>THIS WEEK</h5></div>
                                <div id="km1" class="km">
                                    <a href="#">0km</a></div>
                            </div>
                            <div id="last_ac3">
                                <div class="h51" id="ac3_h5"><h5>THIS YEAR</h5></div>
                                <div id="km2" class="km"><a href="#">0km</a></div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div id="notice"><a href="<%=contextPath%>/list.no">서버 점검 예정 2023-03-03</a></div>
            </div>
<!--            <<nav>
  <div class="nav nav-tabs" id="nav-tab" role="tablist">
    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">Home</button>
    <button class="nav-link" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">Profile</button>
    <button class="nav-link" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">Contact</button>
    <button class="nav-link" id="nav-disabled-tab" data-bs-toggle="tab" data-bs-target="#nav-disabled" type="button" role="tab" aria-controls="nav-disabled" aria-selected="false" disabled>Disabled</button>
  </div>
</nav>
<div class="tab-content" id="nav-tabContent">
  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab" tabindex="0">...</div>
  <div class="tab-pane fade" id="nav-disabled" role="tabpanel" aria-labelledby="nav-disabled-tab" tabindex="0">...</div>
</div>-->

            <div id="ct2">
                <div id="content_header">
                    <div id="btn_list" role="tablist">
                        <div id="all_feed"><a href="<%= contextPath %>/clickList.feed?num=1&userId=<%=loginUser.getMemId()%>" id="allfeed"  >전체피드</a></div>
                        <div id="fw_feed" ><a href="<%= contextPath %>/clickList.feed?num=2&userId=<%=loginUser.getMemId()%>" id="friendFeed" >친구피드</a></div>
                        <div id="my_feed"><a href="<%= contextPath %>/clickList.feed?num=3&userId=<%=loginUser.getMemId()%>"  id="myFeed">내피드</a></div>
                    </div>

                    <form action="searchList.feed" method="get" id="searchForm">
                        <div id="feed_search">
                            <div id="f_select">
                                <select name="f_search_select" id="f_search_select">
                                <option value="1" >작성자</option>
                                <option value="2">제목</option>
                                <option value="3">내용</option>
                                </select>
                            </div>
                            <div id="f_search">
                                <input type="search" id="search" name="search" placeholder="검색">
                            </div>
                            <div id="search_btn">
                                <button type="submit" id="btns"><img src="${pageContext.request.contextPath}/resources/image/search.png" alt="검색"></button>
                            </div>
                        </div>
                    </form>

                    <div id="feed_select">
                        <form action=""  method="POST" id="sortForm" >
                            <select name="sorting" id="fs">
                                <option value="">조회하기</option>
                                <option value="latest">최신순</option>
                                <option value="oldest">오래된순</option>
                                <option value="rating">별점순</option>
                                <option value="bookmark">찜순</option>
                            </select>
                            
                        </form>
                    </div>
                </div>
                <script> //버튼없이 select 선택하면 바로 값 넘기기 
                    document.getElementById("fs").addEventListener("change", function() {
                        document.getElementById("sortForm").submit();
                    });


                    const form = document.getElementById("sortForm");
                    const select = document.getElementById("fs");

                    select.addEventListener("change", function() {
                        const value = select.value;
                        let url = "";

                        switch (value) {
                            case "latest":
                                url = "list.feed?num=1&userId=<%=loginUser.getMemId()%>";
                                break;
                            case "oldest":
                                url = "list.feed?num=2&userId=<%=loginUser.getMemId()%>";
                                break;
                            case "rating":
                                url = "list.feed?num=3&userId=<%=loginUser.getMemId()%>";
                                break;
                            case "bookmark":
                                url = "list.feed?num=4&userId=<%=loginUser.getMemId()%>";
                                break;
                            default:
                                break;
                        }

                        form.action = url;
                    });
                </script>
                <div id="content_feed">

					<div id="fix_div"></div>
                    
                    <div class="feedContent">
                    
                    <%if(allList.size()==0){ %>
                        <p>조회 된 결과가 없습니다.<p>
                    <%}else{ %>
                    
                    <% for(Feed f : allList) {%>


                        
                        <div class="feeddiv">
                            <div class="feed_table">
                                <table border="0px" id="f_table">
                                    <tr id="tr1">
                                        <td id="feed_profile" colspan="2">
                                            <div>
                                                <div id="p_img"><img src="${pageContext.request.contextPath}/resources/image/mypage.png" alt="프로필이미지"></div>
                                                
                                                <div id="p_name"><%=f.getMemNick() %></div>
                                                <div id="p_date"><%=f.getFeedDate() %></div>
                                                <img id="pimg" src="${pageContext.request.contextPath}/resources/image/title_location.png" alt="위치이미지">
                                                <div id="p_loca"><%=f.getOriginName()%></div>
                                            </div>
                                        </td>
                                        <td id="plus">
                                        <div>
                                            <img src="${pageContext.request.contextPath}/resources/image/more.png" alt="더보기 버튼">
                                        </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" id="td2_1">
                                            <div id="f_title">
                                            <a href="<%= contextPath %>/detail.fe?fno=<%=f.getFeedIndex() %>"><%=f.getFeedTitle() %></a>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" id="f_content">
                                            <p><%=f.getFeedCnt() %></p>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                        <td colspan="3" id="gpx">
                                            <div>
                                                <!-- <img src="${pageContext.request.contextPath}/resources/image/gpx_ex.png" alt=""> -->

                                                <div id="n<%=f.getFeedIndex()%>" style="width: 700px; height: 340px;"></div>
                                            </div>
                                            <script>
                                                    function startDataLayer(xmlDoc) {
                                                    n<%=f.getFeedIndex()%>.data.addGpx(xmlDoc);
                                                    }
                                                    var n<%=f.getFeedIndex()%> = new naver.maps.Map('n<%=f.getFeedIndex()%>',{
                                                    center: new naver.maps.LatLng(<%=f.getStartLat()%>, <%=f.getStartLon()%>),
                                                    zoom: 15
                                                    })
                                                    
                                                    $.ajax({
                                                        url: '<%=contextPath%>/resources/gpx_upfiles/<%=f.getPath()%>',
                                                        dataType: 'xml',
                                                        strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                                                        strokeOpacity: 0.8, //선 투명도 0 ~ 1
                                                        strokeWeight: 3,   //선 두께
                                                        success: startDataLayer
                                                        });

                                                    setTimeout(function(){
                                                        
                                                        var dis = <%=f.getDistance()%>;
                                                        var zom=9;
                                                        if(dis<2){
                                                            zom = 14;
                                                        }else if(dis<20){
                                                            zom = 13;
                                                        }else if(dis<40){
                                                            zom = 12;
                                                        }else{
                                                            zom=11;
                                                        }
                                                    	n<%=f.getFeedIndex()%>.setZoom(zom);
                                                    },800);
                                                    
                                            </script>
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        
                                        <td >
                                            <div id="star">
                                                <% 
                                                int star = f.getFeedEval();
    
                                                switch(star){
                                                case 1:out.print("⭐"); break;
                                                case 2:out.print("⭐⭐"); break;
                                                case 3:out.print("⭐⭐⭐"); break;
                                                case 4:out.print("⭐⭐⭐⭐"); break;
                                                case 5:out.print("⭐⭐⭐⭐⭐"); break;
                                                
                                                }
                                                %>

                                            </div>


                                            
                                        </td>
                                        <td id="comment"></td>
                                        <td id="like" align="right">
                                            <div class="right_area">
                                                <a href="javascript:;" class="icon heart" >
                                                    <img src="https://cdn-icons-png.flaticon.com/512/812/812327.png" alt="찜하기" onclick="bookmark(<%= f.getFeedIndex() %>, '#like'+<%= f.getFeedIndex() %>);" id="like<%=f.getFeedIndex()%>" >
                                                </a>
                                            </div>
                                            <input type="hidden" name="feedIndex" id="feedIndex" value="">
                                        </td>
                                        
                                    </tr>
                                </table>  

                            
                            </div>
                        
                        </div><!-- feeddiv끝 -->
                        <script>

                            //좋아요체크해서 한거면 빨갛게 아니면 말게..
                            checklike("<%= loginUser.getMemId() %>","<%= f.getFeedIndex() %>","#like<%= f.getFeedIndex() %>");

                            function checklike(userId, feedIndex,id){
                               // console.log(userId,feedIndex);
                                $.ajax({
                                    url: "check.bk", 
                                    type: 'POST',
                                    data: { feedIndex: feedIndex, userId: userId}, 
                                    success: function(result) {
                                    if (result.length >0 ) {
                                        ///좋아요를 누른 상태~~~~~ 하트를 빨간색으로 바꿈
                                        $(id).attr({
                                        'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
                                        alt:'찜하기 완료'
                                            });
                                        
                                    } else {
                                        $(id).attr({
                                            'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
                                        alt:'찜하기 완료'
                                            });
                                    }
                                    }
                                });
                            }
                        </script>
                            <% } %>
                            <%} %>

                    </div>

                    
                </div>
            </div>



            <script>

                //좋아요 인서트
                function bookmark(feedIndex, id) {
                    var userId = $('#userId').val(); // 내아이디
                    var feedIndex = feedIndex;

                    if($(id).attr("src").endsWith("812327.png")){ //좋아요가 흰하트라면
                        console.log("타나요?");
                        $.ajax({
                            url: 'insert.bk', 
                            method: 'POST',
                            data: {feedIndex:feedIndex, userId: userId }, // 피드인덱스,내아이디
                            success: function(result) {
                                $(id).attr({
                                'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',//인서트 성공하면 하트를 빨간색으로
                                alt:'찜하기 완료'
                                    });
                            },
                            error: function(xhr, status, error) {
                                // 실패하면 콘솔에 오류 메시지 출력
                                console.error(error);
                            }
                            });
                    }else{
                        console.log("엔드스위드의 엘스를탓다")
                        //삭제하는 코드를 적자 
                        $.ajax({
                            url: 'delete.bk', 
                            method: 'POST',
                            data: {feedIndex:feedIndex, userId: userId }, // 피드인덱스,내아이디
                            success: function(result) {
                                console.log("성공적으로 삭제됐다면 이게 나옴!!")
                                $(id).attr({
                                'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
                                alt:'찜하기'
                                });
                            },
                            error: function(xhr, status, error) {
                                // 실패하면 콘솔에 오류 메시지 출력
                                console.error(error);
                            }
                            });
                    }
                }


                 //heart 좋아요 클릭시! 하트 뿅
                $(function(){

                    var $likeBtn =$('.icon.heart');
                    
                        $likeBtn.click(function(){
                        $likeBtn.toggleClass('active');
                        
                        if($likeBtn.hasClass('active')){          
                        $(this).find('img').attr({
                            'src': 'https://cdn-icons-png.flaticon.com/512/803/803087.png',
                            alt:'찜하기 완료'
                                });
                        
                        
                        }else{
                            $(this).find('i').removeClass('fas').addClass('far')
                        $(this).find('img').attr({
                            'src': 'https://cdn-icons-png.flaticon.com/512/812/812327.png',
                            alt:"찜하기"
                        })
                        }
                    })
                })



            </script>
            
            <div id="ct3">
                <div id="dust">미세먼지api 구역</div>
                <div id="weather">날씨 api 구역</div>
                <div id="footer">
                    <!-- 푸터구역 -->
                    <div id="f1">
                        <a href="#">약관&nbsp;</a> 
                        <a href="#">&nbsp;개인정보취급방침&nbsp;</a> 
                        <a href="#">&nbsp;고객센터&nbsp;</a>
                    </div>
                    <div>
                        <p> 
                        © 2023 KH OVCOS
                        </p>
                    </div>
                </div>
            </div>
    </div>
<!-- The Modal -->
    <div class="modal" id="myModal" tabindex="-1" role="dialog">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
        
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title"><b>피드 등록</b></h4>
                    <button type="button" class="close"
                        data-dismiss="modal">&times;</button>
                </div>
        
                <!-- Modal body -->
                <div class="modal-body"
                    style="padding-left: 0px; padding-right: 0px;">
                    <form action="<%=contextPath %>/enroll.feed"0000
                        method="post" id="enrollfrm"
                        enctype="multipart/form-data">
                        <input type="hidden" name="userId"
                            value="<%= loginUser.getMemId()%>">
                        <input type="hidden" name="startLon" id="startLon"
                            value="">
                        <input type="hidden" name="startLat" id="startLat"
                            value="">
                        <input type="hidden" name="distance" id="distance"
                            value="">
                        <table id="text1">
                            <div id="exmap"
                                style="width:799px;height:500px; margin: auto;">
                                <div id="map"
                                    style="width:100%;height:100%;"></div>
                            </div>
        
                            <hr>
                            <div style=" display: flex;">
                                <div>
                                    <label for="avatar"
                                        style="margin-left: 30px;"><b>파일 첨부
                                            :</b></label>
                                    <input type="file" id="avatar"
                                        name="avatar" accept=".gpx">
                                </div>
                                <div style="display: flex; float: right;">
                                    <b
                                        style="padding-top: 5px; padding-right: 5px; margin-left: 160px;">별점</b>
                                    <div class="star-rating">
                                        <input type="radio" id="5-stars"
                                            name="rating" value="5" />
                                        <label for="5-stars"
                                            class="star">&#9733;</label>
                                        <input type="radio" id="4-stars"
                                            name="rating" value="4" />
                                        <label for="4-stars"
                                            class="star">&#9733;</label>
                                        <input type="radio" id="3-stars"
                                            name="rating" value="3" />
                                        <label for="3-stars"
                                            class="star">&#9733;</label>
                                        <input type="radio" id="2-stars"
                                            name="rating" value="2" />
                                        <label for="2-stars"
                                            class="star">&#9733;</label>
                                        <input type="radio" id="1-star"
                                            name="rating" value="1" />
                                        <label for="1-star"
                                            class="star">&#9733;</label>
                                    </div>
                                </div>
                            </div>
                            <hr>
        
                            <tr>
                                <th>제목</th>
                                <td><input type="text" name="title"
                                        size="62" placeholder="제목입력해주세요" value="">
                                </td>
                            </tr>
                        </table>
                        <br>
                        <table id="text">
                            <tr>
                                <th style="padding-bottom: 100px;">내용</th>
                                <td>
                                    <textarea name="content"  cols="62" rows="5" style="resize: none;"></textarea>
                                </td>
                            </tr>
        
                        </table>
        
        
        
                </div>
                <!-- Modal footer -->
                <div style="display: flex;">
        
                    <div>
                        <b style="margin-left: 50px;">공개여부</b>
                        <select name="displayNy" id="displayNy">
                            <option value="전체">전채공개</option>
                            <option value="비공개">비공개</option>
                            <option value="친구">친구에게만</option>
                        </select>
                    </div>
                    <div style="margin-left: 400px;">
                        <b style="margin-right: 5px;">경로등록하기</b>
                        <select name="trackNy" id="trackNy">
                            <option value="Y">등록</option>
                            <option value="N">미등록</option>
                        </select>
                    </div>
                </div>
                <div class="modal-footer">
                    <div id="dist1">총길이 :<span id="dist"></span></div>
                    <button type="reset" class="btn btn-primary"
                        id="reset">초기화</button>
                    <input type="submit" class="btn btn-primary"
                        id="insert" onclick="return fileSubmit()"></input>
                </div>
                </form>
            </div>
        </div>
        </div>
       
        
        <!-- 피드 상세 -->
        <script>
            
            
            
            function fileSubmit(){
               var title = $("input[name='title']");
               var file = document.getElementById('avatar');
               var content = $("textarea");

               if(file.files.length <1){
                alert("Gpx 파일을 선택해주세요");
                return false;
               }else{
                    if(String(title.val()).length <1){
                        var len = file.files[0].name;
                        var s = String(len).lastIndexOf("g");
                        title.val(String(len).substring(0,s-1));
                        content.val(String(len).substring(0,s-1));
                }
                return true;
               }
            }

            $("#insert").click(function () {
                var last = $("#dist").text().lastIndexOf("k");
                $("#distance").val($("#dist").text().substring(0, last));
                $("#startLat").val(startLat);
                $("#startLon").val(startLon);
                $(":radio").each(function (index, value) {
                    if ($(this).attr("checked")) {
                        $("#rate").val($(this).val());
                    }
                })
            })
            $(function () {
                $("#reset").click(function () {
                    $("#title").val("");
                    $("textarea").val("");
                    $("#avatar").val("");
                    $(".star-rating label")
                })
            });
            $("#reset").click(function () {
                $("#map").css("visibility", "hidden");
                $("#dist").text("");
            })
            var polyline = null;
            var marker = null;
            var map = null;
            var array = [];
            var lats = [];
            var lons = [];
            var startLat = null;
            var startLon = null;
            // 거리구하는데 필요한 변수
            var sum = 0;
            function deg2rad(deg) {
                return (deg * Math.PI / 180)
            }
            function rad2deg(deg) {
                return (deg * 180 / Math.PI);
            }
            var R = 6371; // Radius of the earth in km
            var gpxFileInput = document.getElementById('avatar');
            gpxFileInput.addEventListener('change', handleFileSelect, false);

            function handleFileSelect(event) {
                array = [];
                lats = [];
                lons = [];
                sum = 0;
                var total ="";
                $("#map").remove();
                var map = "<div id='map' style='width:100%;height:100%;''></div>"
                $("#exmap").append(map);
                
                var file = event.target.files[0];
                var reader = new FileReader();
                
                reader.onload = function (event) {
                    var gpx = $.parseXML(event.target.result);
                    console.log(gpx);
                    var str = '<bounds maxlat="37.55701757998861" maxlon="127.00031235806117" minlat="37.54436060643561" minlon="126.98387064986434"/>';
                    // console.log($(gpx).find('bounds'));
                    var meta = $(gpx).find('metadata');
                    // console.log(meta[0]);
                    // console.log(meta[0].innerHTML = meta[0].innerHTML+str);
                    // console.log(gpx)
                    // console.log(event.target.result)
                    // event.target.result = gpx;
                    // console.log(event.target.result)
                    var fileInput = document.getElementById("avatar");
                    var file = fileInput.files[0];
                    console.log(file);

                    var reader = new FileReader();
                    reader.addEventListener('load', function() {
                        // Get the contents of the file as a string
                        var fileContents = reader.result;
                        console.log(fileContents);

                        // Modify the file contents as needed
                        // ...
                        var str = '<bounds maxlat="37.55701757998861" maxlon="127.00031235806117" minlat="37.54436060643561" minlon="126.98387064986434"/>';
                        var meta = $(fileContents).find("metadata");
                        console.log(meta[0]);
                    
                        // console.log(meta[0].innerHTML);

                        console.log(fileContents);
                        // Create a new Blob object with the modified data
                        // console.log($(fileContents).find("metadata")[0].innerHTML=+str);
                        
                        // Replace the original file with the modified file
                        console.log(fileContents.search("<metadata>"));
                            //238
                        fileContents = fileContents.substring(0,238)+str+fileContents.substring(238);
                        var modifiedBlob = new Blob([fileContents]);
                        
                        console.log(fileContents)
                        fileInput.files[0] = modifiedBlob;
                        console.log(fileInput.files[0]);
                        });

                        // Read the contents of the selected file
                        reader.readAsText(file);
                    
                    
                    var trackPoints = $(gpx).find('trkpt');
                    // console.log(trackPoints);
                    trackPoints.each(function (index, value) {
                        var lat = $(this).attr('lat');
                        var lon = $(this).attr('lon');
                        total += lat+","+lon+"|";
                        
                        
                        array.push(new naver.maps.LatLng(lat, lon));
                        lats.push(lat);
                        lons.push(lon);
                        if (index == 0) {
                            startLat = lat;
                            startLon = lon;
                        }
                    });
                    
                    
                    for (let i = 1; i < lats.length; i++) {
                        if (lats[i - 1] == lats[i]) {
                            dist = 0
                        } else {
                            var theta = lons[i - 1] - lons[i];
                            // console.log(theta)
                            var dist = Math.sin(deg2rad(lats[i - 1])) * Math.sin(deg2rad(lats[i])) + Math.cos(deg2rad(lats[i - 1])) * Math.cos(deg2rad(lats[i])) * Math.cos(deg2rad(theta));
                            dist = Math.acos(dist);
                            dist = rad2deg(dist);
                            dist = dist * 60 * 1.1515;
                            dist = dist * 1.609344;
                            if (dist === NaN) {
                                dist = 0;
                            }
                            sum += dist;
                        }
                    }
                    // hidden에 초기 위도와 경도 대입하기
                    $("#startLat").val(startLat);
                    $("#startLon").val(startLon);
                    $("#distance").val(sum.toFixed(1));
                    // 화면에 경로 표시하기
                    $("#dist").text(sum.toFixed(2) + 'km');
                    // 지도 표시
                    var zom;
                    var dist = sum;
                    if(sum<2){
                        zom = 15;
                    }else if(sum<10){
                        zom = 13;
                    }else if(sum<50){
                        zom = 12;
                    }else if(sum<90){
                        zom = 11;
                    }else{
                        zom = 10;
                    }
                    map = new naver.maps.Map('map', {
                        center: new naver.maps.LatLng(startLat, startLon),
                        zoom: zom
                    });
                    // 지도에 선 그리기
                    polyline = new naver.maps.Polyline({
                        path: array,      //선 위치 변수배열
                        strokeColor: '#FF0000', //선 색 빨강 #빨강,초록,파랑
                        strokeOpacity: 0.8, //선 투명도 0 ~ 1
                        strokeWeight: 3,   //선 두께
                        map: map           //오버레이할 지도
                    });
                    //지도에 마커 표시하기
                    marker = new naver.maps.Marker({
                        position: new naver.maps.LatLng(lats[lats.length - 1], lons[lons.length - 1]),
                        map: map,
                        icon: {
                            content: '<img src=/Ovcos/resources/image/endlocation5.png alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 45px; height: 45px; left: 0px; top: 0px;">',
                            size: new naver.maps.Size(45, 45),
                            anchor: new naver.maps.Point(26, 40)
                        }
                    });
                    marker = new naver.maps.Marker({
                        position: new naver.maps.LatLng(startLat, startLon),
                        map: map,
                        icon: {
                        	 content: '<img src=/Ovcos/resources/image/location3.png alt="" style="margin: 0px; padding: 0px; border: 0px solid transparent; display: block; max-width: none; max-height: none; -webkit-user-select: none; position: absolute; width: 45px; height: 45px; left: 0px; top: 0px;">',
                            size: new naver.maps.Size(45, 45),
                            anchor: new naver.maps.Point(26, 40)
                        }
                    });
                };
                reader.readAsText(file);
            };
        </script>