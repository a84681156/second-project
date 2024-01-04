<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
    <link rel="stylesheet" href="<c:url value='/css/userRegiState.css'/>" >
    <link rel="stylesheet" href="<c:url value='/css/header_footer.css'/>">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- fontAsome -->
    <script src="https://kit.fontawesome.com/159aca3e6d.js" crossorigin="anonymous"></script>

    <!-- 제이쿼리js -->
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://code.jquery.com/ui/1.11.1/jquery-ui.min.js"></script>
	
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

        <div id="userRegiStateBox">
            <form action="<c:url value='/regiState/list'/>" method="get" id="frm">
                <div class="scBar">
                    <ul>
                        <li class="scList1">
                            <span>부서명</span>
                        </li>
                        <li class="scList2">
                           <input type="text" class="formControl" id="dept_nm" name="dept_nm" value="${sc.dept_nm}" placeholder="부서명을 입력">
                        </li>
                        <li class="scList3">
                             <label><input type="radio" id="cd_hffc" name="cd_hffc" value="a" ${sc.cd_hffc=='a' ? "selected" : ""}>전체</label>
                             <label><input type="radio" id="cd_hffc" name="cd_hffc" value="w" ${sc.cd_hffc=='w' ? "selected" : ""}>재직</label>
                             <label><input type="radio" id="cd_hffc" name="cd_hffc" value="h" ${sc.cd_hffc=='h' ? "selected" : ""}>휴직</label>
                             <label><input type="radio" id="cd_hffc" name="cd_hffc" value="r" ${sc.cd_hffc=='r' ? "selected" : ""}>퇴직</label>
                        </li>
                        <li class="scList4">
                            <span>이름</span>
                        </li>
                        <li class="scList5">
                            <input type="text" class="formControl" id="name" name="name" value="${sc.name}" placeholder="이름 검색">
                            <label>
                                <button type="button" class="btnControl" id="scNameBtn" name="scNameBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </label>
                        </li>
                        <li class="scList6">
                            <button type="button" class="btnControl" id="scBtn" name="scBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </li>
                    </ul>
                </div><!-- scBar -->
            </form>
            <div class="userRegiListBox">
                <div class="userRegiListTable">
                    <table border="1" id="uTable">
                        <thead>
                            <tr>
                                <th>재직상태</th>
                                <th>이름</th>
                                <th>직급/직위</th>
                                <th>부서명</th>
                                <th>안전보건의무</th>
                                <th>사용자권한</th>
                                <th>전화번호</th>
                                <th>내선번호</th>
                            </tr>
                        </thead>
                       	<tbody>

                        	<c:forEach var="userDto" items="${list }">

                        				<tr style="cursor: pointer;">
				                            <td>${userDto.cd_hffc } <input type="hidden" id="sabun" name="sabun" value="${userDto.sabun }" /></td>
				                            <td>${userDto.name }</td>
				                            <td>${userDto.level }</td>
				                            <td>${userDto.dept_code }</td>
				                            <td>${userDto.cd_edum_gn }</td>
				                            <td>${userDto.cd_user_gt }</td>
				                            <td>${userDto.tel_no }</td>
				                            <td>${userDto.in_num }</td>
			                        	</tr>
                        	</c:forEach>
                        </tbody>
                    </table>
                </div><!-- userRegiListTable -->
            </div><!-- userRegiListBox -->
            
        </div><!-- userRegiStateBox -->
        
		<div id="scNameBox">
			<input type="text" class="formControl" id="scName" name="keyword" placeholder="검색할 이름을 입력하세요." />
			<div id="nameListTable">
				<table id="nameList"></table>
			</div><!-- nameListTable -->
		</div><!-- scNameBox-->	

    </div><!-- container -->

	<script>
		//사용자관리-상세보기
		$('#uTable tbody tr').on('click', function(){
    		var sabun = $(this).find('#sabun').val();
    		var msg = null;
    		location.href='/managment/userManagment?sabun='+ sabun + '&msg=' + msg;
		});
		
		//사용자 이름검색 모딜창 띄우기
		$('#scNameBtn').on('click', function(){
			$('#scNameBox').dialog('open');
		})
		
		$('#scNameBox').dialog({
			autoOpen:false,
			modal:true,
			title: "이름검색",
			width:420,
			height:335,
			show : 'slide',
			hide : 'slide',
			"position" : {
	            my	: "center",
	            at	: "center"
	     	}
		})
		
		//사용자 이름검색 
		$('#scName').on('keyup', function(){
			var keyword = $(this).val();
			
			$.ajax({
				type: 'GET',
				url: '/regiState/scName?name=' + keyword,
				headers : { "content-type": "application/json"},
				success: function(result){
					$('#nameList').empty()
					$("#nameList").html(toHtml(result))						
				},
				error: function(){
					$.iGrowl({
						title: '사용자이름검색을 실패했습니다.',
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
			})
		})
		
		var toHtml = function(result){
	    	let tmp = '<tbody>'
	    		for(i=0; i<result.length; i++){
		    		tmp += '<tr id="a" style="cursor: pointer;">'
	   				tmp += '<td>' + result[i].sabun + '</td>'
	 				tmp += '<td id="namee">' + result[i].name + '</td>'
	    			tmp += '</tr>'
	    		}
	    	return tmp += '</tbody>'
		}
		
		$('#nameList').on('click', '#a', function(){
    		var name = $(this).find('#namee').text();
            /* $('#scNameBox').css('display', 'none'); */
            $('#scNameBox').dialog('close');
    		$('#name').val(name);
		});
		
		//검색조건 검사
		$('.scBar .scList6 #scBtn').on('click', function(){
			var dept = $('.scBar .scList2 input[name=dept_nm]').val()
			var cd_hffc = $('.scBar #cd_hffc').val()
			var name = $('.scBar #name').val()
			console.log(dept)
			console.log(cd_hffc)
			console.log(name)
			
			if(dept == ""|| cd_hffc == "" || name == ""){
				$.iGrowl({
					title: '검색조건을 선택해주세요.',
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
			}
			
			$('#frm').submit();
		})
		
	    let msg = "${msg}";
	    
	    if(msg == "DEL_OK"){
	    	$.iGrowl({
				title: '사용자를 삭제하였습니다.',
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