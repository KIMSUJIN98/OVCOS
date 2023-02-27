<%@page import="com.ovcos.common.model.vo.Pageinfo"%>
<%@page import="com.ovcos.follow.model.vo.Follow"%>
<%@page import="java.util.ArrayList"%>
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
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/followList.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<style>


</style>
</head>
<body>
    <%@ include file="../common/nav.jsp" %>
    <input type = "hidden" name="userId" id="userId" value="<%= loginUser.getMemId() %>">


    <div id="Wrap1">

        <div id="container">
            <div id="header">
                <div id="btn_list">
                    <div id="follwingList"><a href="#" >내 친구</a></div>
                    <div id="followList"><a href="#">나를 추가한 친구</a></div>
                    <div id="reqList"><a href="#">친구요청</a></div>
                    <div id="blockList"><a href="#">차단목록</a></div>
                </div>
	               	<script>
		                $(document).ready(function() {
		                    $("#follwingList").click(function() {
		                        myfriendList();
		                    });
		                    $("#followList").click(function() {
		                    	addMeList();
		                    });
		                    $("#reqList").click(function() {
		                    	friendRequests();
		                    });
		                    $("#blockList").click(function() {
		                    	blockList(blockList);
		                    });
		                });
		               	
	               	</script>
                <div id="userSearch">
                    
                    <div id="search">
                        <input type="search" id="search" name="search" placeholder="검색">
                    </div>
                    <div id="search_btn">
                        <img src="${pageContext.request.contextPath}/resources/image/search.png" alt="검색">
                    </div>
                </div>

            </div>


            <div id="content">


                <div id="fix_div">나의 친구 목록 </div>
                <table  border="1">


                    <tbody class="tablecontent">
                    <% if(list.isEmpty()) {%>
                        <!-- case1. 게시글이 없을 경우  -->
                        <tr>
                            <td colspan="6">조회된 게시글이 없습니다.</td>
                        </tr>
                        <% } %>
                        <!-- case2. 게시글이 있을 경우 -->
                        <!-- for문 돌리기 -->
   
                            <tr>
                                <td>프로필사진</td>
                                <td><div>이름</div><div>자기소개</div></td>
                                <td class="tdbt"> <button type="button" class="btn btn-primary btn-sm" id="btn1">친구하기</button></td>
                                <td class="tdbt"> <bu tton type="button" class="btn btn-primary btn-sm" onclick="block();">차단하기</button></td>
                            </tr>
                    </tbody>
                </table>

                <script>
                
                
                
                // 내가 팔로우한 친구 목록 
                function myfriendList() {
                    $.ajax({
                    	url: "getMyFriends.fw",
                        type: "POST",
                        data: { userId: $("#userId").val() }, //로그인유저아이디
                        success: function(data) {
                            
                        	console.log(data);
                        	
                        	var html = "";
                            if (data.length == 0) {
                                html += "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>";
                            } else {
                                $.each(data, function(i, item) {
                               
                                    html += "<tr>";
                                    html += "<td>프로필사진</td>";
                                    html += "<td><div>" + item.memName + "</div><div>자기소개" + item.memIntro + "</div></td>";
                                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm' id='btn" + item.flwId + "'>친구끊기</button></td>";
                                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm' onclick='block();'>차단하기</button></td>";
                                    html += "</tr>";
                                 
                                });
                            $(".tablecontent").html(html);
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log("Error: " + textStatus + " " + errorThrown);
                        }
                    });
                }




                
                //나를 추가한 친구 목록
                function addMeList() {
                    $.ajax({
                    	url: "addMeList.fw",
                        type: "POST",
                        data: { userId: $("#userId").val() }, //로그인유저아이디
                        success: function(data) {
                            
                        	console.log(data);
                        	
                        	var html = "";
                            if (data.length == 0) {
                                html += "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>";
                            } else {
                                $.each(data, function(i, item) {
                               
                                    html += "<tr>";
                                    html += "<td>프로필사진</td>";
                                    html += "<td><div>" + item.memName + "</div><div>자기소개" + item.memIntro + "</div></td>";
                                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm' id='btn" + item.flwId + "'>친구끊기</button></td>";
                                    html += "<td class='tdbt'><button type='button' class='btn btn-primary btn-sm' onclick='block();'>차단하기</button></td>";
                                    html += "</tr>";
                                 
                                });
                            $(".tablecontent").html(html);
                            }
                        },
                        error: function(jqXHR, textStatus, errorThrown) {
                            console.log("Error: " + textStatus + " " + errorThrown);
                        }
                    });
                }

                
                

                </script>
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



</body>
</html>