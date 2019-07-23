<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row .infinite">
	<c:forEach var="dto" items="${infodto}">
		<div class="col-lg-4 col-md-6 col-sm-6 dtocol">
			<div class=infowrapper>
				<div class=infoseq>
					<c:if test="${type eq '4'}">
						<input type=checkbox value="${dto.seq}" name="check">
					</c:if>
					NO.${dto.seq }
				</div>
				<div class=infoimg>
					<a href="detail_info?seq=${dto.seq}" class="detail">${dto.image}</a>
				</div>
				<div class=infotext>${dto.title}</div>
				<div class="inforecommend">${dto.writeDate}</div>
			</div>
		</div>
	</c:forEach>
</div>

<div class="row mt-5" align="right">
	<div class="col-12">
		<div>
			<div id="tnavi" align="center">${infonavi }</div>
		</div>
	</div>
</div>