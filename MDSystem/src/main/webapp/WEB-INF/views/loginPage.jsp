<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLDecoder" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 폰트링크 -->
    <link rel="preconnect" href="https://fonts.googleapis.com"><!--출처-->
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><!--출처-->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet"><!--실제로 사용되는것-->

    <!-- 로컬css -->
    <link rel="stylesheet" href="<c:url value='/css/login.css'/>">
    <link rel="stylesheet" href="<c:url value='/css/header_footer.css'/>">

    <!-- fontAsome -->
    <script src="https://kit.fontawesome.com/159aca3e6d.js" crossorigin="anonymous"></script>
    
    <!-- igrowl -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.10.2.min.js" /></script>
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
        <form action="<c:url value='/loginC/login'/>" method="get" name="frm" onsubmit="return formCheck(this);">
            <div id="loginBox">
                <table>
                    <tr>
                        <th colspan="2">
                            <span>LOGIN</span>
                           	<div id="msg">
                           		
							    <c:if test="${not empty param.msg}">
									<i class="fa fa-exclamation-circle"> ${URLDecoder.decode(param.msg)} </i>    
							    </c:if>        
							</div>
                        </th>
                    </tr>
                    <tr>
                        <th> <p>아이디</p> </th>
                        <td> <input type="text" class="formControl" id="sabun" name="sabun" placeholder="사번을 입력하세요" value="${cookie.sabun.value }" autofocus> </td>
                    </tr>
                    <tr>
                        <th> <p>패스워드</p> </th>
                        <td> <input type="password" class="formControl" id="passwd" name="passwd" placeholder="패스워드를 입력하세요"> </td>
                    </tr>
                    <tr>
                        <td colspan="2"> <input type="checkbox" class="chkControl" id="rememId" name="rememId" ${empty cookie.sabun.value ? "" : "checked" }> <label class="rememId" for="rememId" >아이디 저장하기</label> </td>
                        <input type="hidden" name="toURL" value="${param.toURL }">
                    </tr>
                    <tr>
                        <td colspan="2"> <button class="btnControl" id="loginBtn">LOGIN</button> </td>
                    </tr>
                </table>
            </div><!-- loginBox -->
        </form>
    </div><!-- login -->
    
    
    <script type="text/javascript" src="<c:url value='/js/loginCheck.js'/>"></script>
    <script>
	    let msg = "${msg}";
	
	    
	    if(msg == "LOGIN_ERR"){
	    	$.iGrowl({
				title: '로그인에 실패했습니다.',
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