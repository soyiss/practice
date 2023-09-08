/* 예외처리를 하기 위한 함수를 만들거임 */
/* 등록 버튼을 눌렀을때 값이 다 입력됬는지를 확인하는 함수이다. */
function joinCheck() {

	/*내 문서.내가 입력함 form의 이름이 frm중에서도 custname의 값 (value)의 길이가 0이면 = 아무것도 입력되지 않은것 
	0이면 메세지창이 띄우게 하자
	*/
	if (document.frm.custname.value.length == 0) {
		alert("회원성명이 입력되지 않았습니다.");
		frm.custname.focus();
		return false;
	} if (document.frm.phone.value.length == 0) {
		alert("회원전화가 입력되지 않았습니다.");
		frm.phone.focus();
		return false;
	} if (document.frm.address.value.length == 0) {
		alert("회원주소가 입력되지 않았습니다.");
		frm.address.focus();
		return false;
	} if (document.frm.joindate.value.length == 0) {
		alert("가입일자가 입력되지 않았습니다.");
		frm.joindate.focus();
		return false;
	} if (document.frm.grade.value.length == 0) {
		alert("고객등급이 입력되지 않았습니다.");
		frm.grade.focus();
		return false;
	} if (document.frm.city.value.length == 0) {
		alert("도시코드가 입력되지 않았습니다.");
		frm.city.focus();
		return false;
	}

	/* if문을 다 빠져 나왔다는건 입력되지 않은 값이 없다는 뜻이니까 리턴을 true로 준다. */

	success();
	return true;

}

function success() {
	alert("등록이 완료되었습니다.");
}


/* 조회버튼을 누르면 회원조회화면으로 이동하는 함수 */
function search() {
	window.location = 'list.jsp';
}

/* 수정 버튼을 누르면 수정되었습니다 메세지 뜸 */
function modify() {
	alert("회원정보수정이 완료되었습니다.");
}
