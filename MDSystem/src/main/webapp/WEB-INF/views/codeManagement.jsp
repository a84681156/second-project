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
<link rel="stylesheet" href="<c:url value='/css/codeManagment.css'/>">
<link rel="stylesheet" href="<c:url value='/css/header_footer.css'/>">

<!-- fontAsome -->
<script src="https://kit.fontawesome.com/159aca3e6d.js" crossorigin="anonymous"></script>

<!-- 제이쿼리js -->
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/redmond/jquery-ui.css" type="text/css" />
 <!-- jqGrid CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/jqgrid/4.6.0/css/ui.jqgrid.css" type="text/css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<!-- The actual JQuery code -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- The JQuery UI code -->
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- The jqGrid language file code-->
<script type="text/javascript" src="//cdn.jsdelivr.net/jqgrid/4.6.0/i18n/grid.locale-kr.js" /></script>
<!-- The atual jqGrid code -->
<script type="text/javascript" src="//cdn.jsdelivr.net/jqgrid/4.6.0/jquery.jqGrid.src.js" /></script>


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

        <div id="commonManagment">

            <div id="commonTitle">
                <span>공통코드</span>
            </div>

            <div class="scBar">
                <form>
                    <ul>
                        <li class="scList1">
                            <span>그룹코드명 검색</span>
                        </li>
                        <li class="scList2">
                           <input type="text" class="formControl" id="keyword" name="keyword" placeholder="코드명을 입력하세요." onkeyup="enterkey();">
                        </li>
                        <li class="scList3">
                            <button type="button" class="btnControl" id="scBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
                        </li>
                    </ul>
                </form>    
            </div><!-- scBar -->
            
            <div id="jq">
            	<div id="grpCode">
	            	<div id="codeBtn">
	                	<button type="button" class="btnControl" id="addGrpBtn">그룹코드추가</button>
	                	<button type="button" class="btnControl" id="modGrpBtn">그룹코드수정</button>
	                	<button type="button" class="btnControl" id="delGrpBtn">그룹코드삭제</button>                	
	                </div>	
	            	<table id="grpCodeT"></table>
	            	<div id="grpCodeP"></div>
            	</div>
				<div id="code" style="display:none;">
		            <div id="codeBtn2" >
		            	<button type="button" class="btnControl2" id="addBtn">코드추가</button>
						<button type="button" class="btnControl2" id="modBtn">코드수정</button>
						<button type="button" class="btnControl2" id="delBtn">코드삭제</button>
		            </div>	
	            	<table id="codeT"></table>
	            	<div id="codeP"></div>
				</div>            	
            </div>

			<div id="codee"></div>

        </div><!-- commonManagment -->

    </div><!-- container -->

    <script>
    var grp_codeA = null;
    //jqGrid
    //화면로딩하면 자동으로 시작하는 함수
    $(document).ready(function(){
    	gridTable();
    })
    
    $('#scBtn').on('click', function(){
    	gridTable();
    })
    
    function enterkey() {
    	 if (window.event.keyCode == 13) {
    		 gridTable();
         }
	} 
    
    //그룹코드리스트 가져오는 함수
    function gridTable(){
    	var keyword = $('.scBar .scList2 #keyword').val();
    	$.ajax({
    		type:'GET',
    		url:'/codeManage/list3?keyword='+keyword,
    		success:function(result){
    			grpCodeTable(result);
    		},
	    	error: function(){
	    		$.iGrowl({
					title: '그룹코드로딩에 실패하였습니다.',
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
    }//gridTable
    

    
    function grpCodeTable(data){
    	$('#grpCodeT').jqGrid('GridUnload');
    	$('#grpCodeT').jqGrid({
       		datatype: "local",
       		data: data,
       		height: 220,
       		width: 460,
       		colNames: ['그룹코드','그룹코드명','사용유무','indx'],
       		colModel:[
       			{name:'grp_code', index:'grp_code', align:'center', key:true},
       			{name:'grp_code_nm', index:'grp_code_nm'},
       			{name:'use_yn', index:'use_yn', align:'center'},
       			{name:'indx', index: 'indx', hidden: true}
       		],	
       		rowNum: 10,
       		multiselect:false,
       		pager: '#grpCodeP',
       	    sortorder : "desc", // 정렬 기준
       	    emptyrecode : "작성된 글이 없습니다.",
       	 	onSelectRow  : function(grp_code) {
       	 		$.ajax({
       	 			type: 'POST',
       	 			url:'/codeManage/cList',
       	 			contentType: 'application/json;charset=utf-8',
       	 			data: JSON.stringify({grp_code: grp_code}),
       	 			success:function(result){
       	 				codeTable(result);
       	 				grp_codeA = grp_code;
       	 				$('#code').css('display', 'block');
       	 			},
       	 			error:function(){
	       	 			$.iGrowl({
	    					title: '상세코드로딩에 실패하였습니다.',
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
       	 	}//onClick
       	})//grpCodeT Grid
    }//grpCodeTable
    
    //코드리스트를 가져오는 함수
    function gridTable2(){
    	$.ajax({
	 			type: 'POST',
	 			url:'/codeManage/cList',
	 			contentType: 'application/json;charset=utf-8',
	 			data: JSON.stringify({grp_code: grp_codeA}),
	 			success:function(result){
	 				codeTable(result);
	 			},
	 			error:function(){
	 				$.iGrowl({
    					title: '상세코드로딩에 실패하였습니다.',
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
    }//gridTable2
    
    function codeTable(data){
    	$('#codeT').jqGrid('GridUnload');
    	$('#codeT').jqGrid({
       		datatype: "local",
       		data: data,
       		height: 220,
       		width: 460,
       		colNames: ['그룹코드', '코드', '코드명', '사용유무','indx'],
       		colModel:[
       			{name:'grp_code', index:'grp_code', align:'center'},
       			{name:'code', index:'code', align:'center', key:true},
       			{name:'code_nm', index:'code_nm'},
       			{name:'use_yn', index:'use_yn', align:'center'},
       			{name:'indx', index: 'indx', hidden: true}
       		],	
       		rowNum: 10,
       		multiselect:false,
       		pager: '#codeP',
       	    sortorder : "desc", // 정렬 기준
       	    emptyrecode : "작성된 글이 없습니다."
    	})
    }
   	
    
    //그룹코드추가-화면이동
    $(document).ready(function(){
    	$('#addGrpBtn').on('click',function(data){
    		$.ajax({
    			success(result){
    				$('#codee').html(toHtml());
    			},
    			error(){
    				$.iGrowl({
    					title: '그룹코드추가화면 로딩을 실패했습니다.',
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
    		
    		var toHtml = function(result){
    			let tmp = '<div class="codeDetailBox" style="display: block;">'
    				tmp += '<form>'
    				tmp += '<div class="codeDetailTable">'
    				tmp += '<table border="1">'
    		    	tmp += '<thead>'
    		    	tmp += '<tr>'
    		    	tmp += '<th>그룹코드</th>'
    		    	tmp += '<th>그룹코드명</th>'
    		    	tmp += '<th>사용유무</th>'
    		    	tmp += '</tr>'
    		    	tmp += '</thead>'
    		    	tmp += '<tbody>'
    					tmp += '<tr>'
   						tmp += '<td><input type=text class="formControl" name="grp_code" id="grp_code" placeholder="생성할 그룹코드를 입력하세요."></td>'   					
    					tmp += '<td><input type=text class="formControl" name="grp_code_nm" id="grp_code_nm" placeholder="생성할 그룹코드명을 입력하세요."></td>'
   						tmp += '<td>'
    					tmp += '<select name="use_yn" id="use_yn">'
    					tmp += '<option value="">사용유무선택</option>'
    					tmp += '<option value="Y">사용</option>'
    					tmp += '<option value="N">미사용</option>'
    					tmp += '</select>'    					
    					tmp += '</td>' 
    					tmp += '</tr>'
    				tmp += '</tbody>'
    		    	tmp += '</table>'
    				tmp += '</div>'
    				tmp += '<div class="codeDetailBtn3">'
    				tmp += '<button type="button" class="btnControl3" id="grpCodeAddBtn">추가</button>'
    				tmp += '<button type="button" class="btnControl3" id="cancelBtn">취소</button>'
    				tmp += '</div>'
    				tmp += '</form>'
    		    	return tmp += '</div>';
    		}//tohtml
    	})//addGrpBtn
    });
    
    //그룹코드추가-적용
    $('#codee').on('click', '#grpCodeAddBtn', function(){
    	if(Check() == false){
    		return;
    	}
    	var grp_code = $('.codeDetailTable table tr #grp_code').val();
    	var grp_code_nm = $('.codeDetailTable table tr #grp_code_nm').val();
    	var use_yn = $('.codeDetailTable table tr #use_yn').val();
    	var data = ({
    		grp_code: grp_code,
    		grp_code_nm: grp_code_nm,
    		use_yn: use_yn
    	})
    	$.ajax({
    		type:'POST',
    		url:'/codeManage/gcAdd',
    		contentType:'application/json;charset=utf-8',
    		data:JSON.stringify(data),
    		success:function(result){
    			$.iGrowl({
					title: '그룹코드가 추가되었습니다.',
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
    			gridTable();
    			$('.codeDetailBox').css('display', 'none');
    		},
    		error:function(){
    			$.iGrowl({
					title: '그룹코드추가를 실패했습니다.',
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
    })
    
    //그룹코드수정-화면이동
    $(document).ready(function(){
    	$('#modGrpBtn').on('click', function(){
    		var rowId = $('#grpCodeT').getGridParam('selrow');
    		
    		if(rowId==null){
    			$.iGrowl({
					title: '수정할 그룹코드를 선택해주세요.',
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
    		}else{
	   			var data = ({
	   				grp_code: rowId
	   			})
	    		$.ajax({
	    			type: 'POST',
	    			url: '/codeManage/gcRead',
	    			contentType: 'application/json; charset=utf-8',
	    			data: JSON.stringify(data),
	    			success:function(result){
	    				$('#codee').html(toHtml(result));
	    			},
	    			error:function(){
	    				$.iGrowl({
	    					title: '그룹코드수정화면 로딩을 실패했습니다.',
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
	    		
	    		var toHtml = function(result){
	    			let tmp = '<div class="codeDetailBox" style="display: block;">'
	    				tmp += '<form>'
	    				tmp += '<div class="codeDetailTable">'
	    				tmp += '<table border="1">'
	    		    	tmp += '<thead>'
	    		    	tmp += '<tr>'
	    		    	tmp += '<th>그룹코드</th>'
	    		    	tmp += '<th>그룹코드명</th>'
	    		    	tmp += '<th>사용유무</th>'
	    		    	tmp += '</tr>'
	    		    	tmp += '</thead>'
	    		    	tmp += '<tbody>'
	    					tmp += '<tr>'
	   						tmp += '<td><input type=text class="formControl" name="grp_code" id="grp_code" value='+ result.grp_code +'></td>'   					
	    					tmp += '<td><input type=text class="formControl" name="grp_code_nm" id="grp_code_nm" value='+ result.grp_code_nm +'></td>'
	    					tmp += '<input type=hidden class="formControl" name="indx" id="indx" value='+ result.indx +'>'
	   						tmp += '<td>'
	    					tmp += '<select name="use_yn" id="use_yn">'
	    					tmp += '<option value="">사용유무선택</option>'
	    					tmp += '<option value="Y">사용</option>'
	    					tmp += '<option value="N">미사용</option>'
	    					tmp += '</select>'    					
	    					tmp += '</td>' 
	    					tmp += '</tr>'
	    				tmp += '</tbody>'
	    		    	tmp += '</table>'
	    				tmp += '</div>'
	    				tmp += '<div class="codeDetailBtn3">'
	    				tmp += '<button type="button" class="btnControl3" id="grpCodeModBtn">수정</button>'
	    				tmp += '<button type="button" class="btnControl3" id="cancelBtn">취소</button>'
	    				tmp += '</div>'
	    				tmp += '</form>'
	    		    	return tmp += '</div>';
	    		}//toHtml
    	})//modGrpBtn
    })
    
    //그룹코드수정-적용
    $('#codee').on('click', '#grpCodeModBtn', function(){
    	if(Check() == false){
    		return;
    	}
    	var grp_code = $('.codeDetailTable table tr #grp_code').val();
    	var grp_code_nm = $('.codeDetailTable table tr #grp_code_nm').val();
    	var use_yn = $('.codeDetailTable table tr #use_yn').val();
		var indx = $('.codeDetailTable table tr #indx').val();
    	var data = ({
    		grp_code: grp_code,
    		grp_code_nm: grp_code_nm,
    		use_yn: use_yn,
    		indx: indx
    	})
    	
    	$.ajax({
    		type:'POST',
    		url:'/codeManage/gcMod',
    		contentType:'application/json;charset=utf-8',
    		data:JSON.stringify(data),
    		success:function(result){
    			$.iGrowl({
					title: '그룹코드가 수정되었습니다.',
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
    			gridTable();
    			gridTable2();
    			$('.codeDetailBox').css('display', 'none');
    		},
    		error:function(){
    			$.iGrowl({
					title: '그룹코드수정을 실패했습니다.',
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
    })
    
    
    //그룹코드삭제-적용
    $('#delGrpBtn').on('click', function(){
    	var rowId = $('#grpCodeT').getGridParam('selrow');
    	
    	if(rowId == null){
    		$.iGrowl({
				title: '삭제할 그룹코드를 선택해주세요.',
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
    	}else{
			var data = ({
				grp_code: rowId
			})
			$.ajax({
				type: 'POST',
				url: '/codeManage/gcDel',
				contentType: 'application/json; charset=utf-8',
				data: JSON.stringify(data),
				success:function(result){
					$.iGrowl({
    					title: '그룹코드가 삭제되었습니다.',
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
	    			gridTable();
	    			gridTable2();
				},
				error:function(){
					$.iGrowl({
    					title: '그룹코드삭제를 실패했습니다.',
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
    })
    
    //코드추가-화면이동
    $('#addBtn').on('click', function(){
    	 $.ajax({
 			success: function(){
 				$("#codee").html(toHtml(grp_codeA));
 			},
 			error: function(){
 				$.iGrowl({
					title: '코드추가화면 로딩을 실패했습니다.',
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
 		
 		var toHtml = function(result){
 	    	let tmp = '<div class="codeDetailBox" style="display: block;">'
 			tmp += '<form>'
 			tmp += '<div class="codeDetailTable">'
 			tmp += '<table border="1" id="cTable">'
 	    	tmp += '<thead>'
 	    	tmp += '<tr>'
 	    	tmp += '<th>그룹코드</th>'
 	    	tmp += '<th>코드</th>'
 	    	tmp += '<th>코드명</th>'
 	    	tmp += '<th>사용유무</th>'
 	    	tmp += '</tr>'
 	    	tmp += '</thead>'
 	    	tmp += '<tbody>'
 	    	tmp += '<tr>'
 	    	tmp += '<td><input type="text" name="grp_code" id="grp_code" class="formControl" value='+ result +' readonly></td>'  
 	    	tmp += '<td><input type="text" name="code" id="code" class="formControl"  placeholder="생성할 코드를 입력하세요."></td>'  
 	    	tmp += '<td><input type="text" name="code_nm" id="code_nm" class="formControl"  placeholder="생성할 코드명을 입력하세요."></td>' 
			tmp += '<td>'
			tmp += '<select name="use_yn" id="use_yn">'
			tmp += '<option value="">사용유무선택</option>'
			tmp += '<option value="Y">사용</option>'
			tmp += '<option value="N">미사용</option>'
			tmp += '</select>'    					
			tmp += '</td>' 
 	    	tmp += '</tr>' 
 			tmp += '</tbody>'
 	    	tmp += '</table>'
 			tmp += '</div>'
 			tmp += '<div class="codeDetailBtn2">'
 			tmp += '<button type="button" class="btnControl2" id="codeAddBtn">적용</button>'
 			tmp += '<button type="button" class="btnControl2" id="cancelBtn">취소</button>'
 			tmp += '</div>'
 			tmp += '</form>'
 	    	return tmp += '</div>';
 	    }
    })
    
    //코드추가-적용
    $('#codee').on('click', '#codeAddBtn', function(){
    	if(Check2() == false){
    		return;
    	}
    	var code = $('#cTable tbody tr #code').val();
    	var code_nm = $('#cTable tbody tr #code_nm').val();
    	var use_yn = $('#cTable tbody tr #use_yn').val();
    	var grp_code = $('#cTable tbody tr #grp_code').val();
    	var data = ({
    		grp_code: grp_code,
    		code: code,
    		code_nm: code_nm,
    		use_yn: use_yn
    	})
 
    	$.ajax({
    		type:'POST',
    		url: '/codeManage/cAdd',
    		contentType : "application/json; charset=utf-8",
    		data: JSON.stringify(data),
    		success: function(result){
    			$.iGrowl({
					title: '코드가 추가되었습니다.',
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
    			gridTable2();
    			$('.codeDetailBox').css('display', 'none');
    		},
    		error: function(){
    			$.iGrowl({
					title: '코드추가를 실패했습니다.',
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
    })
    
    //코드수정-화면이동
    $('#modBtn').on('click', function(){
    	var rowId = $('#codeT').getGridParam('selrow');
    	
    	if(rowId==null){
    		$.iGrowl({
				title: '수정할 코드를 선택해주세요.',
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
    	}else{
	    	var data = ({
	    		code: rowId
	    	})
	    	
	    	$.ajax({
	            type:'POST',
	            url: '/codeManage/cRead',
	            data: JSON.stringify(data),
	            contentType:'application/json;charset=utf-8',
	            success: function(result){
	                $("#codee").html(toHtml(result));
	            },
	            error: function(){ 
	            	$.iGrowl({
    					title: '코드수정화면 로딩에 실패했습니다.',
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
	        }); // $.ajax()
    	}
 		
 		var toHtml = function(result){
 			let tmp = '<div class="codeDetailBox" style="display: block;">'
 	 			tmp += '<form>'
 	 			tmp += '<div class="codeDetailTable">'
 	 			tmp += '<table border="1" id="cTable">'
 	 	    	tmp += '<thead>'
 	 	    	tmp += '<tr>'
 	 	    	tmp += '<th>그룹코드</th>'
 	 	    	tmp += '<th>코드</th>'
 	 	    	tmp += '<th>코드명</th>'
 	 	    	tmp += '<th>사용유무</th>'
 	 	    	tmp += '</tr>'
 	 	    	tmp += '</thead>'
 	 	    	tmp += '<tbody>'
 	 	    	tmp += '<tr>'
 	 	    	tmp += '<td><input type="text" name="grp_code" id="grp_code" class="formControl" value='+ result.grp_code +' readonly></td>'  
 	 	    	tmp += '<td><input type="text" name="code" id="code" class="formControl" value='+ result.code +'></td>'  
 	 	    	tmp += '<td><input type="text" name="code_nm" id="code_nm" class="formControl"  value='+ result.code_nm +'></td>' 
 	 	    	tmp += '<input type=hidden class="formControl" name="indx" id="indx" value='+ result.indx +'>'
 				tmp += '<td>'
 				tmp += '<select name="use_yn" id="use_yn">'
 				tmp += '<option value="">사용유무선택</option>'
 				tmp += '<option value="Y">사용</option>'
 				tmp += '<option value="N">미사용</option>'
 				tmp += '</select>'    					
 				tmp += '</td>' 
 	 	    	tmp += '</tr>' 
 	 			tmp += '</tbody>'
 	 	    	tmp += '</table>'
 	 			tmp += '</div>'
 	 			tmp += '<div class="codeDetailBtn2">'
 	 			tmp += '<button type="button" class="btnControl2" id="codeModBtn">적용</button>'
 	 			tmp += '<button type="button" class="btnControl2" id="cancelBtn">취소</button>'
 	 			tmp += '</div>'
 	 			tmp += '</form>'
 	 	    	return tmp += '</div>';
 	    }
    })
    
    //코드수정-적용
    $('#codee').on('click', '#codeModBtn', function(){
    	if(Check2() == false){
    		return;
    	}
    	  var grp_code = $('#cTable tbody tr #grp_code').val();
      	  var code = $('#cTable tbody tr #code').val();
      	  var code_nm = $('#cTable tbody tr #code_nm').val();
      	  var use_yn = $('#cTable tbody tr #use_yn').val();
      	  var indx = $('#cTable tbody tr #indx').val();
      	  
      	  var data = ({
	   	      grp_code: grp_code,
	   		  code: code,
	   		  code_nm: code_nm,
	   		  use_yn: use_yn,
	   		  indx: indx
      	  })
      	  
    	  $.ajax({
    	    	type: 'POST',
    	    	url: '/codeManage/cMod',
    	    	data: JSON.stringify(data),
    	    	contentType : "application/json; charset=utf-8",
    	    	success: function(result){
    	    		$.iGrowl({
    					title: '코드가 수정되었습니다.',
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
        			gridTable2();
        			$('.codeDetailBox').css('display', 'none');
    	    	},
    	    	error: function(){
    	    		$.iGrowl({
    					title: '코드수정을 실패했습니다.',
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
      })
    
    
    //코드삭제버튼
    $('#delBtn').on('click', function(){
    	var rowId = $('#codeT').getGridParam('selrow');
    	if(rowId==null){
    		$.iGrowl({
				title: '삭제할 코드를 선택해주세요.',
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
    	}else{
			var data = ({
				code: rowId
			})
	    	$.ajax({
		    	type: 'POST',
		    	url: '/codeManage/cDel',
		    	data: JSON.stringify(data),
		    	contentType : "application/json; charset=utf-8",
		    	success: function(result){
		    		$.iGrowl({
    					title: '코드삭제를 성공했습니다.',
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
					gridTable2();
		    		$('.codeDetailBox').css('display', 'none');
		    	},
		    	error: function(){
		    		$.iGrowl({
    					title: '코드삭제에 실패했습니다.',
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
    })
    
    //최소버든누르면 코드상세보기 닫기
    $('#codee').on('click', '#cancelBtn', function(){
   		if($(".codeDetailBox").css("display") =="block"){
   			$(".codeDetailBox").css("display", "none");
   		}
    })
    
    
    function Check(){
    	var grp_code = $('#grp_code');
    	var grp_code_nm = $('#grp_code_nm');
    	var use_yn = $('#use_yn');
    	
    	var grp_codeChk = /^[a-zA-Z0-9]{5,5}$/;
    	var grp_code_nmChk = /^[a-zA-Z0-9가-힣]{1,10}$/;
    	
    	//그룹코드 공백검사
    	if(grp_code.val() == ""){
			$.iGrowl({
				title: "그룹코드를 작성해주세요.",
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
			grp_code.focus();
	        return false;
	    }
    	//그룹코드 유효성검사
    	if(grp_code.val() != "" && grp_codeChk.test(grp_code.val()) == false){
			$.iGrowl({
				title: '그룹코드는 영문대소문자,숫자로 5자리로 작성해주세요.',
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
			grp_code.val() == "";
			grp_code.focus();
			return false;
		}
    	
    	//그룹코드명 공백검사
    	if(grp_code_nm.val() == ""){
			$.iGrowl({
				title: "그룹코드명을 작성해주세요.",
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
			grp_code.focus();
	        return false;
	    }
    	
    	//그룹코드명 유효성검사
    	if(grp_code_nm.val() != "" && grp_code_nmChk.test(grp_code_nm.val()) == false){
			$.iGrowl({
				title: '그룹코드명은 한문,영문대소문자,숫자로 10자리 이내로 작성해주세요.',
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
			grp_code_nm.val() == "";
			grp_code_nm.focus();
			return false;
		}
    	
    	
    	//사용유무 공백검사
    	if(use_yn.val()=="" || use_yn.val() == null){
    		$.iGrowl({
				title: '사용유무를 선택해주세요.',
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
    		use_yn.focus();
    		return false;
    	}
    }//Check
    
    function Check2(){
    	var code = $('#cTable tbody tr #code');
    	var code_nm = $('#cTable tbody tr #code_nm');
    	var use_yn = $('#use_yn');
    	
    	var codeChk = /^[a-zA-Z0-9]{5,5}$/; 
    	var code_nmChk = /^[a-zA-Z0-9가-힣]{1,10}$/; 
    	
    	//코드 공백검사
    	if(code.val() == ""){
			$.iGrowl({
				title: "코드를 작성해주세요.",
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
			code.focus();
	        return false;
	    }
    	//코드 유효성검사
    	if(code.val() != "" && codeChk.test(code.val()) == false){
			$.iGrowl({
				title: '코드는 영문대소문자,숫자로 5자리로 작성해주세요.',
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
			code.val() == "";
			code.focus();
			return false;
		}
    	
    	//코드명 공백검사
    	if(code_nm.val() == ""){
			$.iGrowl({
				title: "코드명을 작성해주세요.",
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
			code_nm.focus();
	        return false;
	    }
    	//코드명 유효성검사
    	if(code_nm.val() != "" && code_nmChk.test(code_nm.val()) == false){
			$.iGrowl({
				title: '코드명은 한문,영문대소문자,숫자로 10자리 이내로 작성해주세요.',
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
			code_nm.val() == "";
			code_nm.focus();
			return false;
		}
    	
    	//사용유무 공백검사
    	if(use_yn.val()=="" || use_yn.val() == null){
    		$.iGrowl({
				title: '사용유무를 선택해주세요.',
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
    		use_yn.focus();
    		return false;
    	}
    }//Check2
    
    //메세지
    let msg = "${msg}";
    console.log(msg)
    if(msg == "LOGIN_OK"){
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