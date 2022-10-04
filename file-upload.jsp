<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<style>
	.image-area{
 	display:flex;

}

	#jb {
		width: 100%;
		height: 50px;
	}



</style>
<script>
var upload_list = [];
$(function(){
	$("#input-file").change(function(evt){

		var tgt = evt.target || window.event.srcElement,
		files = tgt.files;
		
		if(!files){
			alert('대상이 없습니다.');
			return;
		}
		upload_list =[];
		
		$("file-count").text('File List:'+files.length);
		let code = ``;		
		for(index in files){
			//자바 스크립트에서는 리스트로 나오다가 맵으로 나올수 있음(숫자가 아니라 문자가 나올수 있음)
			if(index==='length'){
				break;
			}
			upload_list.push(files[index]);
			code += '<li class="list-group-item">'+files[index].name+'</li>';
		}
		$("#file-list").html(code);

	});
});

function addFiles(){
	
	
	$("#input-files").val('');
	$("#input-file").click();
	
}

function upload(){
	//------test
	var elem = document.getElementById("jb");
	var width = 10;
	var id = setInterval(frame, 10);
	function frame() {
		if (width >= 100) {
			clearInterval(id);
		} else {
			width++;
			elem.style.width = width + '%';
			document.getElementById("jb").innerHTML = width * 1 + '%';
		}
	}
	//----test
	$("#file-upload-btn").attr("disabled", true);
	if(upload_list.length > 0){

		(function proc(idx){
			document.getElementById( 'jb' ).value = "100"; //바테스트
			//var jb = (upload_list.loaded / upload_list.total) * 100;

			if(idx < upload_list.length){

				$.ajax({
					url : 'http://localhost:8181/file/upload',
					type : 'POST',
					processData:false,
					contentType:false,
					data :upload_list[idx],
					beforeSend: function (xhr) {
			            xhr.setRequestHeader("file-name",upload_list[idx].name);
			            xhr.setRequestHeader("file-size", upload_list[idx].length);
			        },
					success: function(){
						console.log('end');
						proc(++idx);
					},
					error : function(e){
						alert(upload_list[idx].name +' : '+'오류');
						$("#file-upload-btn").attr("disabled", false);
					}, complete : function(){
						document.getElementById( 'jb' ).value = '0';
					}
				});
			}else{
				$("#file-upload-btn").attr("disabled", false);
			}


		})(0);
	}else{
		$("#file-upload-btn").attr("disabled", false);
		alert('대상을 선택해주세요');
	}
}

</script>

<!DOCTYPE html>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Tenth navbar example">
	<div class="container-fluid">
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample08" aria-controls="navbarsExample08" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse justify-content-md-center" id="navbarsExample08">
			<ul class="navbar-nav">
				<li class="nav-item">
					<a class="nav-link active" aria-current="page" href="/file-view">Raspberry pi NAS</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/file-view">File_View</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="/file/">File_UpLoad</a>
				</li>
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Menu</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item" href="/file-view">File_View</a></li>
						<li><a class="dropdown-item" href="/file/">File_UpLoad</a></li>
						<li><a class="dropdown-item" href="#">___</a></li>
						<li><a class="dropdown-item" href="#">LogOut</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>

<div class="container">
	<div class="accordion" id="accordionExample">
		<div class="accordion-item">
			<h2 class="accordion-header" id="headingOne">
				<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					Nas Web에 파일을 업로드 합니다.
				</button>
			</h2>
			<div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
				<div class="accordion-body">
					<strong>Raspberry pi NAS 에서는,</strong> 개인의 파일과 여러 회원들 사이에서 게시한 파일을 공유 할 수 있습니다.
				</div>
			</div>
		</div>
	<!-- Outer Row -->
	<div class="row justify-content-center">

		<div class="col-xl-10 col-lg-12 col-md-9">

			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-5">

					<div class="row justify-content-center">

						<label id="file-count" class="form-label">File List:</label>
						<div id="file" class="mb-3">
							<ul id="file-list" class="list-group">

							</ul>

						</div>
						<div class="row">
							<div class ="col">
								<input class="form-control d-none" type="file" id="input-file" multiple>
								<button type="button" class="my-5 btn btn-dark" onClick="addFiles();">Add</button>
							</div>
							<div class="col">
								<button id="file-upload-btn" type="button" class="my-5 btn btn-dark" onClick="upload();">UpLoad</button>
							</div>
							<progress value="0" max="100" id="jb"></progress> <!--프로그레스바 추가-->
						</div>

					</div>

				</div>
			</div>

		</div>

	</div>

</div>
</div>