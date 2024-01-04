<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value='/css/header_footer.css'/>">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
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
<style>
.popup-bg {background-color: rgba(0, 0, 0, 0.0); width:100%; height:100%; display:none; position: absolute !important; top: 50% !important; left: 50% !important; transform: translate(-50%, -50%); z-index:666;}
.popup-bg.active {display:block;}
.popup-bg.active .popup-wrap {display:block;}
.popup-wrap {display:none; position: absolute !important; top: 50% !important; left: 50% !important; transform: translate(-50%, -50%); background-color:#fff; padding: 40px 50px; border:1px solid #f5f5f5; box-shadow: 1px 4px 11px 3px rgb(0 0 0 / 10%); border-radius:10px; z-index:666;}
.popup-wrap .popup-cont {font-size:18px; text-align:center; text-align:center;}
.popup-wrap .popup-cont:before {content:""; display:block; background:url(../img/sub/ico-check-b.png) no-repeat; width:55px; height:55px; margin:0 auto; margin-bottom:20px;}
.popup-wrap .popup-btn {display:flex; justify-content:center; margin-top: 30px;}
.popup-wrap .popup-btn a {display:block; padding:8px 25px; background-color:#de012b; color:#fff; margin:0 5px; border-radius: 4px;}
.popup-wrap .popup-btn a.btn-close {background:none;}
</style>
<body>
	<div class="test">
		<button type="button" id="modalBtn">모달창켜기</button>
	</div>
	
	<div id="confirmPopUp" class="popup-bg">
		<div class="popup-wrap">
			<div class="popup-cont"></div>
			<div class="popup-btn">
				<a href="javascript:void(0);" id="confirmPopupYes" title="확인" class="">확인</a>
				<a href="javascript:void(0);" id="confirmPopupNo" title="취소" class="">취소</a>
			</div>
		</div>	
	</div>
	<script>
	$(document).ready(function(){
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
		
		$('#modalBtn').on('click', function(){
			confirms('저장하시겠습니까?', 'OK')
		})//modalBtn
		
		function confirmYes(action){
			if(action == 'ADD'){
				
			}else if(action == 'DEL'){
				
			}
		};
		
		function confirmNo(action){
			//dialog끄기
		};
	})//document-ready
	
	
	</script>
</body>
</html>