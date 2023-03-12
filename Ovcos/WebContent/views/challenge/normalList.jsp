<%@ include file="../common/nav.jsp" %>
<%@page import="com.ovcos.challenge.model.vo.NormalChallenge"%>
<%@page import="com.ovcos.challenge.model.vo.Local"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Local> list1 = (ArrayList<Local>)request.getAttribute("list1");
	ArrayList<NormalChallenge> list2 = (ArrayList<NormalChallenge>)request.getAttribute("list2");
    Member LoginUser = (Member)request.getAttribute("loginUser");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OVCOS - 일반챌린지 목록</title>
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
    <!-- Header-->
    <header class="bg-dark py-5">
        <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
                <h1 class="display-4 fw-bolder">일반</h1><br>
                <h3 id="local-tag"></h3>
                <p class="lead fw-normal text-white-50 mb-0">
                	혼자 운동하는게 쉽지 않지? <br>
                	같이 즐기자GO! 
                </p>
            </div>
        </div>
    </header>
    
    <div style="float: left; padding-top: 30px; width: 84%;" align="right">
        <select name="local" id="selectLocal" onchange="selectBox();">
            <option value="99">선택</option>
            <option value="0">전체</option>
        <% for(Local l : list1) { %>
            <option value="<%= l.getLocalNo() %>"><%= l.getLocalName() %></option>
        <% } %>
    </select>
    </div>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center" style="margin-top: 50px;">
                                <h5 class="fw-bolder">챌린지 생성</h5>
                                새로운 챌린지를 <br>
                                생성해보세요!
                            </div>
                            <br><br>
                            <!-- Button to Open the Modal -->
                            <div class="text-center">
                                <button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#newNormalChallenge">새로운 모험</button>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <!-- The Modal -->
                            <div class="modal fade" id="newNormalChallenge">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">챌린지 생성</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>
                                        <!-- Modal body -->
                                        <form action="newNormalChallenge.ch" method="post" id="newchallenge-form" enctype="multipart/form-data">
                                        <input type="hidden" name="userId" value="<%= loginUser.getMemId() %>">
                                            <div class="modal-body" align="center">
                                                <table class="newUpload">
                                                    <tr>
                                                        <td>
                                                            <input type="text" name="challengeName" placeholder="챌린지명" required>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <select name="insertLocal" id="selectLocation">
                                                            <% for(Local l : list1) { %>
                                                                <option value="<%= l.getLocalNo() %>"><%= l.getLocalName() %></option>
                                                            <% } %>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="date" id="challengeDate" name="challengeDate" required>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="time" id="challengeTime" name="challengeTime" required>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="number" name="challengeMax" min="2" placeholder="최대인원 (최소 2명이상)" required>
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
                                                            <textarea name="challengeContent" cols="38" rows="10" style="resize: none;" placeholder="상세설명" required></textarea>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <!-- Modal footer -->
                                            <div class="modal-footer">
                                                <button type="submit" class="btn btn-primary" onclick="return checkDateTime();">등록</button>
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>    
                        </div>
                    </div>
                </div>
                <% int count = 0; %>
                <% for(NormalChallenge n : list2) { %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- <div id="icon-sm-complete" class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem; display: none;">모집완료</div> -->
                            <!-- <div id="icon-sm-entry" class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left: 0.5rem; display: none;">참가중</div> -->
                            <!-- <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">모집완료</div> -->
                            <!-- image -->
                            <% if(n.getChangeName() != null) { %>
                                <img class="card-img-top" height="160px" src="<%= contextPath %>/resources/upload/<%= n.getChangeName() %>" alt="..."/>
                            <% }else { %>
                                <img class="card-img-top" height="160px" src="<%= contextPath %>/resources/upload/defaultImg.png" alt="defaultImg.png"/>
                            <% } %>
                            <!-- details -->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- name -->
                                    <h5 class="fw-bolder"><%= n.getNormalChallengeTitle() %></h5>
                                    <!-- summary -->
                                    <%= n.getNormalChallengeLocal() %><br>
                                    <%= n.getNormalChallengeDate() %><br>
                                    <span id="hiddenTarget<%= n.getNormalChallengeNo() %>">
                                        참가인원 : <%= n.getCount() %> / <%= n.getNormalChallengeMax() %>
                                    </span>
                                    <span class="count-area2" id="area<%= n.getNormalChallengeNo() %>">
                                    </span>
                                </div>
                            </div>
                            <!-- actions -->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center">
                                    <button type="submit" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#detailNormalChallenge<%= count %>" onclick="checkEntryId(<%= n.getNormalChallengeNo() %>, <%= n.getNormalChallengeMax() %>);">상세보기</button>
                                </div>
                            </div>
                        </div>
                        
                        <!-- The Modal -->
                        <div class="modal fade" id="detailNormalChallenge<%= count %>">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <!-- Modal Header -->
                                    <div class="modal-header">
                                        <h4 class="modal-title ml-auto"><%= n.getNormalChallengeTitle() %></h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <!-- Modal body -->
                                    <div class="modal-body" align="center">
                                        <table class="detail" style="width: 700px;">
                                            <tr>
                                                <td>
                                                    <span>
                                                        챌린지 날짜 : <%= n.getNormalChallengeDate() %> 
                                                    </span>
                                                    <span id="uploadNick">
                                                        등록자 : <%= n.getNormalChallengeId() %>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                	<% if(n.getChangeName() != null) { %>
                                                        <img class="card-img-top" width="100%" height="500px" src="<%= contextPath %>/resources/upload/<%= n.getChangeName() %>" alt="..."/>
                                                    <% }else { %>
                                                        <img class="card-img-top" width="100%" height="500px" src="<%= contextPath %>/resources/upload/defaultImg.png" alt="defaultImg.png"/>
                                                	<% } %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <%= n.getNormalChallengeContent() %>
                                                </td>
                                            </tr>
                                            <tr class="count-area">
                                                <td>
                                                	<!--  -->
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                	업로드날짜 : <%= n.getEnrollDate() %>
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
                                        <% if(loginUser != null && !loginUser.getMemId().equals(n.getNormalChallengeId())) { %>
                                            <input type="submit" id="entry<%= count %>" class="btn btn-lg btn-outline-primary" value="참가하기" onclick="enterControll(<%= n.getNormalChallengeNo() %>, <%= n.getNormalChallengeMax() %>, <%= count %>);">
                                        <% } %>
                                    </div>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-sm btn-danger mr-auto ml-0">신고</button>
                                        <% if(loginUser != null && loginUser.getMemId().equals(n.getNormalChallengeId()) || Integer.parseInt(loginUser.getMemStatus()) == 5) { %>
                                            <button type="button" class="btn btn-sm btn-secondary">수정</button>
                                            <button type="button" class="btn btn-sm btn-dark mt-auto" data-toggle="modal" data-target="#delete" onclick="castNo(<%= n.getNormalChallengeNo() %>);">삭제</button>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <% count++; %>
                <% } %>
            </div>
        </div>
    </section>

    <!-- 삭제 Modal -->
    <div class="modal fade" id="delete">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">챌린지 삭제</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <!-- Modal body -->
                <form action="deleteNormalChallenge.ch" method="post" id="deleteNormal-form">
                    <input type="hidden" id="delNo" name="normalChallengeNo" value="">
                    <div class="modal-body" align="center">
                        <b>
                            삭제 후 복구가 불가능 합니다. <br>
                            정말로 삭제하시겠습니까? 
                        </b>
                        <br><br>
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
        var selectBox = function(local){
            var selectLocal = document.getElementById("selectLocal");
            var local = (selectLocal.options[selectLocal.selectedIndex].value);
            // console.log(local);
            location.href='<%= contextPath %>/ncList.ch?local=' + local;
            // console.log(selectLocal.options[selectLocal.selectedIndex].text);
            $("#local-tag").val(selectLocal.options[selectLocal.selectedIndex].text);

            // $.ajax({
            //     url:"selectLocalView.ch",
            //     data:{
            //         localNo:local
            //     },
            //     type:"post",
            //     success:function(result){
            //         console.log(result);
            //     },
            //     error:function(){
            //         console.log("실패!");
            //     }
            // })
        }

        function checkDateTime(){
            var inputDate = $("#challengeDate").val();
            console.log(inputDate);
            var todayDate = new Date();
            var year = todayDate.getFullYear();
            var month = ('0' + (todayDate.getMonth() + 1)).slice(-2);
            var day = ('0' + todayDate.getDate()).slice(-2);
            var sysdate = year + '-' + month  + '-' + day;
            console.log(sysdate);

            var inputTime = $("#challengeTime").val();
            console.log(inputTime);
            var todayTime = new Date();   
            var hours = ('0' + todayTime.getHours()).slice(-2); 
            var minutes = ('0' + todayTime.getMinutes()).slice(-2);
            var systime = hours + ':' + minutes;
            console.log(systime);

            if(inputDate < sysdate){
                alert("과거로 돌아갈 수는 없어요..ㅠ 날짜를 다시 확인해주세요.");
                return false;
            }

            if(inputDate == sysdate){
                if(inputTime < systime){
                    alert("시간을 확인해주세요.");
                    return false;
                }
            }
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

        // function checkPwd(){
        //     const userPwd = document.getElementById("userPwd").value();
        //     console.log(<%= loginUser.getMemPwd() %>);
        //     console.log(userPwd);

        //     if(userPwd != <%= loginUser.getMemPwd() %>) {
        //     	alert("비밀번호가 일치하지 않습니다.");
        //     	return false;
        //     }
        // }

        function castNo(num){
            $("#delNo").val(num);
            // console.log(num);
        }
        
        // ajax 상세보기 버튼 참가여부 확인
        function checkEntryId(num, max, count){
            $.ajax({
                url:"normalCheckEntryId.ch",
                data:{
                    normalChallengeNo:num
                },
                type:"post",
                success:function(result){
                    console.log(result)
                    if(result > 0){
                        console.log("참가중");
                        $("#entry").val("참가중");
                        document.getElementById('entry').className = 'btn btn-lg btn-primary';
                        // insertEntryList(num, max);
                        selectEntryList(num, max, count)
                    }else{
                        console.log("미참가");
                        $("#entry").val("참가하기");
                        document.getElementById('entry').className = 'btn btn-lg btn-outline-primary';
                        deleteEntryList(num, max, count);
                        selectEntryList(num, max, count);
                    }
                },
                error:function(){
                    console.log("실패!");
                }
            })
        }

        // 엔트리 버튼 컨트롤
        function enterControll(num, max, count){
            if($("#entry" + count).val() == '참가하기') {
                $("#entry" + count).val("참가중");
                $("#entry" + count).attr("class", "btn btn-lg btn-primary");
                console.log(num);
                insertEntryList(num, max, count);
            }else if($("#entry" + count).val() == '참가중') {
                $("#entry" + count).val("참가하기");
                $("#entry" + count).attr("class", "btn btn-lg btn-outline-primary");
                deleteEntryList(num, max, count);
            }
        }

        // ajax 엔트리 리스트 참가
        function insertEntryList(num, max, count){
            $.ajax({
                url:"normalEntryInsert.ch",
                data:{
                    normalChallengeNo:num
                },
                type:"post",
                success:function(result){
                    console.log(result)
                    if(result > 0){
                        console.log("성공!");
                        selectEntryList(num, max, count);
                    }
                },
                error:function(){
                    console.log("실패!");
                }
            })
        }

        // ajax 엔트리 리스트 참가취소
        function deleteEntryList(num, max, count){
            $.ajax({
                url:"normalEntryDelete.ch",
                data:{
                    normalChallengeNo:num
                },
                type:"post",
                success:function(result){
                    console.log(result)
                    if(result > 0){
                        console.log("성공!");
                        selectEntryList(num, max, count);
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
                url:"normalEntryList.ch",
                data:{
                    normalChallengeNo:num
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
                    $(".count-area>td").html(value);
                    
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

        function closeEntry(num, count){
            if($("#entry" + count).val() == '참가하기') {
                $("#entry" + count).val("모집완료");
                $("#entry" + count).attr("disabled", true);
                $("#entry" + count).attr("class", "btn btn-lg btn-dark");
            }
        }

    </script>

</body>
</html>