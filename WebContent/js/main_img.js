$.fn.setPreview = function(opt){
    "use strict"
    var defaultOpt = {
        inputFile: $(this),//현재 input 태그
        img: null,//#img_preview
        w: 200,
        h: 200
    };
    $.extend(defaultOpt, opt);

    var previewImage = function(){
        if (!defaultOpt.inputFile || !defaultOpt.img) return;

        var inputFile = defaultOpt.inputFile.get(0);//inputFile변수를 선언해 defaultOpt에 선언한 inputFile을 가져온다
        var img       = defaultOpt.img.get(0);//img변수를 선언해 defaultOpt에 선언한 img를 가져온다

        // FileReader
        if (window.FileReader) {
            // image 파일만
            if (!inputFile.files[0].type.match(/image\//)) return;

            // preview
            try {
                var reader = new FileReader();
                reader.onload = function(e){
                    img.src = e.target.result;//src속성 이미지경로 지정
                    img.style.width  = defaultOpt.w+'px';//스타일-넓이 px로 설정 
                    img.style.height = defaultOpt.h+'px';//스타일-높이 px로 설정
                    img.style.display = '';//display 기본설정
                }
                reader.readAsDataURL(inputFile.files[0]);//files의 0번째 값이 DataURL을 읽어온다
            } catch (e) {
                // exception...
            }
        // img.filters (MSIE)
        } else if (img.filters) {
            inputFile.select();//이미지를 선택
            inputFile.blur();//inputFile에서 포커스가 벗어나면
            var imgSrc = document.selection.createRange().text;//inputFile에 경로를 텍스트로 가져온다.

            img.style.width  = defaultOpt.w+'px';
            img.style.height = defaultOpt.h+'px';
            img.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""+imgSrc+"\")";            
            img.style.display = '';
        // no support
        } else {
            // Safari5, ...
        }
    };

    // onchange
    $(this).change(function(){//this란 #image를 의미한다
        previewImage();//#img_preview에 출력해준다
    });
};


$(document).ready(function(){
    var opt = {
        img: $('#img_preview'),//이미지를 보여줄 태그
        w: 200,//이미지 파일의 넓이를 설정
        h: 200//이미지 파일의 높이를 설정
    };
    $('#image').setPreview(opt);//이미지를 선택하는 태그
});