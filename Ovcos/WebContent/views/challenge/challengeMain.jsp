<%@page import="com.ovcos.challenge.model.vo.EntryList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int contestProgressCount = (int)request.getAttribute("contestProgressCount");
	int contestCompleteCount = (int)request.getAttribute("contestCompleteCount");
	int normalProgressCount = (int)request.getAttribute("normalProgressCount");
	int normalCompleteCount = (int)request.getAttribute("normalCompleteCount");
	int totalProgressCount = (int)request.getAttribute("totalProgressCount");
	int totalCompleteCount = (int)request.getAttribute("totalCompleteCount");
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
                    <h1 class="display-4 fw-bolder">나의 챌린지</h1>
                    <p class="lead fw-normal text-white-50 mb-0">
                        <span>참가중 <%= totalProgressCount %> [대회 : <%= contestProgressCount %> / 일반 : <%= normalProgressCount %>]</span> <br>
                        <span>참가완료 <%= totalCompleteCount %> [대회 : <%= contestCompleteCount %> / 일반 : <%= normalCompleteCount %>]</span>
                    </p>
                </div>
            </div>
        </header>

        <!-- Section-->
        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">
                <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder">챌린지</h5>
                                    <!-- Product price-->
                                    설명요약 <br> (날짜 인원 대회명)
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a>
                                </div>
                            </div>
                        </div>
                    </div>
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