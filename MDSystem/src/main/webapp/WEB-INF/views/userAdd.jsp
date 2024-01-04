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
    <link rel="stylesheet" href="<c:url value='/css/userAdd.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header_footer.css'/>">

    <!-- fontAsome -->
    <script src="https://kit.fontawesome.com/159aca3e6d.js" crossorigin="anonymous"></script>

    <!-- 제이쿼리js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    
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
            <form id="frm" >            
                <div class="userInfo">
                    <table border="1">
                    	<input type="hidden" name="bsnm_no" id="bsnm_no" value="1234" />
                        <tr>
                            <th>사번</th>
                            <td class="empNo">
                            	<input type="text" name="sabun" id="sabun" class="formControl" value="${userInfo }" placeholder="ex)0000" />
                            </td>
                            <th>패스워드</th>
                            <td><input type="text" name="passwd" id="passwd" class="formControl" placeholder="패스워드는 8~12자리 입력하세요" /></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="name" id="name" class="formControl" placeholder="ex)ㅁㅁㅁ" /></td>
                            <th>직급/직위</th>
                            <td><input type="text" name="level" id="level" class="formControl" placeholder="ex)사원/주임/대리 등" /></td>
                        </tr>
                        <tr>
                            <th>사용자권한</th>
                            <td>
                            	<select name="cd_user_gt" id="cd_user_gt" class="selectControl"></select>
                           	</td>
                            <th>당해 정기교육(2년) 대상</th>
                            <td>
                                <label><input type="radio" name="pet_edu_yn" id="Y1" value="Y" >대상</label>
                                <label><input type="radio" name="pet_edu_yn" id="N1" value="N" >미대상</label>
                            </td>
                        </tr>
                        <tr>
                            <th>사업부 코드</th>
                            <td>
                            	<select name="sa_code" id="sa_code" class="selectControl"></select>
                            </td>
                            <th>사업부명</th>
                            <td>
                            	<input type="text" name="sa_nm" id="sa_nm" class="formControl" readonly/>
                           	</td>
                        </tr>
                        <tr>
                            <th>부서 코드</th>
                            <td>
                            	<select name="dept_code" id="dept_code" class="selectControl"></select>
                           	</td>
                            <th>부서명</th>
                            <td>
                            	<input type="text" name="dept_nm" id="dept_nm" class="formControl" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th>핸드폰번호</th>
                            <td><input type="text" name="hp_no" id="hp_no" class="formControl" placeholder=" ex)01012345678"/></td>
                            <th>이메일</th>
                            <td><input type="text" name="email" id="email" class="formControl" placeholder="ex)00@0000.com"/></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" name="tel_no" id="tel_no" class="formControl" placeholder="ex)01012345678"/></td>
                            <th>내선번호</th>
                            <td><input type="text" name="in_num" id="in_num" class="formControl" placeholder=" ex)0000"/></td>
                        </tr>
                        <tr>
                            <th>안전보건직무</th>
                            <td>
                            	<select name="cd_edum_gn" id="cd_edum_gn" class="selectControl"></select>
                            </td>
                            <th>특별교육 대상자 여부</th>
                            <td>
                                <label><input type="radio" name="spc_edu_yn" id="Y" value="Y" >대상</label>
                                <label><input type="radio" name="spc_edu_yn" id="N" value="N" >미대상</label>
                            </td>
                        </tr>
                        <tr>
                            <th>입사일</th>
                            <td><input type="text" name="ent_co_dy" id="ent_co_dy" class="formControl" placeholder="ex)0000-00-00"/></td>
                            <th>직무변경일</th>
                            <td><input type="text" name="job_ch_dy" id="job_ch_dy" class="formControl" placeholder="ex)0000-00-00"/></td>
                        </tr>
                        <tr>
                            <th>휴직일</th>
                            <td><input type="text" name="layo_st_dy" id="layo_st_dy" class="formControl2" placeholder="ex)0000-00-00"/>~<input type="text" name="layo_en_dy" id="layo_en_dy" class="formControl2" placeholder="ex)0000-00-00"/></td>
                            <th>퇴사일</th>
                            <td><input type="text" name="ret_dy" id="ret_dy" class="formControl" placeholder="ex)0000-00-00"/></td>
                        </tr>
                        <tr>
                            <th>재직상태</th>
                            <td>
                                <label><input type="radio" name="cd_hffc" id="W" value="W" >재직</label>
                                <label><input type="radio" name="cd_hffc" id="H" value="H" >휴직</label>
                                <label><input type="radio" name="cd_hffc" id="R" value="R" >퇴직</label> 
                            </td>
                            <th></th>
                            <td></td>
                            
                        </tr>
                    </table>
                </div><!-- userInfo -->

                <div class="manageBtn">
                    <button type="button" class="btnControl2" id="addSendBtn">추가하기</button>
                </div>
            </form>
        </div><!-- managmentBox -->


    </div><!-- container -->
    
    <script>
    $(document).ready(function(){
		commonCodeSelectAdd('cd_user_gt', getCommonCode('G0000'));
		commonCodeSelectAdd('sa_code', getCommonCode('B0000'));
		commonCodeSelectAdd('dept_code', getCommonCode('P0000'));
		commonCodeSelectAdd('cd_edum_gn', getCommonCode('S0000'));
    });
    
    //코드가져오는 함수
    function getCommonCode(grp_code){
    	var returnValue;
    	$.ajax({
    		type:'POST'
    		, url:'/codeManage/CommonCodeSC'
    		, contentType:'application/json;charset=utf-8'
    		, async: false//이거 뭐냐 찾아보기
    		, data: JSON.stringify({grp_code:grp_code})
    		, success:function(result){
    			returnValue = result;
    		}
    		, error:function(){
    			console.error('공통코드를 불러오지 못했습니다.');
    			return false;
    		}
    	});//ajax
    	return returnValue;
    };
    
    //select추가하는함수
    function commonCodeSelectAdd(element, list){
    	$("#" + element).empty();
    	
    	for(var i = 0; i<list.length; i++){
    		var option = "<option value=" + list[i].code + ">" + list[i].code_nm + "(" + list[i].code +")" + "</option>";
    		if(i == 0){
    			$("#" + element).append("<option value=''>--선택--</option>");
    		}
	    	$('#' + element).append(option);
    	}
    };
    
  	//select 변경시 연결되는 input
	$("#sa_code").on('change',function(){
		var code = $("#sa_code").val(); 
		var list = getCommonCode('B0000');
		for(var i = 0; i<list.length; i++){
			if(code == list[i].code){
				$('#sa_nm').val(list[i].code_nm);
			}
    	}
	});
  	
	//select 변경시 연결되는 input
  	$('#dept_code').on('change', function(){
  		var code = $('#dept_code').val();
  		var list = getCommonCode('P0000');
  		for(var i = 0; i<list.length; i++){
  			if(code == list[i].code){
  				$('#dept_nm').val(list[i].code_nm);
  			}
  		}
  	});
    
    //추가하기버튼
    $('#addSendBtn').on('click', function(){
    	if(Check() == false){
			return;
		}
    	
    	$('#frm').attr('action', '/managment/add');
    	$('#frm').attr('method', 'POST');
    	$('#frm').submit();
    })
    
    function Check(){
    	var sabun = $('#sabun')
		var passwd = $('#passwd')
		var name = $('#name')
		var level = $('#level')
		var cd_user_gt = $('#cd_user_gt')
		var sa_code = $('#sa_code')
		var sa_nm = $('#sa_nm')
		var dept_code = $('#dept_code')
		var dept_nm = $('#dept_nm')
		var hp_no = $('#hp_no')
		var email = $('#email')
		var tel_no = $('#tel_no')
		var in_num = $('#in_num')
		var cd_edum_gn = $('#cd_edum_gn')
		var spc_edu_yn = $('input[name=spc_edu_yn]:checked')
		var ent_co_dy = $('#ent_co_dy')
		var job_ch_dy = $('#job_ch_dy')
		var layo_st_dy = $('#layo_st_dy')
		var layo_en_dy = $('#layo_en_dy')
		var ret_dy = $('#ret_dy')
		var cd_hffc = $('#cd_hffc')
		var pet_edu_yn = $('#pet_edu_yn')

		var regAddSabun = /^[0-9]{4}$/;
		var regAddPasswd = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[~?!@#$%^&*_-]).{8,}$/;
		var regAddName = /^[가-힣]{2,4}$/;
		var regAddHp_no = /^01[016789]{1}([0-9]{4})([0-9]{4})$/;
		var regAddEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{1,3}$/;
		var regAddTel_no = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]))(\d{3,4})(\d{4})$/;
		var regAddIn_num = /^[0-9]{4}$/;
		var regAddEnt_co_dy = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		var regAddJob_ch_dy = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		var regAddLayo_st_dy = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		var regAddLayo_en_dy = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		var regAddRet_dy = /^(19|20)\d{2}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[0-1])$/;
		
		//사번 공백검사
		if(sabun.val() == ""){
	        $.iGrowl({
				title: '사번를 입력해주세요',
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
	        sabun.focus();
	        return false;
	    }
		
		//사번 유효성검사
		if(sabun.val() != "" && regAddSabun.test(sabun.val()) == false){
			$.iGrowl({
				title: '사번은 숫자 4자리로 입력해주세요.',
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
			sabun.val() = "";
	        sabun.focus();
	        return false;
		}

		//패스워드 공백검사
		if(passwd.val() == ""){
	        $.iGrowl({
				title: '패스워드를 입력해주세요.',
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
	        passwd.focus();
	        return false;
	    }
		
		//패스워드 유효성검사
		if(passwd.val() != "" && regAddPasswd.test(passwd.val()) == false){
			$.iGrowl({
				title: '패스워드는 영문대소문자,숫자,특수문자를 포함하여 8~12자리로 입력해주세요.',
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
			passwd.val() = "";
			passwd.focus();
	        return false;
		}
		
		//이름 공백검사
		if(name.val() == ""){
	        $.iGrowl({
				title: '이름을 입력해주세요.',
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
	        name.focus();
	        return false;
	    }
		
		//이름 유효성검사
		if(name.val() != "" && regAddName.test(name.val()) == false){
			$.iGrowl({
				title: '이름은 한글2~4자리로 입력해주세요',
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
			name.val() = "";
			name.focus();
	        return false;
		}
		
		//직급 공백검사
		if(level.val() == ""){
	        $.iGrowl({
				title: '직급을 입력해주세요',
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
	        level.focus();
	        return false;
	    }
		
		//권한 공백검사
		if(cd_user_gt.val() == ""){
	        $.iGrowl({
				title: '권한을 입력해주세요',
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
	        cd_user_gt.focus();
	        return false;
	    }
		
		//사업코드 공백검사
		if(sa_code.val() == ""){
	        $.iGrowl({
				title: '사업코드를 입력해주세요.',
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
	        sa_code.focus();
	        return false;
	    }
		
		//사업명 공백검사
		if(sa_nm.val() == ""){
	        $.iGrowl({
				title: '사업명을 입력해주세요.',
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
	        sa_nm.focus();
	        return false;
	    }
		
		//부서코드 공백검사
		if(dept_code.val() == ""){
	        $.iGrowl({
				title: '부서코드를 입력해주세요.',
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
	        dept_code.focus();
	        return false;
	    }
		
		//부서명 공백검사
		if(dept_nm.val() == ""){
	        $.iGrowl({
				title: '부서명을 입력해주세요.',
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
	        dept_nm.focus();
	        return false;
	    }
		
		//휴대폰번호 공백검사
		if(hp_no.val() == ""){
	        $.iGrowl({
				title: '휴대폰번호를 입력해주세요.',
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
	        hp_no.focus();
	        return false;
	    }
		
		//휴대폰 유효성검사
		if(hp_no.val() != "" && regAddHp_no.test(hp_no.val()) == false){
			$.iGrowl({
				title: '휴대폰번호는 -를 제외한 11자리를 입력해주세요.',
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
			hp_no.val() = "";
			hp_no.focus();
	        return false;
		}
		
		//이메일 공백검사
		if(email.val() == ""){
	        $.iGrowl({
				title: '이메일을 입력해주세요.',
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
	        email.focus();
	        return false;
	    }
		
		//이메일 유효성검사
		if(email.val() != "" && regAddEmail.test(email.val()) == false){
			$.iGrowl({
				title: '이메일 양식에 맞게 입력해주세요.',
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
			email.val() = "";
			email.focus();
	        return false;
		}
		
		//전화번호 공백검사
		if(tel_no.val() == ""){
	        $.iGrowl({
				title: '전화번호를 입력해주세요.',
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
	        tel_no.focus();
	        return false;
	    }
		
		//전화번호 유효성검사
		if(tel_no.val() != "" && regAddTel_no.test(tel_no.val()) == false){
			$.iGrowl({
				title: '일반전화번호 양식에 맞게 입력해주세요.',
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
			tel_no.val() = "";
			tel_no.focus();
	        return false;
		}
		
		//내선번호 공백검사
		if(in_num.val() == ""){
	        $.iGrowl({
				title: '내선번호를 입력해주세요.',
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
	        in_num.focus();
	        return false;
	    }
		
		//내선번호 유효성검사
		if(in_num.val() != "" && regAddIn_num.test(in_num.val()) == false){
			$.iGrowl({
				title: '내선번호는 4자리로 입력해주세요.',
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
			in_num.val() = "";
			in_num.focus();
	        return false;
		}
		
		//안전보건직무 공백검사
		if(cd_edum_gn.val() == ""){
	        $.iGrowl({
				title: '안전보건직무를 입력해주세요.',
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
	        cd_edum_gn.focus();
	        return false;
	    }
		
		//특별교육대상자 공백검사
		if(spc_edu_yn.val() == false){
	        $.iGrowl({
				title: '특별교육대상자를 체크해주세요',
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
	        spc_edu_yn.focus();
	        return false;
	    }
		
		//입사일 공백검사
		if(ent_co_dy.val() == ""){
	        $.iGrowl({
				title: '입사일을 입력해주세요.',
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
	        ent_co_dy.focus();
	        return false;
	    }
		
		//입사일 유효성검사
		if(ent_co_dy.val() != "" && regAddEnt_co_dy.test(ent_co_dy.val()) == false){
			$.iGrowl({
				title: '날짜양식에 맞게 입력해주세요.',
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
			ent_co_dy.val() = "";
			ent_co_dy.focus();
	        return false;
		}
		
		//직무변경일 공백검사
		if(job_ch_dy.val() == ""){
	        $.iGrowl({
				title: '직무변경일을 입력해주세요.',
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
	        job_ch_dy.focus();
	        return false;
	    }
		
		//직무변경일 유효성검사
		if(job_ch_dy.val() != "" && regAddJob_ch_dy.test(job_ch_dy.val()) == false){
			$.iGrowl({
				title: '날짜양식에 맞게 입력해주세요.',
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
			job_ch_dy.val() = "";
			job_ch_dy.focus();
	        return false;
		}
		
		//휴직시작일 공백검사
		if(layo_st_dy.val() == ""){
	        $.iGrowl({
				title: '휴직시작일을 입력해주세요.',
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
	        layo_st_dy.focus();
	        return false;
	    }
		
		//휴직시작일 유효성검사
		if(layo_st_dy.val() != "" && regAddLayo_st_dy.test(layo_st_dy.val()) == false){
			$.iGrowl({
				title: '날짜양식에 맞게 입력해주세요',
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
			layo_st_dy.val() = "";
			layo_st_dy.focus();
	        return false;
		}
		
		//휴직종료일 공백검사
		if(layo_en_dy.val() == ""){
	        $.iGrowl({
				title: '휴직종료일을 입력해주세요.',
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
	        layo_en_dy.focus();
	        return false;
	    }
		
		//휴직종료일 유효성검사
		if(layo_en_dy.val() != "" && regAddLayo_en_dy.test(layo_en_dy.val()) == false){
			$.iGrowl({
				title: '날짜양식에 맞게 입력해주세요.',
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
			layo_en_dy.val() = "";
			layo_en_dy.focus();
	        return false;
		}
		
		//퇴직일 공백검사
		if(ret_dy.val() == ""){
	        $.iGrowl({
				title: '퇴직일을 입력해주세요.',
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
	        ret_dy.focus();
	        return false;
	    }
		
		//퇴직일 유효성검사
		if(ret_dy.val() != "" && regAddRet_dy.test(ret_dy.val()) == false){
			$.iGrowl({
				title: '날짜양식에 맞게 입력해주세요.',
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
			ret_dy.val() = "";
			ret_dy.focus();
	        return false;
		}
		
		//재직상태 공백검사
		if(cd_hffc.val() == ""){
	        $.iGrowl({
				title: '재직상태를 입력해주세요.',
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
	        cd_hffc.focus();
	        return false;
	    }
		
		//정기교육대상자 공백검사
		if(pet_edu_yn.val() == ""){
	        $.iGrowl({
				title: '정기교육대상자를 입력해주세요.',
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
	        pet_edu_yn.focus();
	        return false;
	    }

    }
    </script>
</body>
</html>