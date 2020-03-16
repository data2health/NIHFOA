<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="lucene" uri="http://icts.uiowa.edu/lucene"%>
<%@ taglib prefix="nihfoa" uri="http://icts.uiowa.edu/nihfoa"%>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<style type="text/css" media="all">
body {
    font-size: 84%;
    font-family: Arial,Helvetica,sans-serif;
    color: #000;
    margin: 0;
    padding: 0;
    line-height: 1.5em;
}

a {
    text-decoration: none;
    color: #005a8c;
}

a:visited{
	color:#032e45
}

a:hover{
	text-decoration: underline;
	color:#3a7ec2;
}



</style>

<c:choose>
	<c:when test="${empty param.mode}">
		<c:set var="mode" value="content" />
	</c:when>
	<c:otherwise>
		<c:set var="mode" value="${param.mode}" />
	</c:otherwise>
</c:choose>
<div>
	<lucene:search lucenePath="/Users/eichmann/NIH_FOA_Index" queryParserName="boolean" queryString="${param.query}" label="${mode}">
		<lucene:searchIterator>
			<c:set var="id"><lucene:hit label="id" /></c:set>
			<nihfoa:guideDoc ID="${id}">
				<div class="card mb-3" style="max-width: 540px;">
					<div class="row no-gutters" style="font-family: Roboto, sans-serif; font-weight: 300;">
					    <div class="col-3 text-center" style="background-image:url(images/data_circle.jpg);
					    background-size:cover; vertical-align:middle;">
					      <p style="margin-top:35%;color:white;font-size:2em;"><nihfoa:guideDocPrimaryIc /></p>
					    </div>
					    <div class="col-9">
					      <div class="card-body">
					        <h6 class="card-title" style="font-size:1.1em"><a target="_parent" href="<nihfoa:guideDocGuideLink/>"><nihfoa:guideDocDocNum /></a></h6>
					        <p class="card-text" style="font-size:12PX;"><nihfoa:guideDocTitle /></p>	
					      </div>
					    </div>
					  </div>
					</div>
<%-- 				<li><a target="_parent" href="<nihfoa:guideDocGuideLink/>"><nihfoa:guideDocDocNum /></a>: <nihfoa:guideDocTitle /></li> --%>
			</nihfoa:guideDoc>
		</lucene:searchIterator>
	</lucene:search>
</div>
