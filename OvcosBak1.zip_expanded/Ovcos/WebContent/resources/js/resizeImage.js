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
  img.src = "https://user-images.githubusercontent.com/25702775/109247653-a1e30700-7827-11eb-887c-8811a2df6671.jpg";
  $("#aDiv").append(canvas);
}