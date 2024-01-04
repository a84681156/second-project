<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 폰트링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- 로컬css -->
    <link rel="stylesheet" href="<c:url value='/css/noticeWrt.css'/>">
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
	
        <div id="noticeWrtBox">

            <form action="<c:url value='/notice/writee'/>" method="POST" id="frm"  enctype="multipart/form-data">
            
                <div class="wrtTable">
                    <table border="1">
                        <tr>
                            <th>등록일</th>
                            <td><input type="text" class="formControl0" name="erl_dy" id="erl_dy"></td>
                            <th>작성자</th>
                            <td><input type="text" class="formControl0" name="name" id="name" value="${userInfo.name }"></td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td colspan="3"><input type="text" class="formControl" name="title" id="title"></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
   								<div id="editor"></div><input type="hidden" name="cont" id="cont">
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3">
                            	<input type="text" class="formControl2" id="atc_file_txt" readonly/>
                            	<label class="btnControl2" for="atc_file">
									<i class="fa-solid fa-upload" style="color: #ffffff;"></i>
								</label> 
                            	<input type="file" class="formControl3" name="file" id="atc_file">	
                            </td>
                        </tr>
                    </table>
                </div><!-- wrtTable -->

                <div class="btnBox">
					<button type="button" id="WrtBtn" class="btnControl">작성</button>
					<button type="button" class="btnControl" id="returnList">목록으로</button>
                </div>
            </form>
        </div><!-- noticeWrtBox -->

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
	    
	    //작성날짜자동입력
	    document.getElementById('erl_dy').value= new Date().toISOString().slice(2, 10);
	    
	    //리스트돌아가기
		$('.btnBox').on('click', '#returnList', function(){
			location.href='/notice/list'
		})
		
		//작성Btn
		$('.btnBox #WrtBtn').on('click', function(){
			$('#cont').val(editor.getHTML());
			
			//태그요소 막기
			var str = $('#title').val();
			var replaced_str = str.replaceAll('<', '&lt;').replaceAll('>', '&gt;');
			$('#title').attr('value',replaced_str);
			$('#frm').submit();
		})
		
		//첨부파일 커스텀 버튼연결
		$("#atc_file").on('change',function(){
		  var fileName = $("#atc_file").val();
		  $("#atc_file_txt").val(fileName);
		});

	</script>
</body>
</html>