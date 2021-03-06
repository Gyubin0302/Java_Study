<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div id="content_wrap">
	<h2>main</h2>

	<div>
		<form id="bbsForm">
			<input type="hidden" name="email" value="${login.email}"> <input
				type="hidden" name="main_post_number" value="${bbs.post_number }">
			<table border="1">
				<tr>
					<th>작성자</th>
					<td>${bbs.nickname}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><a href="goBbsDetail.do?post_number=${bbs.post_number }">${bbs.title}</a></td>
				</tr>
				<tr>
					<th>지역</th>
					<td>${bbs.location}</td>
				</tr>
				<tr>
					<th colspan="2">사진</th>
				</tr>
				<tr>
					<td colspan="2">
						<div>
							<ul class="bxslider">
								<c:forEach items="${bbs.imgs}" var="img">
									<li><a href="#"><img src="image/${img}" alt="이미지 없음"></a></li>
								</c:forEach>
							</ul>
						</div>
					</td>

				</tr>

				<tr>
					<td><button type="button"
							onclick='getBbsLike("${bbs.post_number}","${login.email}")'>좋아요</button></td>
					<td><input id="like_count${bbs.post_number}" type="text"
						value="${bbs.likecount}"></td>
				</tr>

				<tr>
					<th colspan="2">내용</th>
				</tr>
				<tr>
					<td colspan="2">${bbs.content }</td>
				</tr>

				<c:forEach items="${cmtlist }" var="cmt">
					<tr id='cmtcontent${cmt.post_number}'>
						<td>${cmt.nickname}</td>
						<td>${cmt.content}</td>
						<td><button type="button" onclick='answerReplay("${cmt.post_number}")'>답글달기</button></td>
					</tr>
					<tr id="ans${cmt.post_number}" style="display:none">
						<td><input type="text" name="answer${cmt.post_number}"></td>
				    	<td><button type="button" id="answerSubmit${cmt.post_number}">완료</button></td>
					</tr>
				</c:forEach>


				<tr>
					<td><input type="text" name="content" placeholder="댓글 달기"></td>
					<td><button type="button" id="comment_button">게시</button></td>
				</tr>
			</table>
		</form>
	</div>
	<br> <br>
</div>

<script>
	$(document).ready(function() {
		$('.bxslider').bxSlider();

	});

	function getBbsLike(post_number, email) {
		$.ajax({
			url : 'checkLike.do',
			type : 'get',
			data : {
				'main_post_number' : post_number,
				'email' : email
			},
			success : function(data) {
				$("#like_count" + post_number).val(data);
			},
			error : function() {
				alert("error");
			}

		});
	}

	$("#comment_button").click(function() {
		let cmtdata = $("#bbsForm").serialize();
		$.ajax({
			url : 'addCmt.do',
			type : 'get',
			data : cmtdata,
			datatype:"json",
			success : function(data) {
				console.log(JSON.stringify(data));
				let addcmt="";
				$(".cmtcontent").remove();
				$.each(data, function(i, cmt){
					console.log(cmt.nickname);
					console.log(cmt.content);
					console.log(cmt.post_number);
					addcmt += "<tr><td>"+cmt.nickname+"</td>"
					addcmt += "<td>"+cmt.content+"</td>"
					addcmt += "<td><button type=button onclick='answerReplay("+ cmt.post_number + ")'>답글달기</button></td></tr>";
					
				});
				$("tr:eq(7)").after(addcmt);
				$("input[name='content']").val("");
			},
			error : function() {
				alert("error");
			}

		});

	});
	
	function answerReplay(post_number){
		if($("#ans"+post_number).css("display") == "none"){
			$("#ans"+post_number).show();
		}else {
			$("#ans"+post_number).hide();
		}
	}
</script>