//아이디 비밀번호 미작성시 알림띄우기 
function formCheck(frm) {
	let msg ='';

    if(frm.sabun.value.length==0) {
        setMessage('ID를 입력해주세요.', frm.sabun);
        return false;
    }

    if(frm.passwd.value.length==0) {
        setMessage('PASSWORD를 입력해주세요.', frm.passwd);
            return false;
    }
    
    return true;
}

function setMessage(msg, element){
	document.getElementById("msg").innerHTML = `${msg}`;
	
	if(element) {
		element.select();
	}
}