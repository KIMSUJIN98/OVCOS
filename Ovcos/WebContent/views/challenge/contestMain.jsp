<%@page import="com.ovcos.challenge.model.vo.ContestChallenge"%>
<%@page import="com.ovcos.challenge.model.vo.Contest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	ArrayList<Contest> list = (ArrayList<Contest>)request.getAttribute("list");
%>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>대회목록</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${pageContext.request.contextPath}/resources/css/challengeStyles.css" rel="stylesheet" />
        <style>
            #updateContest-form input {
                width: 100%;
                box-sizing: border-box;
            }
        </style>

    </head>

    <body>
        <%@ include file="../common/nav.jsp" %>
            <!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-4 px-lg-5 my-5">
                    <div class="text-center text-white">
                        <h1 class="display-4 fw-bolder">대회</h1>
                        <p class="lead fw-normal text-white-50 mb-0">
                            대회 혼자가기 무섭니? <br>
                            같이 가보자GO!
                        </p>
                    </div>
                </div>
            </header>

            <!-- Button to Open the Modal -->
            <div style="float: left; padding-top: 30px; width: 84%;" align="right">
                <button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal"
                    data-target="#newCnts">대회추가</button>
            </div>

            <!-- The Modal -->
            <div class="modal" id="newCnts">
                <div class="modal-dialog">
                    <div class="modal-content">

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 class="modal-title">대회 추가</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body" align="center">
                            <form action="insertContest.ch" method="post" id="updateContest-form">
                                <table>
                                    <tr>
                                        <th>대회명</th>
                                        <td>
                                            <input type="text" name="contestName" required>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>대회날짜</th>
                                        <td>
                                            <input type="date" min="2020-01-01" name="contestDate">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>URL</th>
                                        <td>
                                            <input type="text" name="contestUrl">
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>이미지</th>
                                        <td>
                                            <input type="file" name="contestImg">
                                        </td>
                                    </tr>
                                </table>
                                <br>
                                <button type="submit" class="btn btn-secondary">등록</button>
                            </form>
                        </div>
                        
                        <!-- Modal footer -->
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Section-->
            <section class="py-5">
                <div class="container px-4 px-lg-5 mt-5">
                    <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-">
                    <% for(Contest c : list) { %>
                        <div class="col mb-5">
                            <div class="card h-100">
                                <a href="<%= c.getContestUrl() %>" target="_blank">
                                    <img class="card-img-top" src="../../resources/image/서울마라톤.PNG" alt="..." />
                                </a>
                                <div class="card-body p-4">
                                    <div class="text-center">
                                        <h5 class="fw-bolder"><%= c.getContestName() %></h5>
                                        <%= c.getContestDate() %>
                                    </div>
                                </div>
                                <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                    <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="ccList.ch?contestName=<%= c.getContestName() %>">참가하기</a></div>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </section>


            <!-- Footer-->
            <footer class="py-5 bg-dark">
                <div class="container">
                    <p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p>
                </div>
            </footer>
            <!-- Bootstrap core JS-->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            <!-- Core theme JS-->
            <script src="../../resources/js/scripts.js"></script>

    </body>

    </html>