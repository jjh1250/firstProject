<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>바이저 결제 페이지</title>
</head>
<body>
<p>부서 : ${authUser.departmentName} 직책 : ${authUser.positionName} 이름 : ${authUser.name} <a href="logout.do">[로그아웃하기]</a></p>
<hr/>
<table border="1">
	<tr>
		<td colspan="4">[회보]</td>
	</tr>
	<tr>
		<td>작성일자</td>
		<td>제목</td>
		<td>작성자</td>
	</tr>
<c:if test="${documentPage.cautionPage.hasNoDocuments()}">
	<tr>
		<td colspan="4">게시글이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="caution" items="${documentPage.cautionPage.content}">
	<tr>
		<td>${caution.regDate}</td>
		<td>
		<a href="readDocument.do?documentNo=${caution.documentNo}&pageNo=${documentPage.cautionPage.currentPage}">
		<c:out value="${caution.title}"/>
		</a>
		</td>
		<td>${caution.departmentName} ${caution.positionName} ${caution.name}</td>
	</tr>  
</c:forEach>
<c:if test="${documentPage.cautionPage.hasDocuments()}">
	<tr>
		<td colspan="4">
			<c:if test="${documentPage.cautionPage.startPage > 5}">
			<a href="settlementMain.do?cautionPageNo=${documentPage.cautionPage.startPage - 5}">[이전]</a>
			</c:if>
			<c:forEach var="pNo" 
					   begin="${documentPage.cautionPage.startPage}" 
					   end="${documentPage.cautionPage.endPage}">
			<a href="settlementMain.do?cautionPageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${documentPage.cautionPage.endPage < documentPage.cautionPage.totalPages}">
			<a href="settlementMain.do?cautionPageNo=${documentPage.cautionPage.startPage + 5}">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
</table>

<hr>

<table border="1">
	<tr>
		<td colspan="8">[승인대기목록]</td>
	</tr>
	<tr>
		<td>작성일자</td>
		<td>문서종류</td>
		<td>부서</td>
		<td>직책</td>
		<td>작성자</td>
		<td>제목</td>
		<td>책임자</td>
		<td>승인여부</td>
	</tr>
<c:if test="${documentPage.checkWaitPage.hasNoDocuments()}">
	<tr>
		<td colspan="8">게시글이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="checkWait" items="${documentPage.checkWaitPage.content}">
	<tr>
		<td>${checkWait.regDate}</td>
		<td>${checkWait.doctypeName}</td>
		<td>${checkWait.departmentName}</td>
		<td>${checkWait.positionName}</td>
		<td>${checkWait.name}</td>
		<td>
		<a href="readDocument.do?documentNo=${checkWait.documentNo}&pageNo=${documentPage.checkWaitPage.currentPage}">
		<c:out value="${checkWait.title}"/>
		</a>
		</td>
		<td>${checkWait.officerDepartment} ${checkWait.officerPosition} ${checkWait.officerName}</td>
		<td>${checkWait.officerCheck}</td>
	</tr>  
</c:forEach>
<c:if test="${documentPage.checkWaitPage.hasDocuments()}">
	<tr>
		<td colspan="8">
			<c:if test="${documentPage.checkWaitPage.startPage > 5}">
			<a href="settlementMain.do?checkWaitPageNo=${documentPage.checkWaitPage.startPage - 5}">[이전]</a>
			</c:if>
			<c:forEach var="pNo" 
					   begin="${documentPage.checkWaitPage.startPage}" 
					   end="${documentPage.checkWaitPage.endPage}">
			<a href="settlementMain.do?checkWaitPageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${documentPage.checkWaitPage.endPage < documentPage.checkWaitPage.totalPages}">
			<a href="settlementMain.do?checkWaitPageNo=${documentPage.checkWaitPage.startPage + 5}">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
</table>

<hr>

<table border="1">
	<tr>
		<td colspan="8">[승인목록]</td>
	</tr>
	<tr>
		<td>작성일자</td>
		<td>문서종류</td>
		<td>부서</td>
		<td>직책</td>
		<td>작성자</td>
		<td>제목</td>
		<td>책임자</td>
		<td>승인여부</td>
	</tr>
<c:if test="${documentPage.checkPage.hasNoDocuments()}">
	<tr>
		<td colspan="8">게시글이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="check" items="${documentPage.checkPage.content}">
	<tr>
		<td>${check.regDate}</td>
		<td>${check.doctypeName}</td>
		<td>${check.departmentName}</td>
		<td>${check.positionName}</td>
		<td>${check.name}</td>
		<td>
		<a href="readDocument.do?documentNo=${check.documentNo}&pageNo=${documentPage.checkPage.currentPage}">
		<c:out value="${check.title}"/>
		</a>
		</td>
		<td>${check.officerDepartment} ${check.officerPosition} ${check.officerName}</td>
		<td>${check.officerCheck}</td>
	</tr>  
</c:forEach>
<c:if test="${documentPage.checkPage.hasDocuments()}">
	<tr>
		<td colspan="8">
			<c:if test="${documentPage.checkPage.startPage > 5}">
			<a href="settlementMain.do?checkPageNo=${documentPage.checkPage.startPage - 5}">[이전]</a>
			</c:if>
			<c:forEach var="pNo" 
					   begin="${documentPage.checkPage.startPage}" 
					   end="${documentPage.checkPage.endPage}">
			<a href="settlementMain.do?checkPageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${documentPage.checkPage.endPage < documentPage.checkPage.totalPages}">
			<a href="settlementMain.do?checkPageNoo=${documentPage.checkPage.startPage + 5}">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
</table>

<hr>

<table border="1">
	<tr>
		<td colspan="8">[제출목록]</td>
	</tr>
	<tr>
		<td>작성일자</td>
		<td>문서종류</td>
		<td>부서</td>
		<td>직책</td>
		<td>작성자</td>
		<td>제목</td>
		<td>책임자</td>
		<td>승인여부</td>
	</tr>
<c:if test="${documentPage.submitPage.hasNoDocuments()}">
	<tr>
		<td colspan="8">게시글이 없습니다.</td>
	</tr>
</c:if>
<c:forEach var="submit" items="${documentPage.submitPage.content}">
	<tr>
		<td>${submit.regDate}</td>
		<td>${submit.doctypeName}</td>
		<td>${submit.departmentName}</td>
		<td>${submit.positionName}</td>
		<td>${submit.name}</td>
		<td>
		<a href="readDocument.do?documentNo=${submit.documentNo}&pageNo=${documentPage.submitPage.currentPage}">
		<c:out value="${submit.title}"/>
		</a>
		</td>
		<td>${submit.officerDepartment} ${submit.officerPosition} ${submit.officerName}</td>
		<td>${submit.officerCheck}</td>
	</tr>  
</c:forEach>
<c:if test="${documentPage.submitPage.hasDocuments()}">
	<tr>
		<td colspan="8">
			<c:if test="${documentPage.submitPage.startPage > 5}">
			<a href="settlementMain.do?sumbitPageNo=${documentPage.submitPage.startPage - 5}">[이전]</a>
			</c:if>
			<c:forEach var="pNo" 
					   begin="${documentPage.submitPage.startPage}" 
					   end="${documentPage.submitPage.endPage}">
			<a href="settlementMain.do?sumbitPageNo=${pNo}">[${pNo}]</a>
			</c:forEach>
			<c:if test="${documentPage.submitPage.endPage < documentPage.submitPage.totalPages}">
			<a href="settlementMain.do?sumbitPageNo=${documentPage.submitPage.startPage + 5}">[다음]</a>
			</c:if>
		</td>
	</tr>
</c:if>
</table>

<hr>
<a href="writeDocument.do">[문서작성]</a>
</body>
</html>