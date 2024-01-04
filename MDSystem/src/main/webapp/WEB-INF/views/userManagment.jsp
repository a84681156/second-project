<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>Document</title>
    <!-- 폰트링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

    <!-- 로컬css -->
    <link rel="stylesheet" href="<c:url value='/css/userManagment.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header_footer.css'/>">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

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

        <div id="managmentBox">
        	<form action="" method="get">
        		<div class="scBar">
                    <ul>
                        <li class="scList1">
                            <span>사업부</span>
                        </li>
                        <li class="scList2">
                            <select name="sa_code" id="sa_codee">
                                <option value="B0001">공공사업부</option>
                                <option value="B0002">로봇자동화</option>
                                <option value="B0003">민간사업부</option>
                            </select>
                        </li>
                        <li class="scList3">
                            <span>부서</span>
                        </li>
                        <li class="scList4">
                            <select name="dept_code" id="dept_codee">
                                <option value="P0001">개발부</option>
                                <option value="P0002">인사부</option>
                                <option value="P0003">영업부</option>
                                <option value="P0004">회계부</option>
                                <option value="P0005">총무부</option>
                                <option value="P0006">기획부</option>
                            </select>
                        </li>
                        <li class="scList5">
                             <label><input type="radio" name="cd_hffc" class="cd_hffcc" id="a" value="a">전체</label>
                             <label><input type="radio" name="cd_hffc" class="cd_hffcc" id="w" value="w">재직</label>
                             <label><input type="radio" name="cd_hffc" class="cd_hffcc" id="h" value="h">휴직</label>
                             <label><input type="radio" name="cd_hffc" class="cd_hffcc" id="r" value="r">퇴직</label>
                        </li>
                        <li class="scList6">
                            <button type="button" class="btnControl" id="scBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </li>
                    </ul>
                </div><!-- scBar -->
        	</form>
                
                
            <form id="frm" accept-charset="UTF-8">
                
                <div class="userInfo">
                    <table border="1">
                    	<input type="hidden" name="bsnm_no" id="bsnm_no" value="${userInfo.bsnm_no}" />
                    	<input type="hidden" name="frt_input_dy" id="frt_input_dy" value="${userInfo.frt_input_dy}" />
                    	<input type="hidden" name="frt_input_empl_no" id="frt_input_empl_no" value="${userInfo.frt_input_empl_no}" />
                    	<input type="hidden" name="lst_input_dy" id="lst_input_dy" value="${userInfo.lst_input_dy}" />
                    	<input type="hidden" name="lst_input_empl_no" id="lst_input_empl_no" value="${userInfo.lst_input_empl_no}" />
                        <tr>
                            <th>사번</th>
                            <td class="empNo">
                            	<input type="text" name="sabun" class="formControl" value="${userInfo.sabun}" readonly />
                            </td>
                            <th>패스워드</th>
                            <td><input type="text" name="passwd" class="formControl" value="${userInfo.passwd}" readonly/></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="name" class="formControl" value="${userInfo.name}" readonly/></td>
                            <th>직급/직위</th>
                            <td><input type="text" name="level" class="formControl" value="${userInfo.level}" readonly/></td>
                        </tr>
                        <tr>
                            <th>사용자권한</th>
                            <td><input type="text" name="cd_user_gt" class="formControl" value="${userInfo.cd_user_gt}" readonly/></td>
                            <th>재직상태</th>
                            <td><input type="text" name="cd_hffc2" class="formControl" value="${userInfo.cd_hffc2}" readonly/></td>
                        </tr>
                        <tr>
                            <th>사업부 코드</th>
                            <td><input type="text" name="sa_code" class="formControl" value="${userInfo.sa_code}" readonly/></td>
                            <th>사업부명</th>
                            <td><input type="text" name="sa_nm" class="formControl" value="${userInfo.sa_nm}" readonly/></td>
                        </tr>
                        <tr>
                            <th>부서 코드</th>
                            <td><input type="text" name="dept_code" class="formControl" value="${userInfo.dept_code}" readonly/></td>
                            <th>부서명</th>
                            <td><input type="text" name="dept_nm" class="formControl" value="${userInfo.dept_nm}" readonly/></td>
                        </tr>
                        <tr>
                            <th>핸드폰번호</th>
                            <td><input type="text" name="hp_no" class="formControl" value="${userInfo.hp_no}" readonly/></td>
                            <th>이메일</th>
                            <td><input type="text" name="email" class="formControl" value="${userInfo.email}" readonly/></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" name="tel_no" class="formControl" value="${userInfo.tel_no}" readonly/></td>
                            <th>내선번호</th>
                            <td><input type="text" name="in_num" class="formControl" value="${userInfo.in_num}" readonly/></td>
                        </tr>
                        <tr>
                            <th>안전보건직무</th>
                            <td><input type="text" name="cd_edum_gn" class="formControl" value="${userInfo.cd_edum_gn}" readonly/></td>
                            <th>특별교육 대상자 여부</th>
                            <td>
                            	<input type="hidden" id="set" value="${userInfo.spc_edu_yn}"/>
                                <label><input type="radio" name="spc_edu_yn" id="Y" value="Y" readonly>대상</label>
                                <label><input type="radio" name="spc_edu_yn" id="N" value="N" readonly>미대상</label>
                            </td>
                        </tr>
                        <tr>
                            <th>입사일</th>
                            <td><input type="text" name="ent_co_dy" class="formControl" value="${userInfo.ent_co_dy}" readonly/></td>
                            <th>직무변경일</th>
                            <td><input type="text" name="job_ch_dy" class="formControl" value="${userInfo.job_ch_dy}" readonly/></td>
                        </tr>
                        <tr>
                            <th>휴직일</th>
                            <td><input type="text" name="layo_st_dy" class="formControl" value="${userInfo.layo_st_dy}" readonly/>~<input type="text" name="layo_en_dy" class="formControl" value="${userInfo.layo_en_dy }" readonly/></td>
                            <th>퇴사일</th>
                            <td><input type="text" name="ret_dy" class="formControl" value="${userInfo.ret_dy}" readonly/></td>
                        </tr>
                        <tr>
                            <th>재직상태</th>
                            <td>
                            	<input type="hidden" id="os" value="${userInfo.cd_hffc}" />
                                <label><input type="radio" name="cd_hffc" id="W" value="W" readonly>재직</label>
                                <label><input type="radio" name="cd_hffc" id="H" value="H" readonly>휴직</label>
                                <label><input type="radio" name="cd_hffc" id="R" value="R" readonly>퇴직</label> 
                            </td>
                            <th>당해 정기교육(2년) 대상</th>
                            <td>
                            	<input type="hidden" id="ret" value="${userInfo.pet_edu_yn}" />
                                <label><input type="radio" name="pet_edu_yn" id="Y1" value="Y" readonly>대상</label>
                                <label><input type="radio" name="pet_edu_yn" id="N1" value="N" readonly>미대상</label>
                            </td>
                        </tr>
                    </table>
                </div><!-- userInfo -->

                <div class="manageBtn">
                    <button type="button" class="btnControl1" id="modPwd">패스워드 변경</button>
                    <button type="button" class="btnControl1" id="resetBtn">패스워드 초기화</button>
                    <button type="button" class="btnControl2" id="addBtn">추가</button>
                    <button type="button" class="btnControl2" id="modBtn">수정</button>
                    <button type="button" class="btnControl2" id="delBtn">삭제</button>
                </div>
            </form>
        </div><!-- managmentBox -->

        <div class="modifyPwd" style="display: none;">
        	<div class="modifyPwdBox">
                <table border="1">
                    <tr>
                        <th>사번</th>
                        <td><input type="text" id="sabun" name="sabun" class="formControl" value="${userInfo.sabun}" readonly/></td>
                    </tr>
                    <tr>
                        <th>이름</th>
                        <td><input type="text" id="name" name="name" class="formControl" value="${userInfo.name}" readonly/></td>
                    </tr>
                    <tr>
                        <th>현재 패스워드</th>
                        <td><input type="password" id="passwd" name="passwd" class="formControl"></td>
                    </tr>
                    <tr>
                        <th>변경 패스워드</th>
                        <td><input type="password"  id="modPasswd" name="modPasswd" class="formControl"></td>
                    </tr>
                    <tr>
                        <th>변경 패스워드 확인</th>
                        <td><input type="password" class="formControl" id="modPasswd2" name="modPasswd2"></td>
                    </tr>
                    <tr>
                        <th>주의사항</th>
                        <td>※패스워드 변경 시 00자리 이상 설정하여야함.</td>
                    </tr>
                </table>
            </div><!-- modifyPwdBox -->
            
        </div><!-- modifyPwd -->
        
			<div id="scBox" style="display: none;">
				<form id="frm2">
					<table id="scList">
					<colgroup>
                        <col style= "width:24%;">
                        <col style= "width:24%;">
                        <col style= "width:24%;">
                        <col style= "width:24%;">
                        <col style= "width:4%;">
                    </colgroup>
						<thead>
							<th>사번</th>
							<th>이름</th>
							<th>부서명</th>
							<th>사업명</th>
						</thead>
						<tbody id="List">
						</tbody>
					</table>
				</form>
			</div><!-- scBox -->	

    </div><!-- container -->

    <script> 
		//검색조건 재직상태 페이지로딩하자마자 전체로 클릭되어 있게하기
		$(document).ready(function(){
			$('input:radio[id="a"]:radio[value="a"]').prop('checked',true);
		})

    	//사용자 이름검색 모딜창 띄우기
		$('#scBtn').on('click', function(){
			$('#scBox').dialog('open');
			
	    	var cd_hffc = $('input[name=cd_hffc]:checked').val();
	    	var sa_code = $('#sa_codee').val();
	    	var dept_code = $('#dept_codee').val();
	        
	        $.ajax({
	        	type: 'POST',
	        	url: '/managment/search',
	        	contentType : "application/json; charset=utf-8",
        		data: JSON.stringify({cd_hffc, sa_code, dept_code}),
        		success : function(result){
					$('#List').empty();
					$("#List").html(toHtml(result));
        			if(result == null || result == ""){
        				console.log("asd")
        				$('#no').empty();
    					$("#no").html("<td colspan='5' style='text-align:center;'>검색조건에 맞는 사용자가 없습니다.</td>");
        			}
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
	        });//ajax
		})//scBtn
		
		//검색모달창 dialog
		$('#scBox').dialog({
			autoOpen:false,
			modal:true,
			title: "검색목록",
			width:420,
			height:335,
			show : 'slide',
			hide : 'slide',
			"position" : {
	            my	: "center",
	            at	: "center"
	     	}
		})//dialog
		
		var toHtml = function(result){
	    	let tmp = ''
	    		tmp += '<tr id="no" style="width:200px;"></tr>'
	    		for(i=0; i<result.length; i++){
		    		tmp += '<tr id="a" style="cursor: pointer;">'
	   				tmp += '<td id="sabunn" style="text-align: center;">' + result[i].sabun + '</td>'
	 				tmp += '<td style="text-align: center;">' + result[i].name + '</td>'
	 				tmp += '<td style="text-align: center;">' + result[i].dept_nm + '</td>'
	 				tmp += '<td style="text-align: center;">' + result[i].sa_nm + '</td>'
	    			tmp += '</tr>'
	    		}
	    	return tmp
    	}
	   
    	//사용자 이름검색 모달창 이름클릭하면 모달창 끄기
    	$('#List').on('click', '#a', function(){
    		var sabun = $(this).find('#sabunn').text();
            $('#scBox').css('display', 'none');
    		
    		location.href='/managment/userManagment?sabun='+sabun+'&msg=';
		});
    
    	
    	
		
	 	//비밀번호 변경 클릭 시 css display:none -> display:block 
	    $('#modPwd').on('click',function(){
	    	$('.modifyPwd').dialog('open');
	    })
	    
	    //변경 클릭시 보내기
	    function modBtn(){
	 		var sabun = $('#sabun').val();
	 		var name = $('#name').val();
	 		var passwd = $('#passwd').val();
	 		var modPasswd = $('#modPasswd').val();
	 		
	 		var data = ({
	 			sabun:sabun,
	 			name:name,
	 			passwd:passwd,
	 			modPasswd:modPasswd,
	 		})
	 		
	 		console.log(data)
	 		
	 		$.ajax({
	 			type:'POST',
	 			url:'/managment/modPwd',
	 			contentType:'application/json;charset=utf-8',
	 			data:JSON.stringify(data),
	 			success:function(){
	 				$.iGrowl({
						title: '비밀번호를 변경했습니다.',
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
	 				
	 			   location.reload();
	 			},
	 			error:function(){
	 				$.iGrowl({
						title: '비밀번호변경을 실패했습니다.',
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
	 	}
	      
	    //비밀번호변경 모달창 dialog
		$('.modifyPwd').dialog({
			autoOpen:false,
			modal:true,
			title: "비밀번호 변경",
			width:400,
			height: 360,
			show : 'slide',
			hide : 'slide',
			"position" : {
	            my	: "center",
	            at	: "center"
	     	},
	     	 buttons: {
	    			"변경": function() {
	    				modBtn();
	    				$(this).dialog('close');
	    			},
	 				"취소": function() {
	 					$(this).dialog('close');
	 				}
	    		}//button
		})//dialog
	
	    $(document).ready(function(){
	    	//특별교육대상
	    	if($('#set').val().trim() == 'Y'){
	    		$("input:radio[id='Y']:radio[value='Y']").prop('checked', true);
	    	} else{
	    		$("input:radio[id='N']:radio[value='N']").prop('checked', true);
	    	}
	    	
	    	//재직상태
	    	if($('#os').val().trim() == 'W'){
	    		$("input:radio[id='W']:radio[value='W']").prop('checked', true);
	    	} else if($('#os').val().trim()  == 'H'){
	    		$("input:radio[id='H']:radio[value='H']").prop('checked', true); 	
	    	} else if($('#os').val().trim()  == 'R'){
	    		$("input:radio[id='R']:radio[value='R']").prop('checked', true);
	    	}
	    	
	    	//정기교육대상
	    	if($('#ret').val().trim() == 'Y'){
	    		$("input:radio[id='Y1']:radio[value='Y']").prop('checked', true); 	
	    	} else{
	    		$("input:radio[id='N1']:radio[value='N']").prop('checked', true);	
	    	}
	    });

	    //패스워드 초기화
	    $(document).ready(function(){
	    	$("#resetBtn").on("click", function(){
	    		let form = $("#frm");
	    		form.attr("action", "/managment/resetPwd");
	    		form.attr("method", "POST");
	    		
	    		form.submit();
	    	})
	    })
    
	    $(document).ready(function(){//제이쿼리를 실행하기 위한 준비
	    	
	    	//사용자관리 추가 화면이동
	    	$("#addBtn").on("click", function(){
	    		location.href="/managment/userAdd"
	    	})
	    	
	   		//사용자관리 수정 화면이동
			$("#modBtn").on("click", function(){
				let form = $("#frm");
				form.attr("action", "/managment/userMod");
				form.attr("method", "GET");
				
				form.submit();
			})
			
			//사용자관리 삭제하기
			$("#delBtn").on("click", function(){
				let sabun = ${userInfo.sabun}
				$('#frm').attr('action', '/managment/del');
				$('#frm').attr('method', 'GET');
				
				$('#frm').submit();
			})
	    })
	    
	    

		
	    let msg = "${msg}";
	    console.log(msg)
	    if(msg != 'null'){
		    if(msg == "CHANGE_OK"){
		    	$.iGrowl({
					title: '비밀번호 변경했습니다.',
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
		    } else if(msg == "CHANGE_ERR"){
		    	$.iGrowl({
					title: '비밀번호 변경에 실패했습니다.',
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
		    } else if(msg == "ADD_OK"){
		    	$.iGrowl({
					title: '사용자를 추가했습니다.',
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
		    } else if(msg == "ADD_ERR"){
		    	$.iGrowl({
					title: '사용자추가를 실패했습니다.',
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
		    } else if(msg == "MOD_OK"){
		    	$.iGrowl({
					title: '사용자정보를 수정했습니다.',
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
					title: '사용자정보수정을 실패했습니다.',
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
		    } else if(msg == "DEL_ERR"){
		    	$.iGrowl({
					title: '사용자삭제를 실패했습니다.',
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
	    }
    </script>

</body>
</html>