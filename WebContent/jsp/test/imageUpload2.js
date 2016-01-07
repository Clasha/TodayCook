		
		function doProfileImageSubmit()
		{
		        if(!$("#newProfileUrl").val())
		    {
		        alert('새 프로필 이미지를 올려주세요.');
		        return ;
		    }

		    $.ajax({
		        type: "POST",
		        url: "/profile/ajax.html",
		        data: "q_mode=changeProfileImage&profile="+$("#newProfileUrl").val(),
		        success: function(result) {
		            if(result=="SUCCESS")
		            {
		                self.location.reload();
		            }
		            else if(result=="NO_PARAM")
		            {
		                alert('파라미터오류. 다시 확인해 주세요.');
		            }
		            else if(result=="FILE_ERROR")
		            {
		                alert('파일 업로드에 오류가 발생했습니다. 다시 확인해 주세요.');
		            }
		            else
		            {
		                alert('변경실패. 잠시후 다시 시도해 주세요.');
		            }
		        }
		    });
		};
		
		function handlePhotoFiles(e){

		    if (e.target.files[0].size > (2*1024*1024)) {
		        alert("사진은 2MB까지만 허용됩니다.");
		        return false;
		    }

		    $('#submit_btn').attr('type','button').attr('onClick','alert("파일을 올리는 중입니다.");');

		    var reader = new FileReader();
		    reader.onload = function(evt) {
		        var img = new Image();
		        img.src = reader.result;
		        img.onload = function () {
		            var fileData = reader.result;
		            alert(fileData);
		            $.ajax({
		                type: "POST",
		                url: "http://localhost:8080/TodayCook_Type1/fileUpload",
		                data: "file="+fileData,
		                //dataType: "json",
		                cache: "false",
		                processData: false,
		                success: function(data) {
		                        $('#profileSubmitBtn').prop('disabled',false);
		                        alert(data);
		                        $("#vProfileImageModalSrc").attr("src",data);
		                        //$("#newProfileUrl").val(data);
		                },
		                error: function (request,status,error) {
		                    //alert('오류가 발생하였습니다.');
		                    alert("code:"+request.status+"\n\r"+"message:"+request.responseText+"\n\r"+"error:"+error);
		                }
		            });
		        }
		    }
		    reader.readAsDataURL(e.target.files[0]);
		};

		$(document).ready(function()
		{
			    $("#file_1").change(function(e) {
		        handlePhotoFiles(e);
		    });

		});