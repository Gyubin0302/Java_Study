<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Start~~!!</h1>
	
	<h3>사원 정보</h3>
	<form action="/Emp" method="get" >
		<label for="empno">ID: </label>
		<input type="number" id="empno" name="empno"><br><br>
		<input type="submit" value="Go~~!!"><br><br>
	</form>
	
	<h3>전체 사원 정보</h3>
	<form action="/EmpAll" method="get" >
		<label for="EMP">전체 사원 정보</label>
		<input type="submit" id="EMP" name="EMP"><br><br>
	</form>
	
	<h3>부서원 정보</h3>
	<form action="/EmpCombo" method="get" >
		<label for="EmpCombo">부서원 정보</label>	
			<select name="empCombo">
				<option value="10">ACCOUNTING</option>
				<option value="20">RESEARCH</option>
				<option value="30">SALES</option>
				<option value="40">OPERATIONS</option>
			</select>
		<input type="submit"  name="empCombo"><br><br>
	</form>

</body>
</html>