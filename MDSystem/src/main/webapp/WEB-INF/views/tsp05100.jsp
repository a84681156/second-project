<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 폰트링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<!-- fontAsome -->
<script src="https://kit.fontawesome.com/159aca3e6d.js" crossorigin="anonymous"></script>
<!-- 로컬css -->
<link rel="stylesheet" href="<c:url value='/css/header_footer.css'/>">
<link rel="stylesheet" href="<c:url value='/css/tsp05100.css'/>">
<!-- jquery/jqgrid -->
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
	
	<div class="contents_wrap_tsp05100_page">
	
		<div class="page-title-wrap">
			<h2>안전법규및규정</h2>
			<ul>
				<a href="#" id="tab1"><li>산업안전보건법</li></a>
				<a href="#" id="tab2"><li>중대재해처벌법</li></a>
				<a href="#" id="tab3"><li>사내안전보건관리규정</li></a>	
			</ul>
		</div><!-- page-title-wrap -->
		
		<div class="search_wrap_active">
		
			<div class="sch_box">
				<ul>
					<li class="sc1">
	             		<select name="scCondition" id="scCondition">
	                         <option value="t" ${sc.option=='t' ? "selected" : ""}>제목 검색</option>
	                         <option value="w" ${sc.option=='w' ? "selected" : ""}>작성자 검색</option>
	                     </select>
	                </li>
	                <li class="sc2">
	                    <input type="text" class="formControl" id="keyword" name="keyword" value="${sc.keyword}" placeholder="검색어를 입력하세요"  onkeyup="return enterkey();">
	                </li>
	                <li class="sc3">
	                    <button type="button" class="btnControl" id="scBtn"><i class="fa-solid fa-magnifying-glass"></i>   조회</button>
	                </li>
				</ul>
			</div><!-- sch-box -->
			
		</div><!-- search-wrap-active -->
		
		<div class="tsp05100_container">
			<section class="tsp05100_list">
				<div class="title_wrap">
					<div class="title_zone">
						<h2 id="title1">산업안전보건법</h2>				
						<h2 id="title2" style="display:none;">중대재해처벌법</h2>				
						<h2 id="title3" style="display:none;">사내안전보건관리법</h2>				
					</div>
					
					<div class="btn_right_box">
						<button class="btnControl" id="wrtBtn">작성</button>
						<!-- <button class="btnControl">수정</button> -->
						<button class="btnControl" id="delBtn">삭제</button>
					</div>
				</div><!-- title_zone -->
				
				<div class="table_wrap">
					<table id="listT"></table>
					<div id="pager"></div>
				</div><!-- table_wrap -->
			</section><!-- tsp05100_list -->
			
			<section class="tsp05100_read">
				<div class="title_wrap">
					<div class="title_zone">
						<h2 id="detail1">산업안전보건법상세</h2>			
						<h2 id="detail2" style="display:none;">중대재해처벌법상세</h2>			
						<h2 id="detail3" style="display:none;">사내안전보건관리규정상세</h2>			
					</div>
					
					<div class="btn_right_box">
						<button class="btnControl" id="addBtn">저장</button>
					</div>
				</div><!-- title_wrap -->
				
				<div class="table_wrap">
					<table class="table2" border=1>
                        <colgroup>
                            <col style= "width:20%;">
                            <col style= "width:80%;">
                        </colgroup>
                        <form id="frm" enctype="multipart/form-data">
							<tr>
								<th>등록일</th>
								<td><input type="date" class="formControl" id="erl_dy" name="erl_dy" readonly/></td>						
							</tr>
							<tr>
								<th>등록자</th>
								<td>
									<input type="text" class="formControl" id="name" name="name"  placeholder="작성자" readonly/>
									<input type="hidden" id="erl_sabun" name="erl_sabun"/>
									<button type="button" class="btnControl" id="modalBtn"><i class="fa-solid fa-magnifying-glass"></i></button></td>						
								</tr>
							<tr>
								<th>첨부파일</th>
								<td>
									<input type="text" class="formControl" id="law_file_txt"  placeholder="첨부파일" readonly/>
									<input type="hidden" id="law_file_ps"/>
									<label class="btnControl2" for="law_file">
										<i class="fa-solid fa-upload" style="color: #ffffff;"></i>
									</label>
									<a id='fileDownload'>									
										<label class="btnControl3">
											<i class="fa-solid fa-download" style="color: #ffffff;"></i>
										</label>
									</a>
									<label class="btnControl3" id="fileDelBtn">
										<i class="fa-solid fa-trash-can" style="color: #ffffff;"></i>
									</label>									
									<input type="file"  id="law_file" name="file"/>
								</td>						
							</tr>
                        </form>
					</table><!-- table2 -->
				</div><!-- table_wrap -->
			</section><!-- tsp05100_read -->
		</div><!-- tsp05100_container -->
		
		
		<!-- 모달창 -->
		<div class="tsp05100_modal" style="display: none;">
			<div class="tsp05100_modal_box">
			
				<div class="sch_box">
					<ul>
		                <li class="sc1">
		                	<sapn class="txtControl">이름 : </sapn>
		                    <input type="text" class="formControl" id="keyword2" name="keyword" value="${sc.keyword}" placeholder="검색어를 입력하세요" onkeyup="enterkey2();">
		                </li>
		                <li class="sc2">
		                    <button type="button" class="btnControl" id="scBtn"><i class="fa-solid fa-magnifying-glass"></i>   조회</button>
		                </li>
					</ul>
				</div><!-- sch-box -->
				
				<div class="table_wrap">
					<table id="uListT"></table>
					<div id="pager3"></div>
				</div><!-- table_wrap -->
				
			</div><!-- tsp05100_modal_box -->
			
		</div><!-- tsp05100_modal -->
		
	</div><!-- contents-wrap tap05100-page -->
	
	<script>
		var gubun = 1;
		var url1 = '/tsp05100/listSC';
		var url2 = '/tsp05100/listSC2';
		var url3 = '/tsp05100/listSC3';
		var colNames1 = '산업안전보건법';
		var colNames2 = '중재재해처벌법';
		var colNames3 = '사내안전보건관리규정';
		
		//페이지로드시 시작
		$(document).ready(function(){
		if(gubun == 1){			
			$('#tab1').css('color', '#fff');
			$('#tab1').css('background-color', '#474757');
		}
			listSC(url1, colNames1);
			$('#tab1').on('click', function(){
				listSC(url1, colNames1);
				$('#title1').css('display', 'block');
				$('#title2').css('display', 'none');
				$('#title3').css('display', 'none');
				$('#detail1').css('display', 'block');
				$('#detail2').css('display', 'none');
				$('#detail3').css('display', 'none');
				gubun = 1;
				$('#tab1').css('color', '#fff');
				$('#tab1').css('background-color', '#474757');
				$('#tab2').css('color', '#474757');
				$('#tab2').css('background-color', '#fff');
				$('#tab3').css('color', '#474757');
				$('#tab3').css('background-color', '#fff');
			})
			$('#tab2').on('click', function(){
				listSC(url2, colNames2);
				$('#title1').css('display', 'none');
				$('#title2').css('display', 'block');
				$('#title3').css('display', 'none');
				$('#detail1').css('display', 'none');
				$('#detail2').css('display', 'block');
				$('#detail3').css('display', 'none');
				gubun = 2;
				$('#tab2').css('color', '#fff');
				$('#tab2').css('background-color', '#474757');
				$('#tab1').css('color', '#474757');
				$('#tab1').css('background-color', '#fff');
				$('#tab3').css('color', '#474757');
				$('#tab3').css('background-color', '#fff');
			})
			$('#tab3').on('click', function(){
				listSC(url3, colNames3);
				$('#title1').css('display', 'none');
				$('#title2').css('display', 'none');
				$('#title3').css('display', 'block');
				$('#detail1').css('display', 'none');
				$('#detail2').css('display', 'none');
				$('#detail3').css('display', 'block');
				gubun = 3;
				$('#tab3').css('color', '#fff');
				$('#tab3').css('background-color', '#474757');
				$('#tab2').css('color', '#474757');
				$('#tab2').css('background-color', '#fff');
				$('#tab1').css('color', '#474757');
				$('#tab1').css('background-color', '#fff');
			})
		})
		
		//산업안전보건법 검색(마우스)
		$('#scBtn').on('click', function(){
			if(gubun==1){				
				listSC(url1, colNames1)
			}else if(gubun==2){
				listSC(url2, colNames2)
			}else{
				listSC(url3, colNames3)
			}
		})
		//산업안전보건법 검색(엔터키)
		function enterkey() {
	        if (window.event.keyCode == 13) {
	        	if(gubun==1){				
					listSC(url1, colNames1)
				}else if(gubun==2){
					listSC(url2, colNames2)
				}else{
					listSC(url3, colNames3)
				}
	        }
		}
		
		//산업안전보건법 리스트 가져오는 함수
		function listSC(url, colNames){	
			var keyword = $('.sch_box .sc2 #keyword').val();
			var option = $('.sch_box .sc1 #scCondition').val();
			var data = ({
				keyword: keyword,
				option: option
			})
			
			$.ajax({
				type: 'POST',
				url: url,
				contentType: 'application/json;charset=utf-8',
				data: JSON.stringify(data),
				success: function(result){
					tsp05100_list_Grid(result, colNames);
				},
				error: function(){
					$.iGrowl({
						title: '페이지로딩을 실패했습니다.',
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
		}//listSC
		

		//추가수정구분지어줄 변수하나만들기@@@@@@@@@@@@@@@
		var seq_noSep = 0;
		
		//산업안전보건법 리스트 그리드
		function tsp05100_list_Grid(data, colNames){
			$('#listT').jqGrid('GridUnload');
			$('#listT').jqGrid({
				datatype:'local',
				data:data,
				height:300,
				width:565,
				colNames:['등록일','등록자사번','등록자',colNames,'seq_no'],
				colModel:[
					{name: 'erl_dy', index:'erl_dy', align:'center'},
					{name: 'erl_sabun', index:'erl_sabun', align:'center'},
					{name: 'name', index:'name', align:'center'},
					{name: 'law_file', index:'law_file'},
					{name: 'seq_no', index:'seq_no', hidden:true, key:true}
				],
				rowNum:13,
				multiselect:false,
				pager:'#pager',
				sortorder:'desc',
				emptyrecode:'데이터없음',
				onSelectRow: function(seq_no){	
					if($('.btnControl3').css('display','none')){
						$('.btnControl2').css('display','inline-block');
						$('.btnControl3').css('display','inline-block');				
					}
					
					if($('#law_file_txt').attr('class','formControl')){
						$('#law_file_txt').attr('class','formControl2')
					}
					
					//클식시 상세정보 띄우기
					$.ajax({
						type:'POST',
						url:'/tsp05100/read',
						contentType:'application/json;charset=utf=8',
						data:JSON.stringify({seq_no:seq_no}),
						success:function(result){
							$('#erl_dy').val(result.erl_dy);
							$('#name').val(result.name);
							$('#law_file_txt').val(result.law_file);
							$('#law_file_ps').val(result.law_file_ps)
							$('#erl_sabun').val(result.erl_sabun);
							seq_noSep = result.seq_no;
						},
						error:function(){
							$.iGrowl({
								title: '페이지로딩을 실패했습니다.',
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
				}//ondblClickRow
			})//grid
		}//tsp05100_list_Grid
		
		//작성하기(wrtBtn): 누르면 input상자 값 비우기  
		$('#wrtBtn').on('click', function(){
			seq_noSep = 0;
			
			if($('.btnControl2').css('display','none')){
				$('.btnControl2').css('display','inline-block');
				$('.btnControl3').css('display','none');				
			}
			
			if($('#law_file_txt').attr('class','formControl2')){
				$('#law_file_txt').attr('class','formControl')
			}
			$('#erl_sabun').val('');
			$.ajax({
				type:'POST',
				url:'/tsp05100/wrt',
				success:function(result){
					$('#erl_dy').val(new Date().toISOString().slice(0, 10));
					$('#name').val(result.name);
					$('#law_file_txt').val('');
					$('#law_file').val('');
				},
				error: function(){
					$.iGrowl({
						title: '글작성이 불가능합니다.',
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
		})//wrtBtn
		
		//저장하기(addBtn): 데이터저장 
		$('#addBtn').on('click', function(){
			confirms('저장하시겠습니까?', 'ADD');
		})
		
		function add(){
			if($('#erl_dy').val() == "" || $('#name').val() == ""){
				$.iGrowl({
					title: "등록일, 등록자를 작성해주세요.",
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
			
			if($('.btnControl2').css('display','none')){
				$('.btnControl2').css('display','inline-block');
				$('.btnControl3').css('display','none');				
			}
			
			if($('#law_file_txt').attr('class','formControl2')){
				$('#law_file_txt').attr('class','formControl')
			}
			
			var seq_no1 = seq_noSep
			var law_file_txt = $('#law_file_txt').val();
			var law_file_ps = $('#law_file_ps').val();
			
			var formData = new FormData($('#frm')[0])
			formData.append("seq_no",seq_no1);
			formData.append("law_file_txt",law_file_txt);
			formData.append("law_file_ps",law_file_ps);
			
			
			$.ajax({
				type:'POST',
				url:'/tsp05100/add',
				data: formData,
				contentType:false,
				processData:false,
				success: function(result){
					$.iGrowl({
						title: "글이 작성되었습니다.",
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
						animHide: 'fadeOutUp'
					});//iGrowl
					$('#erl_dy').val('');
					$('#name').val('');
					$('#law_file').val('');
					$('#law_file_txt').val('');
					$('#erl_sabun').val('');
					
					if(gubun == 1){
						listSC(url1, colNames1);
					}else if(gubun == 2){
						listSC(url2, colNames2);
					}else{
						listSC(url3, colNames3);
					}
				},
				error: function(){
					$.iGrowl({
						title: "글저장을 실패했습니다.",
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
		
		//삭제하기(delBtn)
		$('#delBtn').on('click', function(){
			confirms('삭제하시겠습니까?', 'DEL');
		})//delBtn
		
		function del(){
			if($('.btnControl2').css('display','blcok')){
				$('.btnControl2').css('display','inline-block');
				$('.btnControl3').css('display','none');				
			}
			
			if($('#law_file_txt').attr('class','formControl2')){
				$('#law_file_txt').attr('class','formControl')
			}
			
			var rowId = $('#listT').getGridParam('selrow');
			
			if(rowId == null){
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
			} else{
				var data = ({
					seq_no: rowId,
				})
				
				$.ajax({
					type:'POST',
					url:'/tsp05100/del',
					contentType:'application/json;charset=utf-8',
					data:JSON.stringify(data),
					success:function(result){
						$.iGrowl({
							title: "글이 삭제되었습니다.",
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
						})
						$('#erl_dy').val('');
						$('#name').val('');
						$('#law_file_txt').val('');
						if(gubun == 1){
							listSC(url1, colNames1);
						}else if(gubun == 2){
							listSC(url2, colNames2);
						}else{
							listSC(url3, colNames3);
						}
					},
					error:function(){
						$.iGrowl({
							title: "글삭제를 실패했습니다.",
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
						})
					}
				})//ajax
			}//if-else		
		}
		
		//파일 다운로드
		$('#fileDownload').on('click', function(){
			var law_file =$('#law_file_txt').val();
			var law_file_ps =$('#law_file_ps').val();
			
			if(law_file != ""){
				$('#fileDownload').attr('href', '/tsp05100/fileDownload?law_file=' + law_file + '&law_file_ps=' + law_file_ps);			
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
				
				return false;
			}
		})
		
		$('#fileDelBtn').on('click', function(){
			$('#law_file_txt').val('');
		})
		
		//등록자검색버튼(scUserBtn) 모달창켜기
		$('#modalBtn').on('click', function(){
			$('.tsp05100_modal').dialog('open');
			uList();
		})
		
		//상세 모달창 dialog
		$('.tsp05100_modal').dialog({
			autoOpen:false,
			modal:true,
			title:'사용자 검색',
			width:1030,
			height:475,
			show : 'slide',
			hide : 'slide',
			"position" : {
	            my	: "center",
	            at	: "center"
	     	}
		});//dialog
		
		//모달창 검색(마우스)
		$('.tsp05100_modal #scBtn').on('click', function(){
			uList();
		})
		
		//모달창 검색(엔터키)
		function enterkey2() {
	        if (window.event.keyCode == 13) {			
				uList();
	        }
		}
		
		//등록자검색버튼 모달창 리스트 함수
		function uList(){
			var keyword = $('#keyword2').val();
			var data = ({
				keyword: keyword
			})

			$.ajax({
				type:'POST',
				url:'/tsp05100/uListSC',
				contentType:'application/json;charset=utf-8',
				data: JSON.stringify(data),
				success: function(result){
					tsp05100_uList_Grid(result);
				},
				error: function(){
					$.iGrowl({
						title: '페이지로딩을 실패했습니다.',
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
		}//uList
		
		//등록자검색버튼(scUserBtn) jqgrid
		function tsp05100_uList_Grid(data){
 			$('#uListT').jqGrid('GridUnload');
			$('#uListT').jqGrid({
				datatype: 'local',
	       		data: data,
				height: 220,
				width: 960,
				colNames:['사번', '이름', '직급', '사업부명', '부서명','전화번호'],
				colModel:[
					{name:'sabun', index:'sabun', align:'center'},
					{name:'name', index:'name', align:'center', key:true},
					{name:'level', index:'level', align:'center'},
					{name:'sa_nm', index:'sa_nm', align:'left'},
					{name:'dept_nm', index:'dept_nm', align:'center'},
					{name:'hp_no', index:'hp_no', align:'center'},
				],
				rowNum:10,
				multiselect:false,
				pager:'#pager3',
				sortorder:'desc',
				emptyrecode:'데이터없음',
				ondblClickRow:function(){
					var rowid = $("#uListT").getGridParam("selrow");
					var selRowData = $("#uListT").getRowData(rowid);
					$('#name').val(rowid);
					$('#erl_dy').val(new Date().toISOString().slice(0, 10));
					$('#erl_sabun').val(selRowData.sabun)
					$('.tsp05100_modal #keyword2').val('');
					$('.tsp05100_modal').dialog('close');
				}//ondblClickRow
			})//jqGrid
		}//tsp05100_uList_Grid
		
		
		
		//첨부파일 커스텀 버튼연결
		$("#law_file").on('change',function(){
		  var fileName = $("#law_file").val();
		  $("#law_file_txt").val(fileName);
		});
		
		//confirm창
		function confirms(message, action){
			$('.popup-cont').find("p").remove();
			
			var p = $(document.createElement("p"));
			p.html(message.replace("\n", "<br>"));
			
			$('.popup-cont').append(p);
			$('#confirmPopUp').addClass("active");
			
			$('#confirmPopupYes').unbind('click');
			$("#confirmPopupYes").click(function(){
			$('#confirmPopUp').removeClass("active");
				
				if (typeof confirmYes != 'undefined' && $.isFunction(confirmYes)) {
					confirmYes(action);
				}
			});
			
			$('#confirmPopupNo').unbind('click');
			$("#confirmPopupNo").click(function(){
			$('#confirmPopUp').removeClass("active");
				
				if (typeof confirmNo != 'undefined' && $.isFunction(confirmNo)) {
					confirmNo(action);
				}
			});
		}
		
		
		
		function confirmYes(action){
			if(action == 'ADD'){
				add();
			}else if(action == 'DEL'){
				del();
			}
		};
		
		function confirmNo(action){
			//dialog끄기
		};
		
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