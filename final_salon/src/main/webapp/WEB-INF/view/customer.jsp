<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/customer.css" />
</head>
<body>
	<div id="container">
		<div id="customerCenter">
			<div id="pageTitleWrap">
				<h2 id="h2_title">자주 묻는 질문<h2>
			</div>
			<div id="wrap">
				<div id="cstmBtn">
					<ul>
						<li id="cstmTab1"><a href="customer.do">FAQ</a></li>
						<li id="cstmTab2"><a href="notice.do">공지사항</a></li>
						<li id="cstmTab3"><a href="mailForm.do">메일보내기</a></li>
					</ul>
				</div>
				<br> <!-- <a id="list">FAQ List</a> --><br> 

				<div id="fnqTitle">
					<span id="numQ">번호</span> <span id="type">분류</span> <span
						id="title">질문</span>
				</div>
				<ul id=fnqCon>

					<c:forEach var="dto" items="${aList}">
						<li class="questList pull_down_group"><c:url var="path"
								value="fnqupdate.do">
								<c:param name="currentPage" value="${pv.currentPage}" />
								<c:param name="fnqNum" value="${dto.fnqNum}" />
							</c:url> <c:if test="${sessionScope.dto.id == 'admin' }">
								<a id="re" class="questNum" href="${path}"
									onclick="fnqupdate.do">${dto.fnqNum}</a>
							</c:if> <c:if test="${sessionScope.dto.id != 'admin' }">
								<a name="fnqNum" class="questNum" value="${dto.fnqNum}">${dto.fnqNum}</a>
							</c:if> <span class="questType">${dto.fnqCate}</span>
							<p class="questTit pull_down_button">
								<a herf="#" onclick="fnPullDownButton(this); return false;"
									style="margin-right: 85px; text-align: center">${dto.fnqQuest}<!--    편의점택배 주문을 했어요. 언제 찾으러 가면될까요?--></a>
							</p>
							<div class="pull_down_con">
								<div class="answerC">${dto.fnqContent}</div>
							</div></li>

					</c:forEach>

				</ul>

				<form id="frm" method="get"></form>


			</div>

			<div id="page">

				<c:if test="${pv.startPage>1}">
					<span><a
						href="customer.do?currentPage=${pv.startPage-pv.blockPage}"><img
							src="images/prev.gif" height="30" width="30"></a></span>
				</c:if>

				<!-- 페이지 -->
				<c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
					<span><a id="pag" href="customer.do?currentPage=${i}">${i}</a></span>
				</c:forEach>
				<!-- 클릭한 해당되는 레코드가 출력된다. -->

				<!-- 다음 (next)-->
				<c:if test="${pv.endPage<pv.totalPage}">
					<span><a
						href="customer.do?currentPage=${pv.startPage+pv.blockPage}"><img
							src="images/next.gif" height="30" width="30"></a></span>
				</c:if>
			</div>
			<c:if test="${sessionScope.dto.id == 'admin' }">
				<input type="button" id="register" value="자주 묻는 질문 등록" />
			</c:if>
		</div>
	</div>
</body>
</html>