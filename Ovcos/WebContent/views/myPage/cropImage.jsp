<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%= contextPath %>/resources/js/cropper.js"></script>
<style>
	/* Limit image width to avoid overflow the container */
	img {
	  max-width: 100%; /* This rule is very important, please do not ignore this! */
	}
	
	#canvas {
	  height: 600px;
	  width: 600px;
	  background-color: #ffffff;
	  cursor: default;
	  border: 1px solid black;
	}
</style>
</head>
<body>
	<p>
	<!-- Below are a series of inputs which allow file selection and interaction with the cropper api -->
			<input type="file" id="fileInput" accept="image/*" />
			<input type="button" id="btnCrop" value="Crop" />
			<input type="button" id="btnRestore" value="Restore" />
	</p>
	<div>
	  <canvas id="canvas">
	    Your browser does not support the HTML5 canvas element.
	  </canvas>
	</div>		
	
	<div id="result"></div>
	
	<br>
	<br>
	<hr>
	
	<script>
		var canvas  = $("#canvas"),
	    context = canvas.get(0).getContext("2d"),
	    $result = $('#result');
	
		$('#fileInput').on( 'change', function(){
		    if (this.files && this.files[0]) {
		      if ( this.files[0].type.match(/^image\//) ) {
		        var reader = new FileReader();
		        reader.onload = function(evt) {
		           var img = new Image();
		           img.onload = function() {
		             context.canvas.height = img.height;
		             context.canvas.width  = img.width;
		             context.drawImage(img, 0, 0);
		             var cropper = canvas.cropper({
		               aspectRatio: 16 / 9
		             });
		             $('#btnCrop').click(function() {
		                // Get a string base 64 data url
		                var croppedImageDataURL = canvas.cropper('getCroppedCanvas').toDataURL("image/png"); 
		                $result.append( $('<img>').attr('src', croppedImageDataURL) );
		             });
		             $('#btnRestore').click(function() {
		               canvas.cropper('reset');
		               $result.empty();
		             });
		           };
		           img.src = evt.target.result;
						};
		        reader.readAsDataURL(this.files[0]);
		      }
		      else {
		        alert("Invalid file type! Please select an image file.");
		      }
		    }
		    else {
		      alert('No file(s) selected.');
		    }
		});
	</script>
	
</body>
</html>