<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>join</title>
</head>
<body>
	<jsp:include page="header.jsp" />



	<jsp:include page="nav.jsp" />

	<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">
			<b>홈쇼핑 회원등록</b>
		</h2>
		<br>

		<!-- action.jsp에다 데이터를 post방식으로 넘겨줄거임  -->
		<form name="frm" action = "action.jsp" method="post"
			style="display: flex; align-items: center; justify-content: center; text-align: center">

		<!-- 이름이 mode인 곳에 insert를 넣어서 숨겨놈  -->
		<input type="hidden" name ="mode" value = "insert">
		
			<table border="1">
				<!-- 자바로 명령어 작성 -->
				<!-- 데이터베이스를 연동하고 sql을 작성하려고 만든 부분 (데이터베이스 자체를 작성한 코드는 util.java이다) -->
				<%
				request.setCharacterEncoding("UTF-8");
				//변수 생성
				Connection conn = null;
				Statement stmt = null;
				String custno = "";

				try {

					// DB를 util.java에 만들었으니까 util에 있는 DB를 getConnection으로 받아오겠다.(DB연결 끝)
					conn = Util.getConnection(); //DB연결

					// 접속이된 conn에서 createStatement();를 해서 sql을 실행하기 위한 변수를 생성하는 단계이다.
					stmt = conn.createStatement(); //sql 실행하기 위한 변수 생성

					//sql변수 생성
					//회원번호 자동으로 불러오는 sql생성
					// From 앞에 custno는 필드의 이름을 custno로 해서 제일 큰값+1을 받아온다는 뜻이다.
					String sql = "SELECT MAX(custno)+1 custno FROM member_tbl";

					// 위에껀 sql문을 작성해준것 뿐이니까 밑에 결과값 받아오는 함수도 선언해줘야됌
					ResultSet rs = stmt.executeQuery(sql); //stmt를 통해 sql 살행 결과를 받아옴
					rs.next(); // 저장된 결과값을 불러온다.

					// custno를 결과값이 저장된 rs에서 받아올거임 
					custno = rs.getString("custno");

				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<tr>
					<td>회원번호(자동발생)</td>

					<!-- 회원번호는 자동생성이니까 인풋창에서 써지면 안된다 readonly -->
					<td><input type="text" name="custon" value="<%=custno%>"></td>

				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>

					<!-- colspan="2" 두개의 열을 하나로 병합한다. -->
					<td colspan="2">
						<!-- 등록버튼은 db에 값을 넘겨줘야해서 type을 submit을 씀 --> <input type="submit"
						value="등록" onclick="return joinCheck()"> <!-- 조회버튼은 단순히 값만 불러오면 되서 type을 button으로 씀  -->
						<input type="button" value="조회" onclick="return search()">

					</td>
				</tr>
			</table>

		</form>

	</section>

	<jsp:include page="footer.jsp" />
</body>
<script type="text/javascript" src="check.js">
	
</script>

</html>