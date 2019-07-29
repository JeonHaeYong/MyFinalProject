<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach var="list" items="${list }">
            	<div class="row section">
                	<div class="col-lg-1  d-none d-lg-block no">${list.rown}</div>
                	<div class="col-lg-2 col-md-2 col-12 siGun">${list.siGun }</div>
                	<div class="col-lg-3 col-md-4 col-12 hp ">${list.title }</div>
                	<div class="col-lg-2 col-md-3 col-12 tel">${list.tel }</div>
                	<div class="col-lg-4  col-md-3 col-12  addr">${list.address }</div>
            	</div>
			</c:forEach>
    
