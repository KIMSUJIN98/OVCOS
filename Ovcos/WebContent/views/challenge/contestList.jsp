<%@page import="com.ovcos.challenge.model.vo.ContestChallenge"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ContestChallenge> list = (ArrayList<ContestChallenge>)request.getAttribute("list");
	String contestName = (String)request.getAttribute("contestName");
    String contestDate = (String)request.getAttribute("contestDate");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>챌린지</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/favicon.ico" />
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath}/resources/css/challengeStyles.css" rel="stylesheet" />

<style>
    .modal-body input {
        width: 300px;
    }

    .newUpload span{
        font-size: 13px;
        color: gray;
    }
</style>

</head>

<body>
    <%@ include file="../common/nav.jsp" %>
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder"><%= contestName %></h1>
                <p class="lead fw-normal text-white-50 mb-0"></p>
            </div>
        </div>
    </header>
    
    
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div id="scroll" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- details-->
                        <div class="card-body p-4">
                            <div class="text-center" style="margin-top: 50px;">
                                <h5 class="fw-bolder">챌린지 생성</h5>
                                새로운 챌린지를 <br>
                                생성해보세요!
                            </div>
                            <br><br>
                            <div class="text-center">
                                <!-- Button to Open the Modal -->
                                <button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#newCallengeContest" onclick="substringDate('<%= contestDate %>');">새로운 모험</button>
                            </div>
                        </div>
                        <!-- actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- The Modal -->
                            <div class="modal" id="newCallengeContest">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">챌린지 생성</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <!-- Modal body -->
                                        <form action="newContestChallenge.ch" method="post" id="newchallenge-form" enctype="multipart/form-data">
                                        <input type="hidden" name="userId" value="<%= loginUser.getMemId() %>">
                                            <div class="modal-body" align="center">
                                                <table class="newUpload">
                                                    <tr>
                                                        <td>
                                                            <input type="text" name="challengeName" required placeholder="챌린지명">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="text" id="challengeDate" name="challengeDate" readonly>
                                                            <br>
                                                            <span id="contestTime"></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="time" id="challengeTime" name="challengeTime">
                                                            <br>
                                                            <span>대회 시간보다 늦은 시간은 등록이 불가합니다.</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="contest" id="selectContest" disabled>
                                                                <option name="contest" value="<%= contestName %>"><%= contestName %></option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="number" name="challengeMax" min="2" placeholder="최대인원 (최소 2명이상)">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="file" name="contestImg">
                                                            <br>
                                                            <span>이미지 파일을 업로드 해주세요.</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <textarea name="challengeContent" cols="38" rows="10" style="resize: none;" placeholder="상세설명"></textarea>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary" onclick="return checkTime('<%= contestDate %>');">등록</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
				<% for(ContestChallenge c : list) { %>
                   <div class="col mb-5">
                       <div class="card h-100">
                           <!-- image -->
                           <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                               alt="..." />
                           <!-- details -->
                           <div class="card-body p-4">
                               <div class="text-center">
                                   <!-- name -->
                                   <h5 class="fw-bolder"><%= c.getContestChallengeTitle() %></h5>
                                   <!-- summary -->
                                   <%= c.getContestNo() %><br>
                                   <%= c.getContestChallengeDate() %><br>
                                   참가인원 : <%= c.getCount() %> / <%= c.getContestChallengeMax() %>
                               </div>
                           </div>
                           <!-- actions -->
                           <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                               <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a>
                               </div>
                           </div>
                       </div>
                   </div>
                   <% } %>
            </div>
        </div>
    </section>
    
    
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../../resources/js/scripts.js"></script>

    <script>
        function substringDate(contestDate){
            var all = contestDate;
            var date1 = contestDate.split(" ");
            var date2 = date1[0].substring(0, 10);
            var date3 = date1[1].substring(0, 5);

            console.log(contestDate);
            $("#challengeDate").val(date2);
            $("#contestTime").html("대회시간 " + date3)
        }

        function checkTime(contestTime){
            var inputTime = $("#challengeTime").val();
            var date1 = contestTime.split(" ");
            var date2 = date1[1].substring(0, 5);

            if(inputTime > date2){
                alert("시간을 다시 확인해주세요.");
                return false;
            }
        }

        // var count = 2;
        // window.onscroll = function () {
        //     if ((window.innerHeight + window.scrollY) >= document.body.offsetHeight) {
        //         var toAdd = document.createElement("div");
        //         toAdd.classList.add("col")
        //         toAdd.classList.add("mb-5")
        //         toAdd.innerHTML = 
        //                 `
        //                 <div class="card h-100">
        //                     <!-- Product image-->
        //                     <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />
        //                     <!-- Product details-->
        //                     <div class="card-body p-4">
        //                         <div class="text-center">
        //                             <!-- Product name-->
        //                             <h5 class="fw-bolder">챌린지</h5>
        //                             <!-- Product price-->
        //                             상세설명
        //                         </div>
        //                     </div>
        //                     <!-- Product actions-->
        //                     <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
        //                         <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">참가하기</a></div>
        //                     </div>
        //                 </div>
        //                 `
        //         document.getElementById('scroll').appendChild(toAdd);
        //     }
        // }

    </script>


</body>
</html>