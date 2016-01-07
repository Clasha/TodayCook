function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('Register with');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}
function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');    
        });
        
        $('.modal-title').html('Login with');
    });       
     $('.error').removeClass('alert alert-danger').html(''); 
}

function openLoginModal(){
    showLoginForm();
    setTimeout(function(){
       // $('.modal fade login').modal('show');    
       $('div#loginModal').modal('show');    
       //jQuery('#loginModal').modal('show');    
    }, 230);
}

function loginAjax(){
	if(!document.loginform.useremail.value){ //만약 유저 이메일칸이 비어있다면,
		shakeModal(); //아래의 shakeModal을 실행한다.
		return false; //submit을 취소한다.
	}
	if(!document.loginform.psw.value){ //만약 유저 비밀번호칸이 비어있다면,
		shakeModal(); //아래의 shakeModal을 실행한다.
		return false; //submit을 취소한다.
	}
	return true; //위의 둘 경우가 아니라면 submit을 실행한다.
}

function shakeModal(){
    $('#loginModal .modal-dialog').addClass('shake'); 
    //id loginModal 및의 클래스 modal-dialog에 shake 클래스를 만든다.
             $('.error').addClass('alert alert-danger').html("이메일 또는 비밀번호를 확인해주세요!");
             //error 클래스에 alert alert-danger 클래스를 더한 후, html을 붙인다.
             $('input[type="password"]').val('');
             //패스워드 칸의 값을 빈값으로 만든다.
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
             //1초 후, shake의 값을 삭제한다.
}


   