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
    
    <!-- igrowl -->
	<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/public/stylesheets/icomoon/vicons.css">
	<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/public/stylesheets/icomoon/feather.css">
	<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/public/stylesheets/icomoon/steadysets.css">
	<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/public/stylesheets/icomoon/linecons.css">
	
	<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/public/stylesheets/animate.css">

	<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/dist/css/igrowl.min.css">
	<script src="/igrowl/catc-iGrowl-3232c92/dist/js/igrowl.min.js"></script>
</head>
<body>
    
    <div id="container">
	
        <div id="noticeWrtBox">
            <form action="<c:url value='/notice/modify'/>" method="get">
            <input type="hidden" name="seq_no" id="seq_no" value="${boardDto.seq_no }"/>
                <div class="wrtTable">
                    <table border="1">
                        <tr>
                            <th>등록일</th>
                            <td>${boardDto.erl_dy }</td>
                            <th>작성자</th>
                            <td>${boardDto.name }</td>
                        </tr>
                        <tr>
                            <th>제목</th>
                            <td colspan="3"><input type="text" class="formControl" name="title" id="title" value="${boardDto.title }" readonly></td>
                        </tr>
                        <tr>
                            <th>내용</th>
                            <td colspan="3">
                                 <div  id="cont" name="cont" style="text-align: left;">${boardDto.cont}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>첨부파일</th>
                            <td colspan="3">
                               	<input type="text" class="formControl2" id="atc_file_txt" value="${boardDto.atc_file }" readonly/>
                               	<input type="hidden" id="atc_file_ps" value="${boardDto.atc_file_ps }" />
                                <a id="fileDownload">
                                	<label class="btnControl3">
										<i class="fa-solid fa-download" style="color: #ffffff;"></i>
									</label>
                                </a>
                                <input type="file" class="formControl3" name="atc_file" id="atc_file"/>
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
                </div><!-- wrtTable -->

                <div class="btnBox">
					<button type="submit" class="btnControl">수정</button>
					<button type="button" class="btnControl" id="returnList">목록으로</button>
                </div>
            </form>
        </div><!-- noticeWrtBox -->

    </div><!-- container -->
    
	<script>
		//파일다운로드
		$('#fileDownload').on('click', function(){
			var atc_file =$('#atc_file_txt').val();
			var atc_file_ps =$('#atc_file_ps').val();
			
			if(atc_file != ""){
				$('#fileDownload').attr('href', '/notice/fileDownload?atc_file=' + atc_file + '&atc_file_ps=' + atc_file_ps)				
			}else{
				$.iGrowl({
					title: '다운로드 파일이 없습니다.',
					type: 'notice',
					icon: 'linecons-megaphone',
					delay: 3000,
					placement:{
						x:'center',
						y:'top'
					},
					offset: {
						y:30
					},
					animation: true,
					animShow: 'fadeInDown',
					animHide: 'fadeOutUp',
				});//iGrowl
			}
		})	
	
		//리스트돌아가기
		$('.btnBox').on('click', '#returnList', function(){
			location.href='/notice/list'
		})
		
		//alert창 띄우기
		let msg = "${msg}";
  		if(msg == "MOD_OK"){
    		$.iGrowl({
				title: '글을 수정했습니다.',
				type: 'success',
				icon: 'linecons-like',
				delay: 3000,
				placement:{
					x:'center',
					y:'top'
				},
				offset: {
					y:30
				},
				animation: true,
				animShow: 'fadeInDown',
				animHide: 'fadeOutUp',
			});//iGrowl
	    } else if(msg == "MOD_ERR"){
	    	$.iGrowl({
				title: '글수정을 실패했습니다.',
				type: 'error',
				icon: 'linecons-fire',
				delay: 3000,
				placement:{
					x:'center',
					y:'top'
				},
				offset: {
					y:30
				},
				animation: true,
				animShow: 'fadeInDown',
				animHide: 'fadeOutUp',
			});//iGrowl
	    }
	</script>
</body>
</html>