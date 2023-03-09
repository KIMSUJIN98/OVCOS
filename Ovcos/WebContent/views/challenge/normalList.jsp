<%@ include file="../common/nav.jsp" %>
<%@page import="com.ovcos.challenge.model.vo.NormalChallenge"%>
<%@page import="com.ovcos.challenge.model.vo.Local"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<Local> list1 = (ArrayList<Local>)request.getAttribute("list1");
	ArrayList<NormalChallenge> list2 = (ArrayList<NormalChallenge>)request.getAttribute("list2");
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
                <h1 class="display-4 fw-bolder">일반</h1>
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
                        <!-- <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." /> -->
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
                                <button type="button" class="btn btn-outline-dark mt-auto" data-toggle="modal" data-target="#newCallengeNormal">새로운 모험</button>
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                        
                            <!-- The Modal -->
                            <div class="modal" id="newCallengeNormal">
                                <div class="modal-dialog">
                                    <div class="modal-content">

                                        <!-- Modal Header -->
                                        <div class="modal-header">
                                            <h4 class="modal-title">챌린지 생성</h4>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <!-- Modal body -->
                                        <div class="modal-body" align="center">
                                            <form action="" method="post" id="updatechallenge-form">
                                                <table class="newUpload">
                                                    <tr>
                                                        <td>
                                                            <input type="text" name="challengeName" required placeholder="챌린지명">
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <input type="date" min="2020-01-01" name="challengeDate">
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
                                                <br>
                                                <button type="submit" class="btn btn-secondary">등록</button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <% for(NormalChallenge n : list2) { %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">모집완료</div> -->
                            <!-- image -->
                            <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg"
                                alt="..." />
                            <!-- details -->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- name -->
                                    <h5 class="fw-bolder"><%= n.getNormalChallengeTitle() %></h5>
                                    <!-- summary -->
                                    <%= n.getNormalChallengeLocal() %><br>
                                    <%= n.getNormalChallengeDate() %><br>
                                    <%= n.getCount() %>
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
                
                <!-- The Modal -->
                <div class="modal" id="cntsDetail">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">챌린지 상세보기</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                Modal body..
                            </div>

                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>
                        </div>
                    </div>
                </div>
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
        var selectBox = function(){
            var selectLocal = document.getElementById("selectLocal");
            var local = (selectLocal.options[selectLocal.selectedIndex].value);
            console.log(local);
            location.href='<%= contextPath %>/ncList.ch?local=' + local;
        }
        // document.getElementById('selectLocal').value = "<?= $_GET['local'] ?>";
        // $('#selectLocal option[value=' + value + ']').prop('selected', true);

        // $(function(){
        //     $("#selectLocal").val("${param.sb_cate}").attr("selected","selected");
        // });

        // function selectBox(){
        //     $.ajax({
        //         url:"ncList.ch",
        //         data:{
        //             local:$("#selectLocal option:selected").val()
        //         },
        //         type:"get",
        //         success:function(e){
        //             console.log(e);
        //             location.href='<%= contextPath %>/ncList.ch?local=' + local;
        //         },
        //         // contentType: "application/json; charset=utf-8",
        //         // dataType: "json"
        //     })
        // }
    </script>

</body>
</html>