
$.fn.setPreview = function(opt){
    "use strict"
    var defaultOpt = {
        inputFile: $(this),//현재 input 태그
        img: null,
        w: 160,
        h: 160
    };
    $.extend(defaultOpt, opt);
 
    var previewImage = function(){

        if (!defaultOpt.inputFile || !defaultOpt.img) return;
        
        var inputFile = defaultOpt.inputFile.get(0);
        var img       = defaultOpt.img.get(0);
 
        // FileReader
        if (window.FileReader) {
            // image 파일만
            if (!inputFile.files[0].type.match(/image\//)) return;//.files+j에서 선택한 파일이 이미지 타입이 아닐경우 스크립트의 실행을 멈춘다
 
            // preview
            try {
                var reader = new FileReader();
                reader.onload = function(e){
                    img.src = e.target.result;
                    img.style.width  = defaultOpt.w+'px';//스타일-넓이 px로 설정
                    img.style.height = defaultOpt.h+'px';//스타일-높이 px로 설정
                    img.style.display = '';
                }
                reader.readAsDataURL(inputFile.files[0]);//files의 0번째 값이 DataURL을 읽어온다
            } catch (e) {
                // exception...
            }
            //j++; // j는 preview function의 매개변수임. 즉 file의 인덱스.
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
    $(this).change(function(){ // this: file[j]
        previewImage();//#img_preview에 출력해준다
    });
    
}; //$.fn.setPreview

function preview(j) {
$(document).ready(function(){

    var opt = {
        img: $('.imgs'+j),//이미지를 보여줄 태그
        w: 160,//이미지 파일의 넓이를 설정
        h: 160//이미지 파일의 높이를 설정
    };
 
    $('.files'+j).setPreview(opt);//이미지를 선택하는 태그
    // j는 preview function의 매개변수임. 즉 file의 인덱스.
});
}