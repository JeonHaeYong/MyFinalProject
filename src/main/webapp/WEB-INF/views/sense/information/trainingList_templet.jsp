<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="row tdtowrapper">

	<c:forEach var="tdto" items="${tdto}">

		<div class="col-lg-4 col-md-6 col-sm-6 dtocol">

			<div class=infowrapper>

				<div class=infoseq>
					<c:if test="${type eq '4'}">
						<input type=checkbox value="${tdto.seq}" name="check">
					</c:if>
					NO.${tdto.seq }
				</div>

				<div class=infoimg>
					<a href="detail_info?seq=${tdto.seq}" class="detail">${tdto.image}</a>
				</div>
				<div class=infotext>${tdto.title}</div>
				<div class="inforecommend">${tdto.writeDate}</div>
			</div>

		</div>
	</c:forEach>

</div>
<div class="row mt-5" align="right">
	<div class="col-12">
		<div>
			<div id="tnavi" align="center">${tnavi }</div>
		</div>
	</div>
</div>