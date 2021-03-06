<%@page import="book.book.bookDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="book.book.BookProcessDao" />    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%ArrayList<bookDto> listTop = (ArrayList)processDao.getTopBook();%>
<%ArrayList<bookDto> listMain = (ArrayList)processDao.getBooks();%>     
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
<link rel="stylesheet" type="text/css" href="../css/book.css">
<title>Main Page(Book list)</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/js/materialize.min.js"></script>
<script type="text/javascript" src="../js/book.js"></script>
</head>
<body>
<!-- top5 slide list start -->
  <div class="carousel">
	<c:forEach var="list1" items="<%=listTop %>">
    	<a class="carousel-item" href="${list1.no }"><img src="${list1.coverLargeUrl }"></a>
  	</c:forEach>
  </div>
<!-- top5 slide list end -->
&nbsp;<p/>&nbsp;<p/>
<!-- main book list start -->
  <div class="row">
  	<c:set var="cnt" value="0" />
  	<c:forEach var="list2" items="<%=listMain %>">
      	<div class="col s3">
      		<div class="book-info">
    			<a href="${list2.no }">
    				<img src="${list2.coverLargeUrl }">
    				<div class="dimmer"></div>
    			</a>
    			<div class="book-desc">
    				<c:set var="title1" value="${list2.title }" />
    				<c:set var="title2" value="${fn:substring(title1, 0, 11) }" />
    				<div class="book-title">
    					${title2 }    				
    					<c:if test="${fn:length(title1) > 11 }">...</c:if>
    					<hr class="title-line">    					
    				</div>
    				<p class="star_rating">
					    <a href="#">★</a>
					    <a href="#">★</a>
					    <a href="#">★</a>
					    <a href="#">★</a>
					    <a href="#">★</a>
					</p> 
   					<span class="favorite">♥ wish list</span>
    				
	    		</div>
	    	</div>
      	</div>
    	<c:set var="cnt" value="${cnt+1 }" />
    	<c:if test="${cnt == 4}">
    		<c:set var="cnt" value="0" />
    		<p/>&nbsp;
    	</c:if>
	</c:forEach>
  </div>
<!-- main book list end -->  
</body>
</html>