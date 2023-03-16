<%@page import="com.ovcos.notice.model.vo.Notice"%>
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
   request.setAttribute("data", allList);
   ArrayList<Notice> nlist = (ArrayList<Notice>)request.getAttribute("nlist");//공지사항제목용
   ArrayList<Feed> mylist= (ArrayList<Feed>)request.getAttribute("mylist");//최근활동출력용
   System.out.print("nlist"+nlist);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedMainStyle.css?문자열">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/Create.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/feedContent.css">

<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=97s38uvudx&submodules=geocoder"></script>
<title>OVCOS - 메인피드</title>
<script src="https://kit.fontawesome.com/f54b74b3a0.js" crossorigin="anonymous"></script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script src='https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js'></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/canvg/1.5/canvg.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src="<%=contextPath%>/resources/js/dom-to-image.js"></script>

</style>
</head>
<body>
<!-- feed관련 페이지 작성 -->
   <%if(message != null && message.equals("success")){ %>
      <div class="alert alert-primary alert-dismissable" id="succ">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">×</a>
            <strong>피드등록에 성공헀습니다!</strong>   
        </div>

        <script>
            setTimeout(function(){
                $("#succ").slideUp(1000)
            },3000);
        </script>
    <%}%>
    <%if(message != null && message.equals("fail")){ %>
        <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>피드등록에 실패했습니다!!</strong>
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>

        <script>
            setTimeout(function(){
                $("#fail").slideUp(1000)
            },3000);
        </script>
    <%}%>
    <%session.removeAttribute("enrollFeed"); %>
    

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
                                <div id="last_info"><a href="#" id="f_title">
<%
if (mylist != null && !mylist.isEmpty()) {
    String title = mylist.get(0).getFeedTitle();
    if (title.length() > 3) {
        title = title.substring(0, 3);
    }
    out.println(title);
}else{out.println("최근 활동이 없습니다.");}
%>
                     &nbsp;<span></span></a></div>
                                
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

             

				 <div id="notice"><a href="<%=contextPath%>/list.no">

<%
if (nlist != null && !nlist.isEmpty()) {
    out.println(nlist.get(0).getNtcTitle());
}else{
   out.println(" ");
}
%></a></div>

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
                    <%String num = String.valueOf(session.getAttribute("num"));%>
                    <%System.out.print(num); %>
                    <%if(num.equals("1")){ %>
                    <script>
                        var btn = $("#btn_list div");
                        btn.css("backgroundColor","white")
                        $("#allfeed").parent().css("backgroundColor","rgb(235, 235, 235)");
                    </script>
                    <%}else if(num.equals("2")){ %>
                    <script>
                       var btn = $("#btn_list div");
                       btn.css("backgroundColor","white")
                       $("#friendFeed").parent().css("backgroundColor","rgb(235, 235, 235)");
                    </script>
                    <%}else if(num.equals("3")){ %>
                    <script>
                       var btn = $("#btn_list div");
                       btn.css("backgroundColor","white")
                       $("#myFeed").parent().css("backgroundColor","rgb(235, 235, 235)");
                    </script>
                    <%}else{ %>
                    <script>
                        var btn = $("#btn_list div");
                        btn.css("backgroundColor","white")
                        $("#allfeed").parent().css("backgroundColor","rgb(235, 235, 235)");
                    </script>
                    <%} %>
                    
                    
                    
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
                                            <div class="dropdown">
                                                <button class="btn btn-secondary" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <img src="${pageContext.request.contextPath}/resources/image/more.png" alt="더보기 버튼">
                                                </button>
                                                <ul class="dropdown-menu">
                                                    
                                                    <li><a class="dropdown-item" href="#" onclick="clip();">공유하기</a></li>
                                                    <%if(!(f.getMemId().equals(loginUser.getMemId()))||loginUser.getMemId().equals("admin")){%>
                                                        <!--남의피드일때만 보임-->
                                                    <li><a class="dropdown-item" href="#" data-toggle="modal" data-target="#cutfeedmodal<%=f.getFeedIndex()%>" >차단하기</a></li>
                                                    <li><a class="dropdown-item" href="#"  data-toggle="modal" data-target="#rprfeedmodal<%=f.getFeedIndex()%>">신고하기</a></li>
                                                    <%} %>
                                                    <%if(f.getMemId().equals(loginUser.getMemId())|| loginUser.getMemId().equals("admin")){%>
                                                        <!--내피드에만 보임-->
                                                    <li><a class="dropdown-item"  href="<%= contextPath %>/updateForm.feed?no=<%=f.getFeedIndex() %>" >수정하기</a></li><!--data-toggle="modal" data-target="#updatefeedmodal<%=f.getFeedIndex()%>"-->
                                                    <li><a class="dropdown-item" href="#"  data-toggle="modal" data-target="#deletefeedmodal<%=f.getFeedIndex()%>">삭제하기</a></li>
                                                    
                                                    <%} %>
                                                </ul>
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
                                            <div style="border: 1px solid white;">
                                                <img src="<%=contextPath %>/resources/gpx_img/<%=f.getImgPath()%>" style="width: 700px; height: 340px; overflow: hidden;"></img>
                                            </div>
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
                        
                        </div>
    <!-- feeddiv끝 -->
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
<!--------- 차단하기 Modal ------------------------------------------------------------------------------------------------------------------------------------------->
                        <div class="modal fade" id="cutfeedmodal<%=f.getFeedIndex()%>" tabindex="-1" aria-labelledby="cutModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5 deltitle" id="cutModalLabel">차단 확인</h1>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body">
                                        
                                        <%=f.getMemNick() %>님을 차단할까요?<br>
                                        차단하면 더 이상 <%=f.getMemNick() %> 님의 피드는 보이지 않습니다.<br>
                                        차단 해제는 친구목록에서 가능합니다.
                                        
                                    </div>
                                    <div class="modal-footer">  
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                        <button type="button" class="btn btn-primary delfeedbtn"   data-toggle="modal" data-target="#cutOk" data-dismiss="modal" onclick="cutOk('<%=f.getMemId()%>','<%=loginUser.getMemId()%>');">차단하기</button>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal fade" id="cutOk" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5 deltitle" id="exampleModalLabel">차단 완료</h1>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <div class="modal-body" id="cutbody" align="center">
                                        xxx님이 차단되었습니다
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-primary delfeedbtn" data-dismiss="modal" onclick="location.reload();" >확인</button>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                        <script>
                            //차단하기 함수실행
                        function cutOk(cutId, userId){

                                console.log(cutId, userId);
                                $.ajax({
                                    url:"insert.cut",
                                    type: "post",
                                    data: {friendId:cutId, userId:userId},
                                    success:function(result){
                                        if(result>0){ //신고성공
                                            $("#cutbody").text("차단성공");
                                            
                                        }else{//신고실패
                                            $("#rprbody").text('차단실패 ');
                                        }
                                        
                                    },
                                    error:function(){
                                        console.log("ajax 통신 실패");
                                    }
                                })
                                }
                        </script>
<!-------------차단하기 모달 끝 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------->
                    
<!----------- 피드 신고 Modal ------------------------------------------------------------------------------------------------------------------------------------------->
                    <div class="modal fade" id="rprfeedmodal<%=f.getFeedIndex()%>" tabindex="-1" aria-labelledby="rprModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5 deltitle" id="rprModalLabel">피드 신고</h1>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    
                                    블라블라<br>
                                    신고시 블락 처리 블ㄹ라블발<br>
                                    신속한검토 븗랍<br>
                                    허위신고시 블발발바르<br>
                                    ㅂ랍랍라<br>
                                    피드를 정말 <b>신고</b> 하시겠습니까?
                                </div>
                                <div class="modal-footer">  
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                                    <button type="button" class="btn btn-primary delfeedbtn"   data-toggle="modal" data-target="#rprOk" data-dismiss="modal" onclick="rprOk(<%=f.getFeedIndex()%>,'<%=loginUser.getMemId()%>');">신고하기</button>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="rprOk" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5 deltitle" id="exampleModalLabel">신고완료</h1>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body" id="rprbody" align="center">
                                    신고가 접수되었습니다. 감사합니다.
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary delfeedbtn" data-dismiss="modal" onclick="location.reload();" >확인</button>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                            //피드 신고 함수
                        function rprOk(feedIndex, userId){

                                console.log(feedIndex, userId);
                                $.ajax({
                                    url:"rpr.feed",
                                    data: {feedIndex:feedIndex, userId:userId},
                                    success:function(result){
                                        if(result>0){ //신고성공
                                            $("#rprbody").text("신고가 접수되었습니다. 감사합니다.");
                                            
                                        }else{//신고실패
                                            $("#rprbody").text('신고에 실패했습니다. ');
                                        }
                                        
                                    },
                                    error:function(){
                                        console.log("ajax 통신 실패");
                                    }
                                })
                                }
                    </script>
<!--------------피드신고 모달  끝 ----------------------------------------------------------------------------------------------------------------------------------------------------------------------->
                    
<!---------------- 피드 삭제 Modal ---------------------------------------------------------------------------------------------------------------------------------------------------------------->
                    <div class="modal fade" id="deletefeedmodal<%=f.getFeedIndex()%>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5 deltitle" id="exampleModalLabel">피드 삭제</h1>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body">
                                    삭제 된 글은 다시 취소할 수 없습니다. 피드를 정말 <b>삭제</b> 하시겠습니까? 
                                </div>
                                <div class="modal-footer">  
                                    <button type="button" class="btn btn-secondary"data-dismiss="modal">취소하기</button>
                                    <button type="button" class="btn btn-primary delfeedbtn"   data-toggle="modal" data-target="#delOk" data-dismiss="modal" onclick="delfeed(<%=f.getFeedIndex()%>)">삭제하기</button>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="delOk" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-sm">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5 deltitle" id="exampleModalLabel">피드 삭제</h1>
                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                <div class="modal-body" id="delokbody" align="center">
                                
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary delfeedbtn" data-dismiss="modal" onclick="location.reload();" >확인</button>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                    <script>
                        //피드 삭제 함수
                        function delfeed(feedIndex){
                            $.ajax({
                                url:"delete.feed",
                                data: {feedIndex:feedIndex},
                                success:function(result){
                                    if(result>0){ //삭제에 성공했다~~~
                                        console.log(feedIndex);
                                        $("#delokbody").text("글이 삭제되었습니다.");
                                        
                                    }else{
                                        $("#delokbody").text('삭제에 실패했습니다.');
                                    }
                                    
                                },
                                error:function(){
                                    console.log("ajax 통신 실패");
                                }
                            })
                        }
                        
                        //공유하기 함수 url 복사 
                        function clip(){ 
                            var url = '';    // <a>태그에서 호출한 함수인 clip 생성
                            var textarea = document.createElement("textarea");  
                            //url 변수 생성 후, textarea라는 변수에 textarea의 요소를 생성
                            document.body.appendChild(textarea); //</body> 바로 위에 textarea를 추가(임시 공간이라 위치는 상관 없음)
                            url = window.document.location.href;  //url에는 현재 주소값을 넣어줌
                            textarea.value = url;  // textarea 값에 url를 넣어줌
                            textarea.select();  //textarea를 설정
                            document.execCommand("copy");   // 복사
                            document.body.removeChild(textarea); //extarea 요소를 없애줌

                            alert("URL이 복사되었습니다.") 
                            }
                    </script>
<!------------------------ 피드 삭제 Modal & 공유하기 끝 ------------------------------------------------------------------------------------------------------------------------->
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
                <!-- <div id="dust">
                    <div id="date"></div>
                    
                    <div id="pm10"></div>
                    <div id="pm25"></div>
                    
                </div> -->
                <!-- 미세먼지 관련 js -->
                <script src="<%=contextPath %>/resources/js/dust.js"></script>
                
                <div id="dust">
                 <div style="border-right: 2px solid rgb(255, 255, 255); width: 30%;">
                    <div style="font-weight: 600; color: white; padding-right: 15px;" align="center">현재 위치</div>
                    <div style="font-weight: 600; color: white; padding-right: 15px;" align="center" id="addre">(서울)</div>
                    <div style="color: white;"> 
                        <div id="year" style="color: white; font-size: 0.9rem; padding-right: 5px;" align="center"></div>
                        <div id="hour" style="color: white; font-size: 0.9rem; padding-right: 5px;" align="center"></div>
                    </div>
                </div>   
                    <div >
                        <div style="font-weight: 600; padding-left: 15px; color: white;">미세먼지
                            <div style="display: flex;">
                                <img src="${pageContext.request.contextPath}/resources/image/Emo1.png" style="width: 40px; padding-top: 10px;" id="mi" >
                                <div style="padding-left: 10px; padding-top: 18px; color: white;" id="status1">
                                    
                                </div>
                                
                            </div>
                            <div style="font-size: 0.9rem; color: white;">
                                <span id="miVal" style="color: white; "></span> &micro;g/m<sup style="color: white;">3</sup>
                            </div>
                            
                        </div>
                        
                    </div>
                    <div>
                        <div style="font-weight: 600; padding-left: 50px; color: white;">초미세먼지
                            <div style="display: flex;">
                                <img src="#" style="width: 40px; padding-top: 10px;" id="mi2" >
                                <div style="padding-left: 10px; padding-top: 18px; color: white;" id="status2">나쁨</div>
                            </div>
                        </div>
                        <div style="font-size: 0.9rem; color: white; padding-left: 50px; font-weight: 600;">
                            <span id="miVal2" style="color: white;"></span> &micro;g/m<sup style="color: white;">3</sup>
                        </div>
                    </div>
                    <script>
                        var date = new Date();

                        var format1 = date.getFullYear()+"-"+
                                    ((date.getMonth()+1) <9? "0"+(date.getMonth()): (date.getMonth()))+"-"+
                                    (date.getDate() <10? "0"+(date.getDate()): (date.getDate()));
                        var format2 = (date.getHours()<10 ? "0"+
                        (date.getHours()): (date.getHours()))+":"+
                        (date.getMinutes() <10? "0"+
                        (date.getMinutes()):date.getMinutes());


                        console.log(format1);
                        console.log(format2);

                        $("#year").html(format1);
                        $("#hour").html(format2);

                    </script>
                </div>
                <div id="weather" >
               
               <!-- Weather widget by https://meteodays.com -->
                <a id="ms-informer-link-eda9c8f83a7945f9acc28bf4bdb4c88d" class="ms-informer-link" href="https://meteodays.com/ko/weather/overview/seoul">서울날씨</a>
                <script class="ms-informer-script" src="https://meteodays.com/ko/informer/script/eda9c8f83a7945f9acc28bf4bdb4c88d"></script>
                <!-- End -->

            </div>
                
                </div>
                </div>
                <div id="footer" align="center" >
                    <!-- 푸터구역 -->
                    <div id="f1">
                        <a href="#">약관&nbsp;</a> 
                        <a href="#">&nbsp;개인정보취급방침&nbsp;</a> 
                        <a href="<%=contextPath%>/list.bo">&nbsp;고객센터&nbsp;</a>
                    </div>
                    <div>
                        <p style="margin-bottom: 0;"> 
                        © 2023 KH OVCOS
                        </p>
                    </div>

                </div>


            </div>
        </div>
</body>
</html>
