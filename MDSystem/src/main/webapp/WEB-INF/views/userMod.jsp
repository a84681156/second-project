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
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- 로컬css -->
    <link rel="stylesheet" href="<c:url value='/css/userAdd.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header_footer.css'/>">

    <!-- fontAsome -->
    <script src="https://kit.fontawesome.com/159aca3e6d.js" crossorigin="anonymous"></script>

    <!-- 제이쿼리js -->
    <script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
</head>
<body>
    
    <div id="container">

        <div id="managmentBox">
            <form action="<c:url value='/managment/mod'/>" method="GET" id="frm">            
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
                            	<input type="text" name="sabun" class="formControl" value="${userInfo.sabun }"  />
                                <button type="button" class="btnControl" id="scBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                            </td>
                            <th>패스워드</th>
                            <td><input type="text" name="passwd" class="formControl" value="${userInfo.passwd }" /></td>
                        </tr>
                        <tr>
                            <th>이름</th>
                            <td><input type="text" name="name" class="formControl" value="${userInfo.name }" /></td>
                            <th>직급/직위</th>
                            <td><input type="text" name="level" class="formControl" value="${userInfo.level }" /></td>
                        </tr>
                        <tr>
                            <th>사용자권한</th>
                            <td>
                            	<input type="hidden" id="cd_user_gtH" value="${userInfo.cd_user_gt }" />
                            	<select name="cd_user_gt" id="cd_user_gt"></select>
                            </td>
                            <th>당해 정기교육(2년) 대상</th>
                            <td>
                            	<input type="hidden" id="ret" value="${userInfo.pet_edu_yn }" />
                                <label><input type="radio" name="pet_edu_yn" id="Y1" value="Y" >대상</label>
                                <label><input type="radio" name="pet_edu_yn" id="N1" value="N" >미대상</label>
                            </td>
                        </tr>
                        <tr>
                            <th>사업부 코드</th>
                            <td>
                            	<input type="hidden" id="sa_codeH" value="${userInfo.sa_code }" />
                            	<select name="sa_code" id="sa_code"></select>
                            	
                            </td>
                            <th>사업부명</th>
                            <td>
                            	<input type="text" name="sa_nm" id="sa_nm" class="formControl" value="${userInfo.sa_nm }" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th>부서 코드</th>
                            <td>
                            	<input type="hidden" id="dept_codeH" value="${userInfo.dept_code }" />
                            	<select name="dept_code" id="dept_code"></select>
                            </td>
                            <th>부서명</th>
                            <td>
                            	<input type="text" name="dept_nm" id="dept_nm" class="formControl" value="${userInfo.dept_nm }" readonly/>
                            </td>
                        </tr>
                        <tr>
                            <th>핸드폰번호</th>
                            <td><input type="text" name="hp_no" class="formControl" value="${userInfo.hp_no }" /></td>
                            <th>이메일</th>
                            <td><input type="text" name="email" class="formControl" value="${userInfo.email }" /></td>
                        </tr>
                        <tr>
                            <th>전화번호</th>
                            <td><input type="text" name="tel_no" class="formControl" value="${userInfo.tel_no }" /></td>
                            <th>내선번호</th>
                            <td><input type="text" name="in_num" class="formControl" value="${userInfo.in_num }" /></td>
                        </tr>
                        <tr>
                            <th>안전보건직무</th>
                            <td>
                            	<input type="hidden" id="cd_edum_gnH" value="${userInfo.cd_edum_gn }" />
                            	<select name="cd_edum_gn" id="cd_edum_gn"></select>
                            </td>
                            <th>특별교육 대상자 여부</th>
                            <td>
                            	<input type="hidden" id="set" value="${userInfo.spc_edu_yn }"/>
                                <label><input type="radio" name="spc_edu_yn" id="Y" value="Y" >대상</label>
                                <label><input type="radio" name="spc_edu_yn" id="N" value="N" >미대상</label>
                            </td>
                        </tr>
                        <tr>
                            <th>입사일</th>
                            <td><input type="text" name="ent_co_dy" class="formControl" value="${userInfo.ent_co_dy }" /></td>
                            <th>직무변경일</th>
                            <td><input type="text" name="job_ch_dy" class="formControl" value="${userInfo.job_ch_dy }" /></td>
                        </tr>
                        <tr>
                            <th>휴직일</th>
                            <td><input type="text" name="layo_st_dy" class="formControl2" value="${userInfo.layo_st_dy }" />~<input type="text" name="layo_en_dy" class="formControl2" value="${userInfo.layo_en_dy }" /></td>
                            <th>퇴사일</th>
                            <td><input type="text" name="ret_dy" class="formControl" value="${userInfo.ret_dy }" /></td>
                        </tr>
                        <tr>
                            <th>재직상태</th>
                            <td>
                            	<input type="hidden" id="os" value="${userInfo.cd_hffc }" />
                                <label><input type="radio" name=cd_hffc id="W" value="W" >재직</label>
                                <label><input type="radio" name="cd_hffc" id="H" value="H" >휴직</label>
                                <label><input type="radio" name="cd_hffc" id="R" value="R" >퇴직</label> 
                            </td>
                            <th></th>
                            <td></td>
                        </tr>
                    </table>
                </div><!-- userInfo -->

                <div class="manageBtn">
                    <button type="submit" class="btnControl2" id="modSendBtn">수정하기</button>
                </div>
            </form>
        </div><!-- managmentBox -->


    </div><!-- container -->
    
	<script>
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

	    	//코드테이블에 있는만큼 select list만들기
			commonCodeSelectAdd('cd_user_gt', getCommonCode('G0000'))
			commonCodeSelectAdd('sa_code', getCommonCode('B0000'))
			commonCodeSelectAdd('dept_code', getCommonCode('P0000'))
			commonCodeSelectAdd('cd_edum_gn', getCommonCode('S0000'))
			
			//수정시 select박스 값가져와서 선택되어있게하기
			var cd_user_gt = $('#cd_user_gtH').val();
			var sa_code = $('#sa_codeH').val();
			var dept_code = $('#dept_codeH').val();
			var cd_edum_gn = $('#cd_edum_gnH').val();
			
			if(cd_user_gt == '일반'){				
				$('#cd_user_gt').val('GEN').prop("selected",true);
			} else if(cd_user_gt == '관리'){
				$('#cd_user_gt').val('MNG').prop("selected",true);				
			} else if(cd_user_gt == '마스터'){
				$('#cd_user_gt').val('SUP').prop("selected",true);
			}
			
			if(sa_code == 'B0001'){				
				$('#sa_code').val('B0001').prop("selected",true);
			} else if(sa_code == 'B0002'){
				$('#sa_code').val('B0002').prop("selected",true);				
			} else if(sa_code == 'B0003'){
				$('#sa_code').val('B0003').prop("selected",true);
			}
			
			if(dept_code == 'P0001'){
				$('#dept_code').val('P0001').prop('selected',true);
			}else if(dept_code == 'P0002'){
				$('#dept_code').val('P0002').prop('selected',true);
			}else if(dept_code == 'P0003'){
				$('#dept_code').val('P0003').prop('selected',true);
			}else if(dept_code == 'P0004'){
				$('#dept_code').val('P0004').prop('selected',true);
			}else if(dept_code == 'P0005'){
				$('#dept_code').val('P0005').prop('selected',true);
			}else if(dept_code == 'P0006'){
				$('#dept_code').val('P0006').prop('selected',true);
			}
			
			if(cd_edum_gn == '안전보건직무1'){				
				$('#cd_edum_gn').val('S0001').prop("selected",true);
			} else if(cd_edum_gn == '안전보건직무2'){
				$('#cd_edum_gn').val('S0002').prop("selected",true);				
			} else if(cd_edum_gn == '안전보건직무3'){
				$('#cd_edum_gn').val('S0003').prop("selected",true);
			}
			
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
	</script>
</body>
</html>