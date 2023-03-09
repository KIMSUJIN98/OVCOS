<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../common/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
	  /* display:flex; */
	  justify-content:space-around;
	  align-items:center;
	}
	.before, .after{
	  border: 1px solid black;
	  flex-direction:column;
	  align-items: center;
	  width:500px;
	}
	#image{
	  	width:500px;
	  	height:500px;
	}
	.aDiv{
	  width:500px;
	  height: 500px;
	}
</style>
</head>
<body>
	<div class="content">
		<div class="before">
			<h1>before</h1>
	    	<div>
	      		<canvas id="bCanvas" style="position:absolute;"></canvas>
				<img id="image">
	    	</div>
			<input id="imgFile" type="file" onchange="readURL(this);"> 
	  	</div>
	  	<div class="after">
	    	<h1>after</h1>
	    	<div class="aDiv" id="aDiv"></div>
	  	</div>
	</div>
	
	<script>
		var nomean; // 추가함
		function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('image').src = e.target.result;
		      nomean = e.target.result; // 추가함
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('image').src = "";
		    nomean = ""; // 추가함
		  }
		  
		  
		  
			var SIZE = 500;
			$(document).ready(function(){
			  var canvas = document.getElementById("bCanvas");
			  canvas.width=SIZE;
			  canvas.height=SIZE;
			  var ctx = canvas.getContext('2d');
			  
			  ctx.lineWidth = 3;
			  ctx.strokeStyle = "#ff0000";
			
			  var sX,sY,cX,cY;
			  var width, height;
			  var canvasX = $("#bCanvas").offset().left;
			  var canvasY = $("#bCanvas").offset().top;
			  var draw = false;
			  
			  // click 시 draw 시작
			  $("#bCanvas").mousedown(function(e){
			    sX=parseInt(e.clientX-canvasX);
			    sY=parseInt(e.clientY-canvasY);
			    draw = true;
			  })
			  $("#bCanvas").mousemove(function(e){
			    if(draw){
			      cX=parseInt(e.clientX-canvasX);
			      cY=parseInt(e.clientY-canvasY);
			      ctx.clearRect(0,0,canvas.width,canvas.height); //clear canvas
			      ctx.strokeRect(sX,sY,cX-sX,cY-sY);
			    }
			  })
			  // 마우스 놓으면 rectangle 완성 및 popup 생성
			  $("#bCanvas").mouseup(function(e){
			    draw = false;
			    
			    // 일정 크기 이상의 사각형일때 crop
			    var threshold = 10;
			    if(Math.abs(cX-sX)>threshold&&Math.abs(cY-sY)>threshold){
			    	drawCanvas(sX,sY,cX-sX,cY-sY);
			    }
			  })
			});
			
			function drawCanvas (x,y,width,height){
				$("#aDiv").children().remove();
			  var canvas = document.createElement("canvas");
			  var img = new window.Image();
			  /* var img = new Image(); */
			  
			  
			  var w,h;
			
			  if(Math.abs(width)<=Math.abs(height)){
			    h = SIZE;
			    w = h*width/height;
			  } else {
			    w = SIZE;
			    h = w*height/width;
			  }
			  canvas.width = w;
			  canvas.height = h;
			  
			  img.addEventListener("load", function () {
			  	var RATE = img.width/500;
			    canvas.getContext('2d').drawImage(img, x*RATE, y*RATE, width*RATE, height*RATE, (w-w*0.9)/2, (h-h*0.9)/2, w*0.9, h*0.9);
			    },false);
			  img.src = nomean; // 추가함
			  $("#aDiv").append(canvas);
			}
		  
		  
		  
		}
		
		
		
	</script>
	
</body>
</html>