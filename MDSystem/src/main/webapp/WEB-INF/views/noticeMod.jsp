<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <title>Document</title>
    <!-- 폰트링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- 로컬css -->
    <link rel="stylesheet" href="<c:url value='/css/noticeMod.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header_footer.css'/>">

    <!-- fontAsome -->
    <script src="https://kit.fontawesome.com/159aca3e6d.js" crossorigin="anonymous"></script>

    <!-- 제이쿼리js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    
    <!-- tostui css -->
    <link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
    <!-- tostui script -->
    <script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
</head>
<body>
    
    <div id="container">
	
        <div id="noticeModBox">
            <form action="<c:url value='/notice/modifyy'/>" method="GET" id="frm" enctype="multipart/form-data">

                <div class="modTable">
                    <table border="1">
                        <tr>
                            <th>등록일</th>
                            <td><input type="text" class="formControl0" name="erl_dy" id="erl_dy" value="${boardDto.erl_dy }" readonly></td>
                            <th>작성자</th>
                            <td><input type="text" class="formControl0" name="name" id="name" value="${boardDto.name }" readonly></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td colspan="3"><input type="text" class="formControl" name="title" id="title" value="${boardDto.title }"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                                <div id="editor"></div> <input type="hidden" name="cont" id="cont" value='${boardDto.cont }' />
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3">
                                <input type="text" class="formControl2" id="atc_file_txt" value="${boardDto.atc_file}" readonly/>
                            	<label class="btnControl2" for="atc_file">
									<i class="fa-solid fa-upload" style="color: #ffffff;"></i>
								</label> 
                                <input type="file" class="formControl3" name="atc_file" id="atc_file">

                            </td>
                        </tr>
                        <input type="hidden" id="bsnm_no" name="bsnm_no" value="${boardDto.bsnm_no }" />
                       	<input type="hidden" id="seq_no" name="seq_no" value="${boardDto.seq_no }" />
                       	<input type="hidden" id="wrt_sabun" name="wrt_sabun" value="${boardDto.wrt_sabun }" />
                       	<input type="hidden" id="frt_input_dy" name="frt_input_dy" value="${boardDto.frt_input_dy }" />
                       	<input type="hidden" id="frt_input_empl_no" name="frt_input_empl_no" value="${boardDto.frt_input_empl_no }" />
                       	<input type="hidden" id="lst_input_dy" name="lst_input_dy" value="${boardDto.lst_input_dy }" />
                       	<input type="hidden" id="lst_input_empl_no" name="lst_input_empl_no" value="${boardDto.lst_input_empl_no }" />
                       	<input type="hidden" id="atc_file_ps" name="atc_file_ps" value="${boardDto.atc_file_ps }" />
                    </table>
                </div><!-- modTable -->

                <div class="fileLocalBox">
                    <ul>
                        <li class="fList3"><button type="button" id="ModBtn" class="btnControl">수정하기</button></li>
                    </ul>
                </div>
            </form>
        </div><!-- noticeModBox -->

    </div><!-- container -->
    
    <script>
	  	//toast
	    const Editor = toastui.Editor;
	    const editor = new Editor({
	            el: document.querySelector('#editor'),
	            height: '300px',
	            initialEditType: 'WYSIWYG',
	            previewStyle: 'tab'
	        });
		var cont = $('#cont').val();
   		editor.setHTML(cont);
    	
    	//수정Btn
	    $('.fList3 #ModBtn').on('click', function(e){
	    	e.preventDefault();//전송을 막는기능을한다
	    	$('#cont').val(editor.getHTML())
			var str = $('#title').val();
			var replaced_str = str.replaceAll('<', '&lt;').replaceAll('>', '&gt;');
			$('#title').attr('value',replaced_str);
			
			$('#frm').submit();
		});
    	
	  	//첨부파일 커스텀 버튼연결
		$("#atc_file").on('change',function(){
		  var fileName = $("#atc_file").val();
		  $("#atc_file_txt").val(fileName);
		});
    </script>
</body>
</html>