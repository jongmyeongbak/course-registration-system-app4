<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<!doctype html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
<jsp:include page="../nav.jsp">
	<jsp:param name="menu" value="교수"/>
</jsp:include>
<div class="container">
	<div class="row mb-3">
    	<div class="col-12">
        	<h1 class="border bg-light fs-4 p-2">과정 상세 정보</h1>
      	</div>
   	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>과정 상세정보를 확인하세요</p>
			<table class="table table-bordered">
				<tbody>
					<tr>
						<th class="table-dark" style="width: 15%;">과정이름</th>
						<td style="width: 35%;">소프트웨어 개론</td>
						<th class="table-dark" style="width: 15%;">번호</th>
						<td style="width: 35%;">1000</td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">구분</th>
						<td style="width: 35%;">교양</td>
						<th class="table-dark" style="width: 15%;">학점</th>
						<td style="width: 35%;">3학점</td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">학과</th>
						<td style="width: 35%;">컴퓨터공학과</td>
						<th class="table-dark" style="width: 15%;">담당교수</th>
						<td style="width: 35%;">홍길동</td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">모집정원</th>
						<td style="width: 35%;">30</td>
						<th class="table-dark" style="width: 15%;">신청자수</th>
						<td style="width: 35%;">5</td>
					</tr>
					<tr>
						<th class="table-dark" style="width: 15%;">설명</th>
						<td style="width: 85%; height: 100px; white-space: break-spaces;" colspan="3">소트트웨어 개론입니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col-12">
			<p>해당 과정을 신청한 학생들을 확인하세요</p>
			<table class="table table-sm">
				<thead>
					<tr class="table-dark">
						<th style="width: 20%;">순번</th>
						<th style="width: 20%;">아이디</th>
						<th style="width: 20%;">학생이름</th>
						<th style="width: 20%;">소속학과</th>
						<th style="width: 20%;">학년</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>hong</td>
						<td>홍길동</td>
						<td>컴퓨터공학과</td>
						<td>1학년</td>
					</tr>
					<tr>
						<td>2</td>
						<td>hong</td>
						<td>홍길동</td>
						<td>컴퓨터공학과</td>
						<td>1학년</td>
					</tr>
					<tr>
						<td>3</td>
						<td>hong</td>
						<td>홍길동</td>
						<td>컴퓨터공학과</td>
						<td>1학년</td>
					</tr>
					<tr>
						<td>4</td>
						<td>hong</td>
						<td>홍길동</td>
						<td>컴퓨터공학과</td>
						<td>1학년</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>
</html>