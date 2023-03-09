<%@ include file="../common/nav.jsp" %>
<%@ page import="com.ovcos.common.model.vo.Pageinfo"%>
<%@ page import="com.ovcos.follow.model.vo.Follow"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Pageinfo pi = (Pageinfo)request.getAttribute("pi");
ArrayList<Follow> list = (ArrayList<Follow>)request.getAttribute("list");

int currentPage = pi.getCurrentPage();
int startPage = pi.getStartPage();
int endPage = pi.getEndPage();
int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OVCOS - 친구목록</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/followList.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>


</style>
</head>
<body>
    <input type = "hidden" name="userId" id="userId" value="<%= loginUser.getMemId() %>">


    <div id="Wrap1">


        <div id="container">

            <div id="sheader">
                <div id="userSearch">
                        
                    <div id="search">
                        <input type="search" id="searchMem" name="search" placeholder="검색">
                        <div id="search_btn">
                            <img src="${pageContext.request.contextPath}/resources/image/search.png" alt="검색" id="sbtn">
                        </div>
                    </div>
                </div>
            </div>

            <ul class="nav nav-tabs">
                <li class="nav-item">
                <a class="nav-link active" data-toggle="tab" href="#home" id="follwingList">내 친구</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu1" id="followList">나를 추가한 친구</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" data-toggle="tab" href="#menu2"  id="reqList">친구요청</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#menu3"  id="blockList" >차단목록</a>
                </li>
            </ul>




            <div id="content">
                <div id="fix_div">나의 친구 목록 </div>
                <table  border="1">
                    <tbody class="tablecontent">
						<% if(list.isEmpty()) {%>
                        <!-- case1. 게시글이 없을 경우  -->
                        <tr>
                            <td colspan="6"> 추가한 친구가 없습니다!</td>
                        </tr>
                        <% }else{ %>
                        <!-- case2. 게시글이 있을 경우 for문 돌리기 -->
                        <!--  -->
                        <% for(Follow f : list){ %>

                            <script>
                                
                                //내친구목록조회
                                $(document).ready(function() {
                                    myfriendList();
                                });
                            </script>

							<%} %>
                        <%} %>
                    </tbody>
                </table>

                

                <br><br>
                <div class="paging-area" align="center">
        
                <%if(currentPage != 1){ %> 
                    <button onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=currentPage-1%>';">&lt;</button>
                    <!-- 이전버튼 : 커런틒이지 =>내가 보고 있느 ㄴ화면  -->
                    <!-- 커런트페이지가 맥스페이지가 아닐때만 다음 버튼 보이게 -->
                <%} %>
                
                    <%for(int p = startPage; p<=endPage; p++){ %>
                        <%if(p==currentPage){ %>
                    <button style="background: pink" disabled><%=p %></button>
                        <%}else{ %>
                        <button onclick="location.href ='<%=contextPath%>/list.bo?cpage=<%=p%>';"><%=p%></button>
                        <!-- 클릭하면 .. -->
                        <%} %>
                    <%} %>
                    
                    <%if(currentPage != maxPage){ %>
                    <button  onclick="location.href='<%=contextPath%>/list.bo?cpage=<%=currentPage+1%>';">&gt;</button>
                    <% } %>
                    <!-- 커런트페이지가 맥스페이지가 아닐때만 다음 버튼 보이게 -->
                </div>
            </div>
        </div>
    </div>



    <script>



        // 탭 div 클릭할 때마다 다른 함수 실행 
        $(document).ready(function() {

            $("#follwingList").on("click", function() {
                myfriendList();
            });

            $("#followList").on("click", function() {
                addMeList();
            });

            $("#reqList").on("click", function() {
                followRequest();
            });

            $("#blockList").on("click", function() {
                cutList();
            });

            $("#search_btn").on("click", function() {
                searchMember();
            });
            
        });
    


        //내친구목록 리스트 반환 함수
        function myfriendList() {
            $.ajax({
                url: "getMyFriends.fw",
                type: "POST",
                data: { userId: $("#userId").val() }, //로그인유저아이디
                success: function(data) {
                    console.log(data);
                    var html = generateHTML(data);
                    $(".tablecontent").html(html);
                    $("#fix_div").text("나의 친구 목록");
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }
            });
        }

        //나를 추가한 친구 목록 리스트 반환 함수
        function addMeList() {
            $.ajax({
                url: "addMeList.fw",
                type: "POST",
                data: { userId: $("#userId").val() }, //로그인유저아이디
                success: function(data) {
                    var html = generateHTML(data);
                    $(".tablecontent").html(html);
                    $("#fix_div").text("나를 추가한 친구 목록");
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }
            });
        }


        //차단 유저 리스트 반환
        function cutList() {
            $.ajax({
                url: "cutList.cut",
                type: "POST",
                data: { userId: $("#userId").val() }, //로그인유저아이디
                success: function(data) {
                    var html = generateHTML3(data);
                    
                    $(".tablecontent").html(html);
                    $("#fix_div").text("차단한 유저 목록");
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }
            });
        }



        //친구 요청 리스트 반환
        function followRequest() {
            $.ajax({
                url: "list.rq",
                type: "POST",
                data: { userId: $("#userId").val() }, //로그인유저아이디
                success: function(data) {
                    console.log("차단유저아니고 친구요청리스트다 멍청아")
                    console.log(data);
                    var html = generateHTML1(data);
                    
                    $(".tablecontent").html(html);
                    $("#fix_div").text("친구 알림");
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }
            });
        }


        //검색한 유저 리스트 반환 함수
        function searchMember() {
            $.ajax({
                url: "searchList.fw",
                type: "POST",
                data: { memName: $("#searchMem").val(), userId: $("#userId").val() }, //검색한 유저네임, 내 아이디
                success: function(data) {
                    console.log(data);
                    var html = generateHTML(data);

                    $(".tablecontent").html(html);
                    $("#fix_div").text("검색결과");
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }
            });
        }


        // 결과 함수
        function generateHTML(data) {
            var html = "";
            if (data.length == 0) {
                html += "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>";
            } else {
                $.each(data, function(i, item) {
                    html += "<tr class='tr2'>";
                    html += "<td class='tr2_td1'><img src='${pageContext.request.contextPath}/resources/image/mypage.png' alt='프로필이미지'></td>";
                    html += "<td><div><b>" + item.memName + "</b></div><div>" + item.memIntro + "</div></td>";
                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm friend-button' id='btn" + item.flwId + "'>친구끊기</button></td>";
                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm block-button' id='block" + item.flwId + "'>차단하기</button></td>";
                    html += "</tr>";
                        console.log(item.flwId);
                    checkfrd(item.flwId, "#btn" + item.flwId);
                    checkblock(item.flwId, "#block" + item.flwId);
                });
            }
            return html;
        }
        
        //친구요청리스트만 타는 함수 
        function generateHTML1(data) {
            var html = "";
            if (data.length == 0) {
                html += "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>";
            } else {
                
                $.each(data, function(i, item) {
                    html += "<tr class='tr2'>";
                    html += "<td class='tr2_td1'><img src='${pageContext.request.contextPath}/resources/image/mypage.png' alt='프로필이미지'></td>";
                    html += "<td><div><b>" + item.memName + "</b></div><div>" + item.memIntro + "</div></td>";
                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm friend-button' id='btn" + item.memId + "'>친구끊기</button></td>";
                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm delete-button' id='delete" + item.memId + "'>삭제</button></td>";
                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm block-button' id='block" + item.memId + "'>차단하기</button></td>";
                    html += "</tr>";

                    checkfrd(item.memId, "#btn" + item.memId);
                    checkblock(item.memId, "#block" + item.memId);
                });
            }
            return html;
        }

        //차단목록
        function generateHTML3(data) {
            var html = "";
            if (data.length == 0) {
                html += "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>";
            } else {
                $.each(data, function(i, item) {
                    html += "<tr class='tr2'>";
                    html += "<td class='tr2_td1'><img src='${pageContext.request.contextPath}/resources/image/mypage.png' alt='프로필이미지'></td>";
                    html += "<td><div><b>" + item.memName + "</b></div><div>" + item.memIntro + "</div></td>";
                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm friend-button' id='btn" + item.memId + "'>친구끊기</button></td>";
                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm block-button' id='block" + item.memId + "'>차단하기</button></td>";
                    html += "</tr>";
                        console.log(item.flwId);
                    checkfrd(item.memId, "#btn" + item.memId);
                    checkblock(item.memId, "#block" + item.memId);
                });
            }
            return html;
        }

        //친구상태면 버튼 친구끊기, 아니면 친구추가로 바꾸기 
        function checkfrd(memId, buttonSelector){

            $.ajax({
                url: "friendsCheck.fw", 
                type: 'POST',
                data: { friendCheckId: memId, userId: $("#userId").val() }, 
                success: function(result) {
                if (result.length >0 ) {
                    // 친구 상태인 경우
                    //console.log('친구임');
                    $(buttonSelector).text('친구끊기').css({'background-color': '#ffffff', 'color': '#007bff'});;
                    
                } else {
                    // 친구가 아닌 경우
                    //console.log('친구아님');
                    $(buttonSelector).text('친구추가');
                }
                }
            });
        }

        //차단상태인지 아닌지 조회해서 차단상태면 차단해제, 차단테이블에 존재하지 않으면 버튼은 차단하기로
        function checkblock(memId, buttonSelector){
            $.ajax({
                url: "cutCheck.bl", 
                type: 'POST',
                data: { friendCheckId: memId, userId: $("#userId").val() }, 
                success: function(result) {
                if (result.length >0 ) {
                    // 차단상태인 경우
                    $(buttonSelector).text('차단해제').css({'background-color': '#ffffff', 'color': '#007bff'});;
                    
                } else {
                    //차단이 아닌경우
                    $(buttonSelector).text('차단하기');
                }
                }
            });
        }
        
        //친구 버튼 클릭시 이벤트 : 친구테이블에 추가삭제
        $(document).on('click', '.friend-button', function() {
            var button = $(this);
            var memId = button.attr('id').substr(3); //차단대상아이디
            var userId = $('#userId').val(); // 내아이디

            if (button.text() === '친구추가') {

                // 친구 추가 INSERT 
                $.ajax({
                    url: 'insertFriend.fw',
                    type: 'POST',
                    data: { friendId: memId, userId: userId },
                    success: function(result) {
                        console.log("친추완료되어따~~~~~~~~~")
                        button.text('친구끊기').css({ 'background-color': '#ffffff', 'color': '#007bff' });
                    }
                });

                //친구 요청 테이블에 INSERT
                $.ajax({
                    url: 'insert.rq',
                    type: 'POST',
                    data: { friendId: memId, userId: userId },
                    success: function(result) {
                    },
                    error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }
                });
            } else {
                // 친구 삭제

                $.ajax({
                    url: 'deleteFriend.fw',
                    type: 'POST',
                    data: { friendId: memId, userId: userId },
                    success: function(result) {
                        button.text('친구추가').css({ 'background-color': '#007bff', 'color': '#ffffff' });
                    }
                });
            }
        });


        function insertRq(){


            
        }



        //차단 버튼 클릭 시 차단테이블에 추가 삭제
        $(document).on('click','.block-button', function(){
            var button = $(this);
            var memId = button.attr('id').substr(5);
            var userId = $('#userId').val();
            //console.log(memId);

            if (button.text() === '차단하기') {
                //'차단하기'인 버튼 클릭시 차단테이블에추가
            $.ajax({
                url: 'insert.cut',
                type: 'post',
                data: { friendId: memId, userId: userId },
                success: function(result) {
                        button.text('차단해제').css({ 'background-color': '#ffffff', 'color': '#007bff' });
                        
                    }

            });
            } else {
                //'차단해제'인 버튼 클릭시 차단테이블에 status n으로

                $.ajax({
                    url: 'delete.cut',
                    type: 'POST',
                    data: { friendId: memId, userId: userId },
                    success: function(result) {
                        button.text('차단하기').css({ 'background-color': '#007bff', 'color': '#ffffff' });
                        
                    }
                });
            }



        });

            //삭제 버튼 클릭 시 친구요청리스트에서 삭제 
            $(document).on('click','.delete-button', function(){
            var button = $(this);
            var memId = button.attr('id').substr(6);
            var userId = $('#userId').val();
            //console.log(memId);

            if (button.text() === '삭제') {
                //'차단하기'인 버튼 클릭시 차단테이블에추가
            $.ajax({
                url: 'delete.rq',
                type: 'post',
                data: { friendId: memId, userId: userId },
                success: function(result) {
                    if (result>0 ) {
                    // 친구 상태인 경우
                    //console.log('친구임');
                    followRequest();
                    
                    } else {
                        // 친구가 아닌 경우
                        //console.log('친구아님');
                        alert("삭제에 실패했습니다.")
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }

            });
            }



        });
    </script>
    
    


</body>
</html>