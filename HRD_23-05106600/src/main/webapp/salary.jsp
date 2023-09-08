<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>salary</title>
</head>
<body>
	<jsp:include page="header.jsp" />

	<jsp:include page="nav.jsp" />

	<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">
			<b>회원매출조회</b>
		</h2>
		<br>

		<form
			style="display: flex; align-items: center; justify-content: center; text-align: center">

			<table border="1">

				<tr>
					<td>회원번호</td>
					<td>회원성명</td>
					<td>고객등급</td>
					<td>매출</td>
				</tr>


				<!-- 자바로 명령어 작성 -->
				<!-- 데이터베이스를 연동하고 sql을 작성하려고 만든 부분 (데이터베이스 자체를 작성한 코드는 util.java이다) -->
				<%
				//데이터베이스 연동하기 위한 변수 선언
				Connection conn = null;

				//sql을 실행하기 위한 변수 선언
				Statement stmt = null;

				String grade = "";

				try {

					// DB를 util.java에 만들었으니까 util에 있는 DB를 getConnection으로 받아오겠다.(DB연결 끝)
					conn = Util.getConnection(); //DB연결

					// 접속이된 conn에서 createStatement();를 해서 sql을 실행하기 위한 변수를 생성하는 단계이다.
					stmt = conn.createStatement(); //sql 실행하기 위한 변수 생성

					//sql변수 생성
					// 함수는 group by절에 쓰지 않는다.
					String sql = "SELECT me.custno, me.custname, me.grade, sum(mo.price) price " + "FROM member_tbl me, money_tbl mo "
					+ "WHERE me.custno = mo.custno " + "GROUP BY me.custno, me.custname, me.grade "
					+ "ORDER BY sum(mo.price) desc";

					// 위에껀 sql문을 작성해준것 뿐이니까 밑에 결과값 받아오는 함수도 선언해줘야됌
					ResultSet rs = stmt.executeQuery(sql); //stmt를 통해 sql 살행 결과를 받아옴
					while (rs.next()) {
						//등급에 따른 출력값(A이면 VIP등등)
						grade = rs.getString("grade");
						switch (grade) {
						case "A":
							grade = "VIP";
							break;
						case "B":
							grade = "일반";
							break;
						case "C":
							grade = "직원";
							break;
						}
				%>


				<tr>
					<td><%=rs.getString("custno")%></td>
					<td><%=rs.getString("custname")%></td>
					<td><%=grade%></td>
					<td><%=rs.getString("price")%></td>
				</tr>

				<%
				}

				} catch (Exception e) {
				e.printStackTrace();
				}
				%>
			</table>


		</form>


	</section>
	<jsp:include page="footer.jsp" />

</body>
</html>