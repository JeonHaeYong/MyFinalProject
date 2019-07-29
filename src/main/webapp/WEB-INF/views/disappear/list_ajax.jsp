<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:forEach var="list" items="${list }"> 
			<div class="col-lg-4 col-md-6 col-sm-6 dtocol">
				<div class="infowrapper">
						<div class="infoimg">
							
								<div id="carouselExampleFade" class="carousel slide carousel-fade" data-ride="carousel">
									<div class="carousel-inner">
									
										<div class="carousel-item active">
											<a href="toReportContent?seq=${list.seq }">	<img src="${list.image1 }" class="d-block w-100"></a>
										</div>
										<div class="carousel-item">
											<a href="toReportContent?seq=${list.seq }">	<img src="${list.image2 }" class="d-block w-100"></a>
										</div>
										<div class="carousel-item">
											<a href="toReportContent?seq=${list.seq }">	<img src="${list.image3 }" class="d-block w-100"></a>
										</div> 
									</div>
								</div>
						</div>
				
                   <div class="animal-kind">${list.kind }<img src=""></div>
                   <div class="animal-feature">${list.feature }</div>
                    <div class="petInfo">
                    	<div>${list.gender} </div>
                    	<div>${list.age }</div>
                    	<div class="furColor">${list.furColor }</div>
                    </div><br><br>
                  <!--   <div class="writeInfo"> -->
                    	<div class="writer">${list.writer }</div>
                    	<div class="writeDate">${list.writeDate }</div>
                    	<!-- </div>  -->
             
				</div>
			</div>
			  </c:forEach> 
