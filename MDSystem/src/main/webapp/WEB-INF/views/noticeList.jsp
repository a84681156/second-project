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
    <link rel="stylesheet" href="<c:url value='/css/noticeList.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header_footer.css'/>">

    <!-- fontAsome -->
    <script src="https://kit.fontawesome.com/159aca3e6d.js" crossorigin="anonymous"></script>

    <!-- 제이쿼리js -->
    <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
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

        <div id="noticeBox">
            <div class="scBar">
	            <form action="<c:url value='/notice/list'/>" method="get">
	                <ul>
	                    <li class="scList1">
	                        <span>
		                		<select name="option" id="scCondition">
		                            <option value="t" ${sc.option=='t' ? "selected" : ""}>제목 검색</option>
		                            <option value="c" ${sc.option=='c' ? "selected" : ""}>내용 검색</option>
		                            <option value="w" ${sc.option=='w' ? "selected" : ""}>작성자 검색</option>
		                        </select>
	                        </span>
	                    </li>
	                    <li class="scList2">
	                        <input type="text" class="formControl" id="scTitle" name="keyword" value="${sc.keyword}" placeholder="검색어를 입력하세요">
	                    </li>
	                    <li class="scList3">
	                        <button type="submit" class="btnControl" id="scBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
	                    </li>
                </form>
	                    <li class="scList4">
	               			<a href="<c:url value='/notice/write'/>">
	                			<button type="button" class="btnControl">작성하기</button>
	                		</a>
	                			<button type="button" id="delBtn" name="delBtn" class="btnControl">삭제하기</button>
	                    </li>
	                </ul>  
            </div><!-- scBar -->

            <div class="noticeListBox">
                <div class="noticeListTable">
                    <table border="1" id="nTable">
                        <colgroup>
                            <col style= "width:5%;">
                            <col style= "width:15%;">
                            <col style= "width:10%;">
                            <col style= "width:60%;">
                            <col style= "width:10%;">
                        </colgroup>
                        <thead>
	                         <tr>
	                             <th colspan="2">등록일</th>
	                             <th>작성자</th>
	                             <th>제목</th>
	                             <th>첨부파일</th>
	                         </tr>
                     	</thead>
	                    <tbody>
	                        <c:forEach var="boardDto" items="${list }">
		                        <form id="frm">
			                  	    <tr>
				                        <td class="nList1" onclick="event.stopPropagation()"><input type="checkbox" id="chkBox" name="chkBox"><input type="hidden" id="seq_no" name="seq_no" value="${boardDto.seq_no }" /></td>
				                        <td class="nList2">${boardDto.erl_dy }</td>
				                        <td class="nList3">${boardDto.name }</td>
				                        <td class="nList4" style="text-align: left;">${boardDto.title }</td>
				                        <td class="nList5">${boardDto.atc_file }</td>
			                	    </tr>
		                        </form>
		                    </c:forEach>
	                    </tbody>
                    </table>
                </div><!-- noticeListTable -->
            </div><!-- noticeListBox -->
        </div><!-- noticeBox -->

    </div><!-- container -->
   	
   	<script>
   		//공지사항 읽기
    	$('#nTable tbody tr').on('click', function(){
	    	var seq = $(this).find('#seq_no').val();
	 		location.href='/notice/read?seq_no='+seq;
    	})
   	
   		//체크박스 1개만 선택
   		$(document).ready(function(){
   			$('input[type="checkbox"][name="chkBox"]').click(function(){
   				if($(this).prop('checked')){
   					$('input[type="checkbox"][name="chkBox"]').prop('checked',false);
   					$(this).prop('checked', true);
   				}
   			});
   		});
   		
    	//공지사항 삭제
   		$('#delBtn').on('click', function(){
   			
   			if($('input[type="checkbox"][name="chkBox"]').is(':checked') == false){
					$.iGrowl({
						title: '삭제할 글을 선택해주세요.',
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
					return false;
			}else{
				var chk = $('#nTable tbody tr').find('input[name=chkBox]:checked');
				var seq_no = chk.next('input[name=seq_no]').val();
		    	
					var data = ({
						seq_no: seq_no
					})
					
		    		$.ajax({
		    			type:'POST',
		    			url: '/notice/del',
		    			data: JSON.stringify(data),
		    			//dataType: 'json',
		    			contentType: 'application/json; charset=utf-8',
		    			success: function(result){
		    				$.iGrowl({
								title: '글을 삭제했습니다.',
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
		    			},
		    			error: function(){
		    				$.iGrowl({
								title: '글삭제를 실패했습니다.',
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
		    		})//ajax
		    		.always(function(){
		    			window.location.reload()
		    		})
				
			}
   			
   			
   		})
   		
   		
   		let msg = "${msg}";

	    if(msg == "WRT_OK"){
	    	$.iGrowl({
				title: '글 작성을 성공했습니다.',
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
	    } else if(msg == "WRT_ERR"){
	    	$.iGrowl({
				title: '글작성을 실패했습니다.',
				type: 'notice',
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
	    }else if(msg == "READ_ERR"){
	    	$.iGrowl({
				title: '글읽기를 실패했습니다.',
				type: 'notice',
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
	    } else if(msg == "LOGIN_OK"){
	    	$.iGrowl({
				title: '로그인 하셨습니다.',
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
	    }
   	</script>
</body>
</html>