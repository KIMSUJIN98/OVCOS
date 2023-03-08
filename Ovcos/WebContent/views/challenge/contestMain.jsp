<%@ include file="../common/nav.jsp" %>
<%@page import="com.ovcos.upload.model.vo.ImageUpload"%>
<%@page import="com.ovcos.challenge.model.vo.ContestChallenge"%>
<%@page import="com.ovcos.challenge.model.vo.Contest"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
	ArrayList<Contest> list = (ArrayList<Contest>)request.getAttribute("list");
	Member LoginUser = (Member)request.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OVCOS - 대회목록</title>
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
    <% if(loginUser != null && Integer.parseInt(loginUser.getMemStatus()) == 5) { %>
    <div style="float: left; padding-top: 30px; width: 84%;" align="right">
        <button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#newCnts">대회추가</button>
    </div>
    <% } %>
    <!-- 대회 추가 Modal -->
    <div class="modal fade" id="newCnts">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">대회 추가</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <form action="insertContest.ch" method="post" id="insertContest-form" enctype="multipart/form-data">
                    <div class="modal-body" align="center">
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
                                    <input type="datetime-local" min="2020-01-01" name="contestDate">
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
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-sm btn-primary">등록</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 대회 수정 Modal -->
    <div class="modal fade" id="update">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">대회 수정</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <form action="updateContest.ch" method="post" id="updateContest-form" enctype="multipart/form-data">
                    <div class="modal-body" align="center">
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
                                    <input type="datetime-local" min="2020-01-01" name="contestDate">
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
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary">수정</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- 대회 삭제 Modal -->
    <div class="modal fade" id="delete">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">대회 삭제</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <form action="deleteContest.ch" method="post" id="deleteContest-form">
                <input type="hidden" id="delNo" name="contestNo">
                    <div class="modal-body" align="center">
                        <p>
                            삭제 후 복구가 불가능 합니다. <br>
                            정말로 삭제하시겠습니까?
                        </p>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-sm btn-danger">삭제</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <% if(list != null) { %>
                <% for(Contest c : list) { %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- image -->
                            <a href="<%= c.getContestUrl() %>" target="_blank">
                                <img class="card-img-top" height="160px" src="<%= contextPath %>/resources/upload/<%= c.getChangeName() %>" alt="..." />
                            </a>
                            <!-- details -->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- name -->
                                    <h5 class="fw-bolder"><%= c.getContestName() %></h5>
                                    <!-- summary -->
                                    <%= c.getContestDate() %>
                                </div>
                            </div>
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <a class="btn btn-outline-dark mt-auto" href="ccList.ch?contestNo=<%= c.getContestNo() %>">참가하기</a> <br><br>
                                    <% if(loginUser != null && Integer.parseInt(loginUser.getMemStatus()) == 5) { %>
                                    <button type="button" class="btn btn-sm btn-outline-dark mt-auto" data-toggle="modal" data-target="#update">수정</button>
                                    <button type="button" class="btn btn-sm btn-outline-dark mt-auto" data-toggle="modal" data-target="#delete" onclick="contestNo(<%= c.getContestNo() %>);">삭제</button>
                                    <% } %>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } %>
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

    <script>
        function contestNo(contestNo){
            $("#delNo").val(contestNo);
            console.log(contestNo);
        }
    </script>

</body>

</html>