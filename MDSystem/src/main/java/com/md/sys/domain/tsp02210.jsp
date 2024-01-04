<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="<c:url value='/css/tsp02210.css'/>">
<!-- jquery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<!-- igrowl -->
<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/public/stylesheets/icomoon/vicons.css">
<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/public/stylesheets/icomoon/feather.css">
<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/public/stylesheets/icomoon/steadysets.css">
<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/public/stylesheets/icomoon/linecons.css">
<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/public/stylesheets/animate.css">
<link rel="stylesheet" href="/igrowl/catc-iGrowl-3232c92/dist/css/igrowl.min.css">
<script src="/igrowl/catc-iGrowl-3232c92/dist/js/igrowl.min.js"></script>

<!-- tabulator script -->
<script type="text/javascript" src="https://unpkg.com/tabulator-tables@5.4.4/dist/js/tabulator.min.js"></script>
<!-- tabulator css -->
<link href="https://unpkg.com/tabulator-tables@5.4.4/dist/css/tabulator_semanticui.min.css" rel="stylesheet">
</head>
<body>
	<div class="contents_wrap_tsp02210_page">

		<div class="page-title-wrap">
			<h2>안전법규및규정</h2>
			<ul>
				<a href="#" id="tab1"><li>위험성평가</li></a>
				<a href="#" id="tab2"><li>기타평가방법</li></a>
			</ul>
		</div>
		<!-- page-title-wrap -->

		<div class="search_wrap_active">

			<div class="sch_box">
				<ul>
					<li class="sc1">
						<sapn class="txtControl">공정 : </sapn> 
						<select name="option" id="option">
								<option value="">---공정분류---</option>
								<option value="F0001" ${sc.option=='j' ? "selected" : ""}>조립공정</option>
								<option value="F0002" ${sc.option=='s' ? "selected" : ""}>생산공정</option>
								<option value="F0003" ${sc.option=='p' ? "selected" : ""}>포장공정</option>
						</select>
					</li>
					<li class="sc2">
						<sapn class="txtControl">평가일 : </sapn> 
						<input type="date" class="formControl" id="str_date" name="str_date" value="${sc.keyword}">
						~
						<input type="date"class="formControl" id="end_date" name="end_date" value="${sc.keyword}"></li>
					<li class="sc3">
						<input type="radio" id="all" name="option2"  value="all"/> 
						<label for="all" class="txtControl">전체</label>
						
						<input type="radio" id="nMng" name="option2" value="mng_yn"/>
						<label for="do" class="txtControl">미조치</label>
						
						<input type="radio" id="nCmp" name="option2" value="cmp_yn" onkeyup="enterkey();"/>
						<label for="ndo" class="txtControl">미완료</label>
					</li>
					<li class="sc4">
						<button type="button" class="btnControl" id="scBtn">
							<i class="fa-solid fa-magnifying-glass"></i> 조회
						</button>
					</li>
				</ul>
			</div>
			<!-- sch-box -->

		</div>
		<!-- search-wrap-active -->

		<div class="tsp02210_container">
			<section class="tsp02210_list">
				<div class="title_wrap">
					<div class="title_zone">
						<h2>위험성평가</h2>
						<h2 style="display:none;">기타평가방법</h2>
					</div>

					<div class="btn_right_box">
						<button class="btnControl" id="wrtBtn">신규</button>
						<button class="btnControl" id="modBtn">수정</button>
						<button class="btnControl" id="delBtn">삭제</button>
					</div>
				</div><!-- title_zone -->
				<div class="table_wrap">
					<table id="listT"></table>
					<div id="pager"></div>
				</div><!-- table_wrap -->
			</section><!-- tsp02210_list -->
		</div><!-- tsp02210_container -->
		
		
		<!-- 모달창 -->
		
		<!-- 작성/수정/상세모달창 -->
			<div class="tsp02210_modal" style="display:none;">
				<div class="tsp02210_modal_box">
					<div class="table_wrap">
						<form id="frm">
							<table class="table">
									<tr>
										<th>공정<i>*</i></th>
										<td>
											<select class="formControl" id="cd_prs" name="cd_prs"></select>
										</td>
										<th>세부작업<i>*</i></th>
										<td>
											<input type="text" class="formControl" id="det_job" name="det_job"/>
										</td>
									</tr>
									<tr>
										<th>유해위험분류<i>*</i></th>
										<td>
											<select class="formControl" id="cd_risk_cls" name="cd_risk_cls"></select>
										</td>
										<th>관련근거</th>
										<td>
											<input type="text" class="formControl" id="basis" name="basis"/>
										</td>
									</tr>
									<tr>
										<th>위험요인 및 재해형태</th>
										<td colspan="3">
											<input type="text" class="formControl2" id="rsk_item_type" name="rsk_item_type"/>
										</td>
									</tr>
									<tr>
										<th>현재 안전보건조치</th>
										<td>
											<input type="text" class="formControl" id="cut_sft_act" name="cut_sft_act"/>
										</td>
										<th>현장참여근로자</th>
										<td>
											<input type="text" class="formControl" id="loc_ptn_psn" name="loc_ptn_psn"/>
										</td>
									</tr>
									<tr>
										<th>기능성(빈도)</th>
										<td>
											<input type="text" class="formControl" id="func" name="func"/>
										</td>
										<th>중대성(강도)</th>
										<td>
											<input type="text" class="formControl" id="imprtn" name="imprtn"/>
										</td>
									</tr>
									<tr>
										<th>평가척도</th>
										<td>
											<input type="text" class="formControl" id="evl_std" name="evl_std"/>
										</td>
										<th>위험성</th>
										<td>
											<input type="text" class="formControl" id="risk" name="risk"/>
										</td>
									</tr>
									<tr>
										<th>(외부)평가자</th>
										<td>
											<input type="text" class="formControl" id="evl_chg" name="evl_chg"/>
										</td>
										<th>평가(완료)일<i>*</i></th>
										<td>
											<input type="date" class="formControl" id="evlcm_dy" name="evlcm_dy"/>
										</td>
									</tr>
									<tr>
										<th>위험요인 파악</th>
										<td>
											<input type="text" class="formControl" id="rsk_item" name="rsk_item"/>
										</td>
										<th>개선대책</th>
										<td>
											<input type="text" class="formControl" id="rec_pln" name="rec_pln"/>
										</td>
									</tr>
									<tr>
										<th>위험성 허용 여부</th>
										<td>
											<input type="radio" class="radioControl" id="rsk_ok_yn1" name="rsk_ok_yn" value="Y"/>
											<label for="rsk_ok_yn1">허용</label>
											<input type="radio" class="radioControl" id="rsk_ok_yn2" name="rsk_ok_yn" value="N"/>
											<label for="rsk_ok_yn2">조치필요</label>
										</td>
										<th>허용기준</th>
										<td>
											<input type="text" class="formControl" id="perm_std" name="perm_std"/>
										</td>
									</tr>
									<tr>
										<th>위험요인 통제 방안</th>
										<td colspan="3">
											<input type="radio" class="radioControl" id="cd_risk_mng1" name="cd_risk_mng" value="T0001"/>
											<label for="cd_risk_mng1">제거</label>
											<input type="radio" class="radioControl" id="cd_risk_mng2" name="cd_risk_mng" value="T0002"/>
											<label for="cd_risk_mng2">대체</label>
											<input type="radio" class="radioControl" id="cd_risk_mng3" name="cd_risk_mng" value="T0003"/>
											<label for="cd_risk_mng3">공학적통제</label>
											<input type="radio" class="radioControl" id="cd_risk_mng4" name="cd_risk_mng" value="T0004"/>
											<label for="cd_risk_mng4">행정적통제</label>
											<input type="radio" class="radioControl" id="cd_risk_mng5" name="cd_risk_mng" value="T0005"/>
											<label for="cd_risk_mng5">개인보호구(PPE)</label>
										</td>
									</tr>
									<tr>
										<th>위험요인 통제 방안 내용</th>
										<td colspan="3">
											<input type="text" class="formControl2" id="rsk_ctl_cnt" name="rsk_ctl_cnt"/>
										</td>
									</tr>
									<tr>
										<th>위험성 보고서</th>
										<td colspan="3">
											<input type="text" class="formControl4" id="rsk_file_txt" placeholder="첨부파일" readonly/>
											<input type="hidden" id="rsk_file_ps"/>
											<label class="btnControl3" for="rsk_file" >
												<i class="fa-solid fa-upload" style="color: #ffffff;"></i>
											</label>
											<a id="fileDownload">
												<label class="btnControl4">
													<i class="fa-solid fa-download" style="color: #ffffff;"></i>
												</label>
											</a>
											<input type="file" class="formControl5" id="rsk_file" name="file1"/>	
										</td>
									</tr>
									<tr>
										<th>조치자</th>
										<td>
											<input type="text" class="formControl" id="mng_sabun" name="mng_sabun"/>
										</td>
										<th>조치일</th>
										<td>
											<input type="date" class="formControl" id="mng_dy" name="mng_dy"/>
										</td>
									</tr>
									<tr>
										<th>조치후 위험성</th>
										<td>
											<input type="text" class="formControl" id="mng_risk" name="mng_risk"/>
										</td>
										<th>조치후 위험성 수준</th>
										<td>
											<input type="text" class="formControl" id="mng_risk_lev" name="mng_risk_lev"/>
										</td>
									</tr>
									<tr>
										<th>위험성 조치완료 보고서</th>
										<td>
											<input type="text" class="formControl3" id="rskok_file_txt" placeholder="첨부파일" readonly/>
											<input type="hidden" id="rskok_file_ps"/>
											<label class="btnControl3" for="rskok_file">
												<i class="fa-solid fa-upload" style="color: #ffffff;"></i>
											</label>
											<a id="fileDownload2">
												<label class="btnControl4">
													<i class="fa-solid fa-download" style="color: #ffffff;"></i>
												</label>
											</a>
											<input type="file" class="formControl5" id="rskok_file" name="file2"/>
										</td>
										<th>완료일</th>
										<td>
											<input type="date" class="formControl" id="cmp_dy" name="cmp_dy"/>
										</td>
									</tr>
							</table><!-- table -->
						</form><!-- frm -->
					</div><!-- table_wrap -->
				</div><!-- tsp02210_modal_box -->
			</div><!-- tsp02210_modal -->
		
		
		
		
	</div><!-- contents-wrap_tap02210-page -->
	<script type="text/javascript">
	
	//작성+수정 구분자
	var seq_noSeq = 0;
	var gubun = 1;
	 // $(document).ready(function(){ });와 동일한 의미 웹이 시작할때 같이 시작됨
	$(function() {
		listSC1();
	});
	 
	function enterkey() {
        if (window.event.keyCode == 13) {
        	listSC1();
        }
	}
	 
	//페이지로딩시 날짜 계산하는 함수
	$(document).ready(function(){
		var date = new Date();
		var firstDay = new Date(date.getFullYear(), date.getMonth(), 2);
		var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 1);
		var str_date = firstDay.toISOString().slice(0, 10);
		var end_date = lastDay.toISOString().slice(0, 10);

		$('#str_date').val(str_date);
		$('#end_date').val(end_date);
		
		if(gubun == 1){			
			$('#tab1').css('color', '#fff');
			$('#tab1').css('background-color', '#474757');
		}
		
		$('input:radio[name="option2"]:radio[value="all"]').prop('checked', true);
		
		//코드테이블에 있는만큼 select list만들기
		commonCodeSelectAdd('cd_prs', getCommonCode('F0000'))
		commonCodeSelectAdd('cd_risk_cls', getCommonCode('D0000'))
	})
	
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
	
	//최초 데이터불러오는함수
	function listSC1(){
		var str_date = '1900-01-01';
		var end_date = '9999-01-01';
		var data = ({
			str_date:str_date,
			end_date:end_date
		})
		
		$.ajax({
			type:'POST',
			url:'/tsp02210/listSC',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			success:function(result){
				table(result);					
			},
			error:function(){
				$.iGrowl({
					title: "조회를 실패했습니다.",
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
	}//listSC1
	
	//tabulator
	function table(data){ 
		table = new Tabulator("#listT", { // id:test에 Tabulator 생성 
			layout : "fitData", // 테이블 크기에 컬럼을 딱 맞추는 기능 
			columnHeaderVertAlign : "middle",
			pagination:"local",
		    paginationSize:5,
			selectable:1,
			height: "100%",
			columns : [ {
				title : "위험성평가",
				headerHozAlign: "center",
				headerSort : false,
				columns : [
				{
					title : "세부작업", // 테이블 header 네임 
					field : "det_job", // controller에서 받아온 Map 데이터의 string 이름  
					headerHozAlign: "center",
					hozAlign : "center",
					headerSort : false,
					sorter : "string" // controller에서 받아 와서 적용할 데이터 타입  
				}, 
				{
					title : "유해 위험요인 파악",
					headerHozAlign: "center",
					headerSort : false,
					columns : [{
						title : "위험요인분류",
						field : "cd_risk_cls",
						headerHozAlign: "center",
						hozAlign : "center",
						headerSort : false,
						sorter : "string"
					}, {
						title : "위험발생상황 및 결과",
						width : "300",
						field : "rsk_item_type",
						headerSort : false,
						headerHozAlign: "center",
						hozAlign : "center",
						sorter : "string",
					} ]

				}, {
					title : "관련근거",
					field : "basis",
					headerSort : false,
					headerHozAlign: "center",
					hozAlign : "center",
					sorter : "string"
				}, {
					title : "현재의안전보건조치",
					field : "cut_sft_act",
					headerSort : false,
					headerHozAlign: "center",
					hozAlign : "center",
					sorter : "string"
				}, {
					title : "위험성",
					headerHozAlign: "center",
					headerSort : false,
					columns : [ {
						title : "가능성(빈도)",
						field : "func",
						headerSort : false,
						headerHozAlign: "center",
						hozAlign : "center",
						sorter : "string",
						width : "80"
					}, {
						title : "중대성(강도)",
						field : "imprtn",
						headerSort : false,
						headerHozAlign: "center",
						hozAlign : "center",
						sorter : "string",
						width : "80"
					}, {
						title : "위험성",
						field : "risk",
						headerSort : false,
						headerHozAlign: "center",
						hozAlign : "center",
						sorter : "string",
						width : "80"
					} ]
				}, {
					title : "위험요인 통제방안",
					field : "rsk_ctl_cnt",
					width : "200",
					headerSort : false,
					headerHozAlign: "center",
					hozAlign : "center",
					sorter : "string"
				},

				{
					title : "개선후위험성",
					field : "mng_risk",
					headerSort : false,
					headerHozAlign: "center",
					hozAlign : "center",
					sorter : "string"
				},

				{
					title : "평가일",
					field : "evlcm_dy",
					headerSort : false,
					headerHozAlign: "center",
					hozAlign : "center",
					sorter : "string"
				},

				{
					title : "조치일",
					field : "mng_dy",
					headerSort : false,
					headerHozAlign: "center",
					hozAlign : "center",
					sorter : "string"
				},

				{
					title : "완료일",
					field : "cmp_dy",
					headerSort : false,
					headerHozAlign: "center",
					hozAlign : "center",
					sorter : "string"
				},

				{
					title : "조치자",
					field : "mng_sabun",
					headerSort : false,
					headerHozAlign: "center",
					hozAlign : "center",
					sorter : "string"
				},
				{	
					field : "mng_yn",
					visible : false
				},{
					field : "cmp_yn",
					visible : false
				}]
			} ]

		}); // Tabulator 생성 설정
		
		// table.on: table이 무슨 작업을 할때 실행한다는 뜻
		
		//tableBuilt : 최초 테이블에 정보를 담을때 사용
		table.on("tableBuilt", function() { 
			table.setData(data); // 설정한 url에 ajax요청을 보내 값을 가져온후 테이블에 값 적용
		});//tableBuilt
		
		
		//위험성평가 글삭제+글수정모달창 구분할 번호지정
		//rowClick: 클릭시 이벤트지정
		table.on('rowClick', function(e, row){
			seq_noSeq = row.getData().seq_no;
		});//rowClick
		
		
		//위험성평가 글삭제+글수정모달창 구분할 번호지정
		//rowSelected: rowFomatter로 생성한 체크박스 클릭시 이벤트지정
		/* table.on('rowSelected', function(row){
			seq_noSeq = row.getData().SEQ_NO;
		}) */
		
		
		//위험성평가 상세보기
		//rowDblClick: 더블 클릭시 이벤트지정 
		table.on('rowDblClick', function(e, row){
			var seq_no2 = row.getData().seq_no;
			var data = ({
				seq_no:seq_no2
			})
			
			
			modal('위험성평가 상세', '상세');
			
			$('.formControl').attr("disabled",true); 
			$('.formControl2').attr("disabled",true); 
			$('.formControl3').attr("disabled",true); 
			$('.formControl4').attr("disabled",true); 
			$('.formControl5').attr("disabled",true);
			$('input:radio[name="cd_risk_mng"]').attr('disabled', true);
			$('input:radio[name="rsk_ok_yn"]').attr('disabled', true);
			
			if($('.btnControl3').css('display','none')){
				$('.btnControl3').css('display','none');
				$('.btnControl4').css('display','inline-block');
			}
			
			
			
			$.ajax({
				type:'POST',
				url:'/tsp02210/read',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify(data),
				success:function(result){
					read(result);
				},
				error:function(){
					$.iGrowl({
						title: "상세보기페이지 로딩을 실패했습니다.",
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
		});//rowDblClick
		
		
		
	}//table
	
	
	//위험성평가 상세 데이터를 폼벨류에넣는 함수
	function read(data){
		$('#evlcm_dy').val(data.evlcm_dy);
		$('#cd_prs').val(data.cd_prs);
		$('#det_job').val(data.det_job);
		$('#cd_risk_cls').val(data.cd_risk_cls);
		$('#basis').val(data.basis);
		$('#rsk_item_type').val(data.rsk_item_type);
		$('#cut_sft_act').val(data.cut_sft_act);
		$('#loc_ptn_psn').val(data.loc_ptn_psn);
		$('#func').val(data.func);  
		$('#imprtn').val(data.imprtn); //10
		$('#evl_std').val(data.evl_std);
		$('#risk').val(data.risk);
		$('#evl_chg').val(data.evl_chg);
		$('#rsk_item').val(data.rsk_item);
		$('#rec_pln').val(data.rec_pln);
		if(data.rsk_ok_yn == 'Y'){			
			$('input:radio[name="rsk_ok_yn"]:radio[value="Y"]').prop('checked', true);
		}else{
			$('input:radio[name="rsk_ok_yn"]:radio[value="N"]').prop('checked', true);		
		}
		$('#perm_std').val(data.perm_std);
		if(data.cd_risk_mng == 'T0001'){
			$('input:radio[name="cd_risk_mng"]:radio[value="T0001"]').prop('checked', true);			
		}else if(data.cd_risk_mng == 'T0002'){
			$('input:radio[name="cd_risk_mng"]:radio[value="T0002"]').prop('checked', true);			
		}else if(data.cd_risk_mng == 'T0003'){
			$('input:radio[name="cd_risk_mng"]:radio[value="T0003"]').prop('checked', true);			
		}else if(data.cd_risk_mng == 'T0004'){
			$('input:radio[name="cd_risk_mng"]:radio[value="T0004"]').prop('checked', true);			
		}else{
			$('input:radio[name="cd_risk_mng"]:radio[value="T0005"]').prop('checked', true);						
		}
		$('#rsk_ctl_cnt').val(data.rsk_ctl_cnt);
		$('#mng_sabun').val(data.mng_sabun); //20
		$('#mng_dy').val(data.mng_dy);  
		$('#mng_risk').val(data.mng_risk);
		$('#mng_risk_lev').val(data.mng_risk_lev);
		$('#cmp_dy').val(data.cmp_dy); //26
		
		$('#rsk_file_txt').val(data.rsk_file);
		$('#rskok_file_txt').val(data.rskok_file); 
	}//read
	
	
	//신규모달창버튼
	$('#wrtBtn').on('click', function(){
		table.deselectRow();
		$('.formControl').attr("disabled",false); 
		$('.formControl2').attr("disabled",false); 
		$('.formControl3').attr("disabled",true); 
		$('.formControl4').attr("disabled",true); 
		$('.formControl5').attr("disabled",false); 
		$('input:radio[name="cd_risk_mng"]').attr('disabled', false);
		$('input:radio[name="rsk_ok_yn"]').attr('disabled', false);
		
		if($('.btnControl3').css('display','none')){
			$('.btnControl3').css('display','inline-block');
			$('.btnControl4').css('display','none');				
		}
		
		modal('위험성평가 신규', '신규');
		
		seq_noSeq = 0;
		
		$('#evlcm_dy').val('');
		$('#cd_prs').val('');
		$('#det_job').val('');
		$('#cd_risk_cls').val('');
		$('#basis').val('');
		$('#rsk_item_type').val('');
		$('#cut_sft_act').val('');
		$('#loc_ptn_psn').val('');
		$('#func').val('');  
		$('#imprtn').val(''); //10
		$('#evl_std').val('');
		$('#risk').val('');
		$('#evl_chg').val('');
		$('#rsk_item').val('');
		$('#rec_pln').val('');
		$('input:radio[name=rsk_ok_yn]').prop('checked', false);
		$('#perm_std').val('');
		$('input:radio[name=cd_risk_mng]').prop('checked', false);
		$('#rsk_ctl_cnt').val('');
		$('#mng_sabun').val(''); //20
		$('#mng_dy').val('');  
		$('#mng_risk').val('');
		$('#mng_risk_lev').val('');
		$('#rsk_file').val('');
		$('#rskok_file').val('');
		$('#cmp_dy').val(''); //26
		
		
		$('#rsk_file_txt').val('');
		$('#rskok_file_txt').val('');
		

	})
		
	//수정모달창버튼
	$('#modBtn').on('click', function(){
		var seq_no = seq_noSeq
		if(seq_no == 0){
			$.iGrowl({
				title: "수정할 글을 선택해주세요.",
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
		var data = ({
			seq_no:seq_no
		})	
		$('.formControl').attr("disabled",false); 
		$('.formControl2').attr("disabled",false); 
		$('.formControl3').attr("disabled",true); 
		$('.formControl4').attr("disabled",true); 
		$('.formControl5').attr("disabled",false); 
		$('#cd_prs').attr("disabled",true);
		$('#det_job').attr("disabled",true);
		$('#cd_risk_cls').attr("disabled",true);
		$('input:radio[name="cd_risk_mng"]').attr('disabled', false);
		$('input:radio[name="rsk_ok_yn"]').attr('disabled', false);
		
		if($('.btnControl3').css('display','none')){
			$('.btnControl3').css('display','inline-block');
			$('.btnControl4').css('display','none');				
		}
		
		modal('위험성평가 수정', '수정');
		
		$.ajax({
			type:'POST',
			url:'/tsp02210/read',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			success:function(result){
				read(result);
			},
			error:function(){
				$.iGrowl({
					title: "수정페이지 로딩을 실패했습니다.",
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
	})//modBtn
	
	//모달창 dialog
	function modal(title, option){
		if(option == '상세'){
			$('.tsp02210_modal').dialog({
				modal:true,
				title: title,
				width:1000,
				height:710,
				show : 'slide',
				hide : 'slide',
				"position" : {
		               my	: "center",
		               at	: "center"
		        },
		        closeOnEscape: false,
		        open: function(event, ui) { 
		           $(".ui-dialog-titlebar-close", $(this).parent()).hide();
		        },
		        buttons: {
	        		"닫기" : function() {
	        			seq_noSeq = 0;
	        			table.deselectRow();
		   				$(this).dialog('close');
		   			}  
		   		}//button
			});//dialog
		}else {
			$('.tsp02210_modal').dialog({
				modal:true,
				title: title,
				width:1000,
				height:710,
				show : 'slide',
				hide : 'slide',
				"position" : {
		               my	: "center",
		               at	: "center"
		        },
		        buttons: {
	        		"저장" : function() {
		   				if(Check() == false){
		   					return;
		   				}
		   				addBtn();
		   				table.deselectRow();
		   				$(this).dialog('close');
		   			},
		   			"닫기" : function() {
	        			seq_noSeq = 0;
	        			table.deselectRow();
		   				$(this).dialog('close');
		   			}  
		   			
		   		}//button
			});//dialog
		}
		$('.tsp02210_modal').dialog('open');
	}
	
	//위험성평가 저장하기(addBtn)
	function addBtn(){
			$('.formControl').attr("disabled",false); 
			$('.formControl2').attr("disabled",false); 
			$('.formControl3').attr("disabled",false); 
			$('.formControl4').attr("disabled",false); 
			$('.formControl5').attr("disabled",false); 
		
		var seq_no = seq_noSeq;  //seq_noSeq가 0이면 신규 다른번호면 수정   //27
		var rsk_file_txt = $('#rsk_file_txt').val();
		var rsk_file_ps = $('#rsk_file_ps').val();
		var rskok_file_txt = $('#rskok_file_txt').val();
		var rskok_file_ps = $('#rskok_file_ps').val();
		
		var formData = new FormData($('#frm')[0]);
		formData.append("seq_no", seq_no);
		formData.append("rsk_file_txt", rsk_file_txt);
		formData.append("rsk_file_ps", rsk_file_ps);
		formData.append("rskok_file_txt", rskok_file_txt);
		formData.append("rskok_file_ps", rskok_file_ps);
		
		$.ajax({
			type:'POST',
			url:'/tsp02210/add',
			data: formData,
			enctype: 'multipart/form-data',
			contentType:false,
			processData:false,
			success:function(result){
				$.iGrowl({
					title: "글 저장을 성공했습니다.",
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
			error:function(){
				$.iGrowl({
					title: "글 저장을 실패했습니다.",
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
			},
			complete:function(){
				listSC2();
			}
		})//ajax
	}//addBtn
	
	//삭제버튼
	$('#delBtn').on('click', function(){
		var seq_no = seq_noSeq
		if(seq_no == 0){
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
			var data = ({
				seq_no:seq_no
			})	
			$.ajax({
				type:'POST',
				url:'/tsp02210/del',
				contentType:'application/json;charset=utf-8',
				data:JSON.stringify({seq_no : seq_no}),
				success:function(result){
					$.iGrowl({
						title: '선택하신 글을 삭제했습니다.',
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
				error:function(){
					$.iGrowl({
						title: '선택하신 글삭제를 실패했습니다.',
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
				},
				complete:function(){
					listSC2();
				}
			})//ajax
		}//if-else
	})//delBtn
	
	//저장+삭제시 데이터 불러오는함수
	function listSC2(){
		var str_date = '1900-01-01';
		var end_date = '9999-01-01';
		var data = ({
			str_date:str_date,
			end_date:end_date
		})
		
		$.ajax({
			type:'POST',
			url:'/tsp02210/listSC',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			success:function(result){
				table.setData(result)
			},
			error:function(){
				$.iGrowl({
					title: '조회를 실패했습니다.',
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
	}//listSC2
	
	
	//모달창캔슬버튼
	$('#cancelBtn').on('click', function(){
		if($('.modal1').css('display','block')){
			$('.modal1').css('display','none');
			$('.tsp02210_modal').css('display','none');
			$('#wrtTitle').css('display','none');
			$('#modTitle').css('display','none');
			$('#readTitle').css('display','none');
			$('#addBtn').css('display','block');
			$('.formControl').attr("disabled",false); 
			$('.formControl2').attr("disabled",false); 
			$('.formControl3').attr("disabled",false); 
			$('.formControl4').attr("disabled",false); 
			$('.formControl5').attr("disabled",false); 
		}
		
		$('#evlcm_dy').val('');
		$('#cd_prs').val('');
		$('#det_job').val('');
		$('#cd_risk_cls').val('');
		$('#basis').val('');
		$('#rsk_item_type').val('');
		$('#cut_sft_act').val('');
		$('#loc_ptn_psn').val('');
		$('#func').val('');  
		$('#imprtn').val(''); //10
		$('#evl_std').val('');
		$('#risk').val('');
		$('#evl_chg').val('');
		$('#rsk_item').val('');
		$('#rec_pln').val('');
		$('input:radio[name=rsk_ok_yn]').prop('checked', false);
		$('#perm_std').val('');
		$('input:radio[name=cd_risk_mng]').prop('checked', false);
		$('#rsk_ctl_cnt').val('');
		$('#mng_sabun').val(''); //20
		$('#mng_dy').val('');  
		$('#mng_risk').val('');
		$('#mng_risk_lev').val('');
		$('#rsk_file').val('');
		$('#rskok_file').val('');
		$('#cmp_dy').val(''); //26

		$('#rsk_file_txt').val('');
		$('#rskok_file_txt').val('');
	})
	
	//조회버튼 누르면 조회
	$('#scBtn').on('click', function(){
		var option = $('#option').val();
		var str_date = $('#str_date').val();
		var end_date = $('#end_date').val();
		var option2 = $('input[name=option2]:checked').val();
		var data = ({
			option:option,
			str_date:str_date,
			end_date:end_date,
			option2:option2
		})
		
		listSC(data);
	})//scBtn
	
	//검색 함수
	function listSC(data){
		$.ajax({
			type:'POST',
			url:'/tsp02210/listSC',
			contentType:'application/json;charset=utf-8',
			data:JSON.stringify(data),
			success:function(result){
				table.setData(result)
			},
			error:function(){
				$.iGrowl({
					title: '조회를 실패했습니다.',
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
			},
			complete:function(){
				
			}
		})//ajax
	}//listSC
	
	//파일 다운로드
	$('#fileDownload').on('click', function(){
		var rsk_file = $('#rsk_file_txt').val();
		var rsk_file_ps = $('#rsk_file_ps').val();
		console.log(rsk_file_ps)
		if(rsk_file != ""){
			$('#fileDownload').attr('href', '/tsp02210/fileDownload?rsk_file='+rsk_file + '&rsk_file_ps=' + rsk_file_ps)		
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
	
	//파일 다운로드2
	$('#fileDownload2').on('click', function(){
		var rskok_file =$('#rskok_file_txt').val();
		var rskok_file_ps =$('#rskok_file_ps').val();
		console.log(rskok_file_ps)
		if(rskok_file != ""){		
			$('#fileDownload2').attr('href', '/tsp02210/fileDownload2?rskok_file='+rskok_file + '&rskok_file_ps=' + rskok_file_ps)
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

	//첨부파일 커스텀 버튼연결
	$("#rsk_file").on('change',function(){
	  var fileName = $("#rsk_file").val();
	  $("#rsk_file_txt").val(fileName);
	});
	
	$("#rskok_file").on('change',function(){
	  var fileName = $("#rskok_file").val();
	  $("#rskok_file_txt").val(fileName);
	});
	
	
	function Check(){
		var cd_prs = $('#cd_prs')//공정
		var det_job = $('#det_job')//세부작업
		var cd_risk_cls = $('#cd_risk_cls')//위험요인분류
		var basis = $('#basis') //관련근거
		var rsk_item_type = $('#rsk_item_type')//위험요인 및 재해형태
		var cut_sft_act = $('#cut_sft_act')//현재 안전보건 조치
		var loc_ptn_psn = $('#loc_ptn_psn')//현장참여 근로자
		var func = $('#func')//기능성(빈도)
		var imprtn = $('#imprtn')//중대성(강도)
		var evl_std = $('#evl_std')//평가척도
		var risk = 	$('#risk')//위험성
		var evl_chg = 	$('#evl_chg')//외부평가자
		var evlcm_dy = $('#evlcm_dy')//평가일
		var rsk_item = $('#rsk_item')//위험요인파악
		var rec_pln = 	$('#rec_pln')//개선대책
		var rsk_ok_yn = $('input:radio[name=rsk_ok_yn]')//위험성 허용 여부
		var perm_std = 	$('#perm_std')//허용기준
		var cd_risk_mng = $('input:radio[name=cd_risk_mng]')//코드_위험요인 통제 방안
		var rsk_ctl_cnt = $('#rsk_ctl_cnt')//위험요인 통제 방안 내용
		var mng_sabun = $('#mng_sabun')//조치자 사번
		var mng_dy = $('#mng_dy')//조치일
		var mng_risk = $('#mng_risk')//조치후 위험성
		var mng_risk_lev = $('#mng_risk_lev')//조치후 위험성 수준
		var rsk_file = $('#rsk_file')//위험성 보고서 파일명
		var rskok_file = $('#rskok_file')//위험성 조치완료 보고서 파일명
		var cmp_dy = $('#cmp_dy')//완료일
		

		var det_jobChk = /^([가-힣ㄱ-ㅎ]|(.*[!@#$%^&*?_,/\s])){2,10}$/;	//세부작업30 기호넣을수 있게 하기!
		var basisChk = /^([가-힣ㄱ-ㅎ]|(.*[!@#$%^&*?_,/\s])){2,10}$/;	//관련근거30
		var loc_ptn_psnChk = /^[가-힣ㄱ]{2,4}$/;	//현장참여자100
		var funcChk = /^[1-9]{1}/;	//기능성 숫자
		var imprtnChk = /^[1-9]{1}/;	//중대성 숫자
		var evl_stdChk = /^[1-9]{1}x[1-9]{1}$/;	//평가척도20
		var riskChk = /^[가-힣ㄱ-ㅎ]{2}$/;	//위험성10
		var evl_chgChk = /^[가-힣ㄱ-ㅎ]{2,4}$/;	//외부평가자50
		var mng_riskChk = /[1-9]{1}$/;	//조치후 위험성10
		var mng_risk_levChk = /^[가-힣ㄱ-ㅎ]{2}$/;	//조치후 위험성수준10
		var mng_sabunChk = /^[0-9]{4}$/;	//조치자 사번
		
		//공정코드 공백검사
		if(cd_prs.val() == ""){
			$.iGrowl({
				title: "공정을 선택해주세요.",
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
	        cd_prs.focus();
	        return false;
	    }
		
		//세부작업 공백검사
		if(det_job.val() == ""){
			$.iGrowl({
				title: "세부작업을 작성해주세요.",
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
	        det_job.focus();
	        return false;
	    }
		
		//세부작업 유효성검사
		if(det_jobChk.test(det_job.val()) == false){
			$.iGrowl({
				title: '세부작업은 2~10자리 이내로 작성해주세요.',
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
			det_job.val() == "";
			det_job.focus();
			return false;
		}
		
		//위험요인분류공백검사
		if(cd_risk_cls.val() == ""){
			$.iGrowl({
				title: "위험요인분류를 선택해주세요.",
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
	        cd_risk_cls.focus();
	        return false;
	    }
		
		//관련근거 유효성검사
		if(basis.val() != "" && basisChk.test(basis.val()) == false){
			$.iGrowl({
				title: '관련근거는 2~10자리 이내로 작성해주세요.',
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
			basis.val() == "";
			basis.focus();
			return false;
		}
		
		//현장참여자 유효성검사
		if(loc_ptn_psn.val() != "" && loc_ptn_psnChk.test(loc_ptn_psn.val()) == false){
			$.iGrowl({
				title: '현장참여자 이름은 2~4자리로 작성해주세요.',
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
			loc_ptn_psn.val() == "";
			loc_ptn_psn.focus();
			return false;
		}
		
		//기능성(빈도) 유효성검사
		if(func.val() != "" && funcChk.test(func.val()) == false){
			$.iGrowl({
				title: '기능성(빈도)은 숫자로 작성해주세요.',
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
			func.val() == "";
			func.focus();
			return false;
		}
		
		//중대성(강도) 유효성검사
		if(imprtn.val() != "" && imprtnChk.test(imprtn.val()) == false){
			$.iGrowl({
				title: '중대성(강도)은 숫자로 작성해주세요.',
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
			imprtn.val() == "";
			imprtn.focus();
			return false;
		}
		
		//평가척도 유효성검사
		if(evl_std.val() != "" && evl_stdChk.test(evl_std.val()) == false){
			$.iGrowl({
				title: '평가척도는 숫자x숫자(x=영어)형식으로 작성해주세요.',
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
			evl_std.val() == "";
			evl_std.focus();
			return false;
		}
		//위험성 유효성검사
		if(risk.val() != "" && riskChk.test(risk.val()) == false){
			$.iGrowl({
				title: '위험성은 2~4자리 이내로 작성해주세요.',
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
			risk.val() == "";
			risk.focus();
			return false;
		}
		//외부평가자 유효성검사
		if(evl_chg.val() != "" && evl_chgChk.test(evl_chg.val()) == false){
			$.iGrowl({
				title: '외부평가자 이름은 2~4자리로 작성해주세요.',
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
			evl_evl_chg.val() == "";
			evl_evl_chg.focus();
			return false;
		}
		
		//평가일 공백검사
		if(evlcm_dy.val() == ""){
			$.iGrowl({
				title: "평가일을 선택해주세요.",
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
	        evlcm_dy.focus();
	        return false;
	    }
		
		//조치자 사번 유효성검사
		if(mng_sabun.val() != "" && mng_sabunChk.test(mng_sabun.val()) == false){
			$.iGrowl({
				title: '조치자 사번은 숫자 4자리로 입력해주세요.',
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
			mng_sabun.val() == "";
			mng_sabun.focus();
			return false;
		}
		
		//조치후 위험성 유효성검사
		if(mng_risk.val() != "" && mng_riskChk.test(mng_risk.val()) == false){
			$.iGrowl({
				title: '조치후 위험성은 숫자로 작성해주세요.',
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
			mng_risk.val() == "";
			mng_risk.focus();
			return false;
		}
		//조치후 위험성 수준 유효성검사
		if(mng_risk_lev.val() != "" && mng_risk_levChk.test(mng_risk_lev.val()) == false){
			$.iGrowl({
				title: '조치후 위험성 수준은 2~4자리로 작성해주세요.',
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
			mng_risk_lev.val() == "";
			mng_risk_lev.focus();
			return false;
		}
		
	}
	</script>
</body>
</html>