<%@page import="com.ovcos.challenge.model.vo.EntryList"%>
<%@ include file="../common/nav.jsp" %>
<%@page import="com.ovcos.challenge.model.vo.Contest"%>
<%@page import="com.ovcos.challenge.model.vo.ContestChallenge"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<ContestChallenge> list = (ArrayList<ContestChallenge>)request.getAttribute("list");
	Contest c = (Contest)request.getAttribute("c");
    Member LoginUser = (Member)request.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OVCOS - 대회챌린지 목록</title>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="${pageContext.request.contextPath}/resources/css/challengeStyles.css" rel="stylesheet" />
<!-- summernote -->
<script src="resources/js/summernote/summernote-lite.js"></script>
<script src="resources/js/summernote/summernote-ko-KR.js"></script>

<!-- <link rel="stylesheet" href="resources/css/summernote-lite.css"> -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">

<style>
    .modal-body input{
        width: 300px;
    }

    .newUpload span{
        font-size: 13px;
        color: gray;
    }

</style>

</head>

<body>
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder"><%= c.getContestName() %></h1>
                <p class="lead fw-normal text-white-50 mb-0"></p>
            </div>
        </div>
    </header>
    
    
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
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
                            <!-- actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <!-- Button to Open the Modal -->
                                    <button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#newContestChallenge" onclick="substringDate('<%= c.getContestDate() %>');">새로운 모험</button>
                                </div>
                            </div>

                        </div>
                    </div>
                    <!-- The Modal -->
                    <div class="modal fade" id="newContestChallenge">
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
                                <input type="hidden" name="contestNo" value="<%= c.getContestNo() %>">
                                    <div class="modal-body" align="center">
                                        <table class="newUpload">
                                            <tr>
                                                <td>
                                                    <h4><%= c.getContestName() %></h4>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" name="challengeName" required placeholder="챌린지명">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="text" id="challengeDate" name="challengeDate" style="background-color: lightgray; color: gray;" readonly>
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
                                                    <input type="number" name="challengeMax" min="2" placeholder="최대인원 (최소 2명이상)">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <input type="file" name="challengeImg">
                                                    <br>
                                                    <span>이미지 파일을 업로드 해주세요.</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <textarea id="summernote" name="challengeContent" required></textarea>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="submit" class="btn btn-primary" onclick="return checkTime('<%= c.getContestDate() %>');">등록</button>
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <% int count = 0; %>
                <% for(ContestChallenge cc : list) { %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- <div id="icon-sm-complete" class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem; display: none;">모집완료</div> -->
                            <!-- <div id="icon-sm-entry" class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left: 0.5rem; display: none;">참가중</div> -->
                            <!-- <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">모집완료</div> -->
                            <!-- image -->
                            <% if(cc.getChangeName() != null) { %>
                                <img class="card-img-top" height="160px" src="<%= contextPath %>/resources/upload/<%= cc.getChangeName() %>" alt="..."/>
                            <% }else { %>
                                <img class="card-img-top" height="160px" src="<%= contextPath %>/resources/upload/defaultImg.png" alt="defaultImg.png"/>
                            <% } %>
                            <!-- details -->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- name -->
                                    <h5 class="fw-bolder"><%= cc.getContestChallengeTitle() %></h5>
                                    <!-- summary -->
                                    <%= c.getContestName() %><br>
                                    <%= cc.getContestChallengeDate() %><br>
                                    <span id="hiddenTarget<%= cc.getContestChallengeNo() %>">
                                        참가인원 : <%= cc.getCount() %> / <%= cc.getContestChallengeMax() %>
                                    </span>
                                    <span class="count-area2" id="area<%= cc.getContestChallengeNo() %>">
                                    </span>
                                </div>
                            </div>
                            <% count++; %>
                            <!-- actions -->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <!-- <a class="btn btn-outline-dark mt-auto" href="#">참가하기</a> -->
                                    <button type="submit" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#detailContestChallenge<%= count %>" onclick="checkEntryId(<%= cc.getContestChallengeNo() %>, <%= cc.getContestChallengeMax() %>);">상세보기</button>
                                </div>
                            </div>
                        </div>
                        
                        <!-- The Modal -->
                        <div class="modal fade" id="detailContestChallenge<%= count %>">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title ml-auto"><%= cc.getContestChallengeTitle() %></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <!-- Modal body -->
                                    <div class="modal-body" align="center">
                                        <table class="detail" style="width: 400px;">
                                            <tr>
                                                <td>
                                                    <span>
                                                        챌린지 날짜 : <%= cc.getContestChallengeDate() %> 
                                                    </span>
                                                    <span id="uploadNick">
                                                        등록자 : <%= cc.getContestChallengeId() %>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <% if(cc.getChangeName() != null) { %>
                                                        <img class="card-img-top" width="400px" height="300px" src="<%= contextPath %>/resources/upload/<%= cc.getChangeName() %>" alt="..."/>
                                                    <% }else { %>
                                                        <img class="card-img-top" width="400px" height="300px" src="<%= contextPath %>/resources/upload/defaultImg.png" alt="defaultImg.png"/>
                                                    <% } %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <%= cc.getContestChallengeContent() %>
                                                </td>
                                            </tr>
                                            <tr id="count-area">
                                                <td>
                                                    <!--  -->
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    업로드날짜 : <%= cc.getEnrollDate() %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                </td>
                                            </tr>
                                        </table>
                                        <br><br><br>
                                        <% if(loginUser != null && !loginUser.getMemId().equals(cc.getContestChallengeId())) { %>
                                            <input type="submit" id="entry" class="btn btn-lg btn-outline-primary" value="참가하기" onclick="enterControll(<%= cc.getContestChallengeNo() %>, <%= cc.getContestChallengeMax() %>);">
                                            <button id="trigger-btn" style="display: none;" onclick="iconShow(<%= cc.getCount() %>, <%= cc.getContestChallengeMax() %>);"></button>
                                            <!-- <input type="submit" id="entry" class="btn btn-lg btn-outline-primary" value="참가하기" onclick="checkEntryId(<%= cc.getContestChallengeNo() %>, <%= cc.getContestChallengeMax() %>);"> -->
                                        <% } %>
                                    </div>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-sm btn-danger mr-auto ml-0">신고</button>
                                        <% if(loginUser != null && loginUser.getMemId().equals(cc.getContestChallengeId()) || Integer.parseInt(loginUser.getMemStatus()) == 5) { %>
                                            <button type="button" class="btn btn-sm btn-secondary">수정</button>
                                            <button type="button" class="btn btn-sm btn-dark mt-auto" data-toggle="modal" data-target="#delete" onclick="castNo(<%= cc.getContestChallengeNo() %>);">삭제</button>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        </div>
    </section>

    <!-- 대회 삭제 Modal -->
    <div class="modal fade" id="delete">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">챌린지 삭제</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <form action="deleteContestChallenge.ch" method="post" id="deleteContest-form">
                    <input type="hidden" id="delNo" name="contestChallengeNo" value="">
                    <input type="hidden" name="contestNo" value="<%= c.getContestNo() %>">
                    <div class="modal-body" align="center">
                        <b>
                            삭제 후 복구가 불가능 합니다. <br>
                            정말로 삭제하시겠습니까? 
                        </b>
                        <br><br>

                        비빌번호 : <input type="password" id="userPwd" required>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-sm btn-danger" onclick="return checkPwd();">삭제</button>
                        <button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">닫기</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <!-- Footer-->
    <footer class="py-5 bg-dark">
        <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="../../resources/js/scripts.js"></script>

    <script>
        // $(window).load(function(){
    	// 	$("#trigger-btn").trigger("click");
        //     iconShow(num, max);
    	// })

        // $(function(){

        // })

        // summernote
        $(document).ready(function() {
            $('#summernote').summernote({
                
                height: 300,
                lang: "ko-KR",
                placeholder: '상세 내용을 입력하세요.',
                toolbar: [
							['style', ['style']],
							['fontsize', ['fontsize']],
							['font', ['bold', 'italic', 'underline', 'clear']],
							['fontname', ['fontname']],
							['color', ['color']],
							['para', ['ul', 'ol', 'paragraph']],
							['height', ['height']],
							['view', ['codeview']],
							['help', ['help']]
						]
            })
        })

        function substringDate(contestDate){
            var all = contestDate;
            var date1 = contestDate.split(" ");
            var date2 = date1[0].substring(0, 10);
            var date3 = date1[1].substring(0, 5);

            // console.log(contestDate);
            $("#challengeDate").val(date2);
            $("#contestTime").html("대회시간 " + date3)
        }

        function checkTime(contestTime){
            var inputTime = $("#challengeTime").val();
            // console.log(contestTime);
            // console.log(inputTime);

            var date1 = contestTime.split(" ");
            // console.log(date1);
            var date2 = date1[1].substring(0, 5);
            // console.log(date2);

            if(inputTime > date2){
                alert("시간을 다시 확인해주세요.");
                return false;
            }
        }

        function checkPwd(){
            const userPwd = document.getElementById("userPwd").value();
            console.log(<%= loginUser.getMemPwd() %>);
            console.log(userPwd);

            if(userPwd != <%= loginUser.getMemPwd() %>) {
            	alert("비밀번호가 일치하지 않습니다.");
            	return false;
            }
        }

        function castNo(num){
            $("#delNo").val(num);
            // console.log(num);
        }
        
        // ajax 상세보기 버튼 참가여부 확인
        function checkEntryId(num, max){
            $.ajax({
                url:"checkEntryId.ch",
                data:{
                    contestChallengeNo:num
                },
                type:"post",
                success:function(result){
                    console.log(result)
                    if(result > 0){
                        console.log("참가중");
                        $("#entry").val("참가중");
                        document.getElementById('entry').className = 'btn btn-lg btn-primary';
                        // insertEntryList(num, max);
                        selectEntryList(num, max);
                    }else{
                        console.log("미참가");
                        $("#entry").val("참가하기");
                        document.getElementById('entry').className = 'btn btn-lg btn-outline-primary';
                        deleteEntryList(num, max);
                        selectEntryList(num, max);
                    }
                },
                error:function(){
                    console.log("실패!");
                }
            })
        }

        // 엔트리 버튼 컨트롤
        function enterControll(num, max){
            if($("#entry").val() == '참가하기') {
                $("#entry").val("참가중");
                document.getElementById('entry').className = 'btn btn-lg btn-primary';
                insertEntryList(num, max);
            }else if($("#entry").val() == '참가중') {
                $("#entry").val("참가하기");
                document.getElementById('entry').className = 'btn btn-lg btn-outline-primary';
                deleteEntryList(num, max);
            }
        }

        // ajax 엔트리 리스트 참가
        function insertEntryList(num, max){
            $.ajax({
                url:"entryInsert.ch",
                data:{
                    contestChallengeNo:num
                },
                type:"post",
                success:function(result){
                    console.log(result)
                    if(result > 0){
                        console.log("성공!");
                        selectEntryList(num, max);
                    }
                },
                error:function(){
                    console.log("실패!");
                }
            })
        }

        // ajax 엔트리 리스트 참가취소
        function deleteEntryList(num, max){
            $.ajax({
                url:"entryDelete.ch",
                data:{
                    contestChallengeNo:num
                },
                type:"post",
                success:function(result){
                    console.log(result)
                    if(result > 0){
                        console.log("성공!");
                        selectEntryList(num, max);
                    }
                },
                error:function(){
                    console.log("실패!");
                }
            })
        }

        // ajax 엔트리 리스트 조회
        function selectEntryList(num, max){
            $.ajax({
                url:"entryList.ch",
                data:{
                    contestChallengeNo:num
                },
                success:function(result){
                    console.log(result);
                    let value = "";
                    let value2 = "";
                    let value3 = "";

                    for(let i = 0; i < result.length; i++){
                        value += "<span>" + (i+1) + " : " + result[i].memNick + " 님</span><br>";
                    }
                    
                    value3 += "등록자 : " + result[0].memNick + " 님"
                    $("#uploadNick").html(value3);

                    value += "<span>참가인원 : " + result.length + " / " + max + "</span>";
                    $("#count-area>td").html(value);
                    
                    $("#hiddenTarget" + num).remove();
                    
                    value2 += "참가인원 : " + result.length + " / " + max;
                    $("#area" + num).html(value2);


                    if(result.length == max) {
                        console.log("max!!");
                        closeEntry();
                    }
                },
                error:function(){
                    console.log("실패!");
                }
            })
        }

        function closeEntry(){
            if($("#entry").val() == '참가하기') {
                $("#entry").val("모집완료");
                $("#entry").attr("disabled", true);
                // $("#icon-sm").show();
                document.getElementById('entry').className = 'btn btn-lg btn-dark';
            }
        }

        // function iconShow(num, max){
        //     if(num == max){
        //         document.getElementById("icon-sm-complete").style.display = 'block';
        //     }else {
        //         document.getElementById("icon-sm-complete").style.display = 'none';
        //     }
        // }

    </script>


</body>
</html>