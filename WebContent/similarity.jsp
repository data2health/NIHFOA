<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lucene" uri="http://icts.uiowa.edu/lucene"%>
<%@ taglib prefix="nihfoa" uri="http://icts.uiowa.edu/nihfoa"%>
<%@ taglib prefix="loki" uri="http://icts.uiowa.edu/loki"%>

<c:choose>
	<c:when test="${empty param.mode}">
		<c:set var="mode" value="content"/>
	</c:when>
	<c:otherwise>
		<c:set var="mode" value="${param.mode}"/>
	</c:otherwise>
</c:choose>

<html>
<head>
</head>
<body>
<c:import url="header.jsp" />
<h2>Similarity:
<c:choose>
	<c:when test="${mode == 'content'}">
		<a href="similarity.jsp?mode=purpose">purpose</a> :: content
	</c:when>
	<c:otherwise>
		purpose :: <a href="similarity.jsp?mode=content">content</a>
	</c:otherwise>
</c:choose>
</h2>

<c:set var="investigatorID" value="50642"/>
<loki:investigator ID="${investigatorID}">
	<c:set var="profile"><loki:research><loki:researchDescription/></loki:research></c:set>
	<p><loki:research><loki:researchDescription/></loki:research></p>
</loki:investigator>

<table>
	<tr>
		<th>ID</th>
		<th>Solicitation</th>
		<th>Title</th>
		<th>Score</th>
	</tr>
	<lucene:search lucenePath="/Users/eichmann/NIH_FOA_Index" queryString="${profile}" label="${mode}">
		<c:set var="id"><lucene:hit label="id" /></c:set>
		<tr>
			<nihfoa:guideDoc ID="${id}">
				<td><nihfoa:guideDocID /></td>
				<td><nihfoa:guideDocDocNum /></td>
				<td><a href="<nihfoa:guideDocGuideLink/>"><nihfoa:guideDocTitle /></a></td>
				<td><lucene:hit label="score" /></td>
			</nihfoa:guideDoc>
		</tr>
	</lucene:search>
</table>

<c:import url="footer.jsp" />
</body>
</html>
