<%@page import="com.ovcos.common.model.vo.Pageinfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ovcos.feed.model.vo.Feed"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
ArrayList<Feed> list = (ArrayList<Feed>)request.getAttribute("list");



   Pageinfo pi = (Pageinfo)request.getAttribute("pi");

   int currentPage = pi.getCurrentPage();
   int startPage = pi.getStartPage();
   int endPage = pi.getEndPage();
   int maxPage = pi.getMaxPage();




%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
       
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

		<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

        <title>Document</title>
    <style>
        .wrap{
            width: 300px;
            height: 1000px;
            float: left;
        }
        #nav{
        width: 400px;
        height: 1000px;
        float: left;
        background-color: aqua;
        }
        #header{
            width: 1400px;
            height: 100px;
        }
        h1{
            line-height: 100px;
            border-bottom: 1px solid black;
         
        }
        #wrap{
            padding: 50px;
            padding-left: 100px;    
        }
		table{
			border: 1px solid gray;
			padding-left : 50px;
		}
		table *{
			text-align: center;
		}


    </style>
    
    </head>
    <body>

        <%@ include file ="adminNav.jsp"%>
        <div id="header">
        <h1>피드 관리</h1>
        </div>

		
        <div id="wrap">
            <div class="panel">
                <div class="body">
                    <div class="input-group">
                    <button onclick="rprList();">신고조회</button>
                    <br><br>
                    </div>
                </div>
                <table class="myTable table hover" >
                    <thead align="center">
                        <tr>
                            <th width="70">피드번호</th>
                            <th width="300">제목</th>
                            <th width="100">작성자아이디</th>
                            <th width="100">작성자닉네임</th>
                            <th width="50">조회수</th>
                            <th width="100">작성일</th>
                            <th width="70">신고여부</th>
                            <th width="70">삭제여부</th>
                        </tr>
                    </thead>
                    <tbody >
                        <!-- case1. 게시글이 없을 경우 == 리스트가 텅 비어 있을때-->
                        <% if(list.isEmpty()) { %>
                        <tr>
                            <td colspan="6">조회된 데이터가 없습니다.</td>
                        </tr>
                        <%} else { %>
                        <!-- case2. 게시글이 있을 경우 -->
                        <% for( Feed f : list ) { %>
                        <tr>
                            <td><%= f.getFeedIndex() %></td>
                            <td><%= f.getFeedTitle() %></td>
                            <td><%= f.getMemId() %></td>
                            <td><%= f.getMemNick() %></td>
                            <td><%= f.getCount() %></td>
                            <td><%= f.getFeedDate() %></td>
                            <td><%= f.getFeedRprNy() %></td>
                            <td><%= f.getFeedDelNy() %></td>
                        </tr>
                        <% } %>
                        <%} %>
                        
                    </tbody>
                </table>
            </div>

            
        </div>

 		<br><br>
        <div class="paging-area" align="center">
 
 		<%if(currentPage != 1){ %> 
            <button onclick="location.href='<%=contextPath%>/feedList.admin?cpage=<%=currentPage-1%>';">&lt;</button>
            <!-- 이전버튼 : 커런틒이지 =>내가 보고 있느 ㄴ화면  -->
            <!-- 커런트페이지가 맥스페이지가 아닐때만 다음 버튼 보이게 -->
        <%} %>
        
            <%for(int p = startPage; p<=endPage; p++){ %>
            	<%if(p==currentPage){ %>
            <button style="background: pink" disabled><%=p %></button>
            	<%}else{ %>
            	<button onclick="location.href ='<%=contextPath%>/feedList.admin?cpage=<%=p%>';"><%=p%></button>
            	<!-- 클릭하면 .. -->
				<%} %>
			<%} %>
			
			<%if(currentPage != maxPage){ %>
            <button  onclick="location.href='<%=contextPath%>/feedList.admin?cpage=<%=currentPage+1%>';">&gt;</button>
			<% } %>
			<!-- 커런트페이지가 맥스페이지가 아닐때만 다음 버튼 보이게 -->
        </div>

     
        <script>

            //신고된 리스트 조회
            function rprList(){

                $.ajax({
                url: "rprList.admin",
                type: "POST",

                success: function(list) {
                    console.log("타냐??????????????");
                    var html = '';
                    if(list.length == 0) {
                        html += '<tr><td colspan="6">조회된 데이터가 없습니다.</td></tr>';
                    } else {
                        $.each(list, function(index, f) {
                        html += '<tr>';
                        html += '<td>' + f.feedIndex + '</td>';
                        html += '<td>' + f.feedTitle + '</td>';
                        html += '<td>' + f.MemId + '</td>';
                        html += '<td>' + f.memNick + '</td>';
                        html += '<td>' + f.count + '</td>';
                        html += '<td>' + f.feedDate + '</td>';
                        html += '<td>' + f.feedRprNy + '</td>';
                        html += '<td>' + f.feedDelNy + '</td>';
                        html += '<td><button onclick="restore('+f.feedIndex+');">복구</button></td>';
                        html += '<td><button onclick="deletefeed('+f.feedIndex+');">삭제</button></td>';
                        html += '</tr>';
                        });
                    }
                    $('table').find('tbody').html(html); },
                    error: function(jqXHR, textStatus, errorThrown) {
                        console.log("Error: " + textStatus + " " + errorThrown);
                    }
            });


            }



         

            // 피드 삭제처리하기 
            function deletefeed(feedIndex){
                var r = confirm("피드를 삭제하시겠습니까? 삭제된 피드 작성자의 누적신고수가 올라갑니다.");

                if(r==true){
                $.ajax({
                url: "delete.feed",
                data:{feedIndex:feedIndex},
                type: "POST",

                success: function(result) {
                    var html = '';
                    if(result>0) {
                        // 삭제된 사용자의 누적신고수 업 
                        alert("피드가 삭제처리되었습니다.")
                        rprCountUpdate(feedIndex);
                        
                    } else {
                        alert("복구실패.")
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }
            });
            }
            }

            function restore(feedIndex){

                $.ajax({
                url: "rprRestore.admin",
                data:{feedIndex:feedIndex},
                type: "POST",

                success: function(result) {
                    var html = '';
                    if(result>0) {
                        
                        alert("피드 신고 상태가 복구되었습니다")
                       
                        
                    } else {
                        alert("복구실패.")
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }
            });


            }

            //유저 누적신고수 업하기
            function rprCountUpdate(feedIndex){
                $.ajax({
                url: "rprUpdate.admin",
                data:{feedIndex:feedIndex},
                type: "POST",

                success: function(result) {
                    var html = '';
                    if(result>0) {

                        //console.log("누적신고 1 업됨")

                        
                    } else {
                        alert("누적신고up실패.")
                    }
                },

                error: function(jqXHR, textStatus, errorThrown) {
                    console.log("Error: " + textStatus + " " + errorThrown);
                }
            });
            }


            //게시물 클릭하면 디테일로넘어가는데...y인거는 왜 넘어감? ㅗ
            $(function(){
                $(".myTable>tbody>tr").click(function(){   // case 2 을 보면 됨

                        try {
                const isDeleted = ($(this).children().eq(7).text() === 'Y');
                console.log($(this).children().eq(7).text());
                
                if (isDeleted) {
                alert("삭제처리된 글입니다.");
                console.log("삭제탐");
                } else {
                const num = $(this).children().eq(0).text();
                location.href = '<%=contextPath%>/detail.fe?fno=' + num;
                }
                } catch (err) {
                    console.error(err);
                }
                        })
            })

        </script>


    </body>
    </html>