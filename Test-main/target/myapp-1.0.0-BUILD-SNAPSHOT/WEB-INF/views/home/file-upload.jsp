<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<style>
	.image-area{
		display:flex;

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
		$("#file-upload-btn").attr("disabled", true);
		if(upload_list.length > 0){

			(function proc(idx){
				if(idx < upload_list.length){

					$.ajax({
						url : '/file/upload',
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
						}, error : function(e){
							alert(upload_list[idx].name +' : '+'오류');
							$("#file-upload-btn").attr("disabled", false);
						}, complete : function(){

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

<div class="container">

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
							</div>

				        </div>
				        
                    </div>
                </div>

            </div>

        </div>

    </div>