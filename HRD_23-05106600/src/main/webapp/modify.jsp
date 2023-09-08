<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DBPKG.Util"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>modify</title>
</head>
<body>
<script type="text/javascript" src="check.js"></script>
<jsp:include page="header.jsp"/>
<jsp:include page="nav.jsp"/>
<section
		style="position: fixed; top: 60px; width: 100%; height: 100%; background-color: lightgray">
		<h2 style="text-align: center">
			<b>홈쇼핑 회원 정보 수정</b>
		</h2>
		<br>
		
		<form action="action.jsp" method="post"
			style="display: flex; align-items: center; justify-content: center; text-align: center">


			<!-- 이름이 mode인 곳에 modify를 넣어서 숨겨놈  -->
			<input type="hidden" name ="mode" value = "modify">
		
			<table border="1">
			
				<!-- 자바로 명령어 작성 -->
				<!-- 데이터베이스를 연동하고 sql을 작성하려고 만든 부분 (데이터베이스 자체를 작성한 코드는 util.java이다) -->
				<%
				request.setCharacterEncoding("UTF-8");
				//변수 생성
				Connection conn = null;
				Statement stmt = null;
				
				String mod_custno = request.getParameter("mod_custno");
				String custname = "";
				String phone = "";
				Date joindate;
				String grade = "";
				String address = "";
				String city = "";
				
				String joindateStr ="";

				try {

					
					conn = Util.getConnection(); //DB연결

					
					stmt = conn.createStatement(); //sql 실행하기 위한 변수 생성

					
					String sql = "SELECT * FROM member_tbl WHERE custno= " + mod_custno;

					
					ResultSet rs = stmt.executeQuery(sql);
					rs.next();

					
					mod_custno = rs.getString("custno");
					custname = rs.getString("custname");
					phone = rs.getString("phone");
					address = rs.getString("address");
					joindate = rs.getDate("joindate");
					grade = rs.getString("grade");
					city = rs.getString("city");
					
					
					// joindate 날자 형식을 string타입으로 바꿔주기 위한 코드 
					SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
					joindateStr = transFormat.format(joindate);
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				%>
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custon" value="<%=mod_custno%>" ></td>

				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname" value="<%=custname%>"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone" value="<%=phone%>"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address" value="<%=address%>"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate" value="<%=joindateStr%>"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP, B:일반, C:직원]</td>
					<td><input type="text" name="grade" value="<%=grade%>"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city" value="<%=city%>"></td>
				</tr>
				<tr>

					<!-- colspan="2" 두개의 열을 하나로 병합한다. -->
					<td colspan="2">
						<!-- 등록버튼은 db에 값을 넘겨줘야해서 type을 submit을 씀 --> 
						<input type="submit"
						value="수정" onclick="return modify()"> 
						<!-- 조회버튼은 단순히 값만 불러오면 되서 type을 button으로 씀  -->
						<input type="button" value="조회" onclick="return search()">

					</td>
				</tr>
			</table>

		</form>
		
		
		
		
		
		
		
</section>
<jsp:include page="footer.jsp"/>

</body>
</html>