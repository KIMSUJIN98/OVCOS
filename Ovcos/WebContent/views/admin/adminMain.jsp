<%@page import="com.ovcos.feed.model.vo.Feed"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String contextPath = request.getContextPath();
ArrayList<Feed> list = (ArrayList<Feed>)request.getAttribute("list");
%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                
            }
            table *{
                text-align: center;
                 border: 1px solid gray;
            }
    
            #table1{
                float: left;
            }
    
        </style>
        
        </head>
        <body>
    
            <%@ include file ="adminNav.jsp"%>
            <div id="header">
            <h1>관리자메인</h1>
            </div>
    
            <div id="wrap">
            <div id="table1">
                <table class="myTable table hover" >
                    <h3>문의 </h3>
                    <thead align="center">
                        <tr>
                            <th width="70">피드번호</th>
                            <th width="300">제목</th>

                        </tr>
                    </thead>
                    <tbody >
                        <!-- case1. 게시글이 없을 경우 == 리스트가 텅 비어 있을때-->
                         
                        
                    </tbody>
                </table>
            </div>
            
            
            
            
            <div id="table2">
                <table class="myTable table hover" >
                    <h3>최근 등록한 코스</h3>
                    <thead align="center">
                        <tr>
                            <th width="100">게시글</th>
                            <th width="300">코스</th>
                        
                        </tr>
                    </thead>
                    <tbody >
                       <% if(list.isEmpty()) { %>
                        <tr>
                            <td colspan="6">조회된 데이터가 없습니다.</td>
                        </tr>
                        <%} else { %>
                        <%  for (int i = 0; i <= 4 && i < list.size(); i++) { %>
                        <tr>
                            <td><%= list.get(i).getFeedIndex() %></td>
                            <td><%= list.get(i).getOriginName() %></td>

                        </tr>
                        <% } %>
                        <%} %> 
                        
                    </tbody>
                </table>


            </div>
                
            </div>


    </body>
    </html>