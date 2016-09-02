<%@page import="book.book.bookDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="processDao" class="book.book.BookProcessDao" />    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
  <c:set var="cnt" value="0" />
  <c:forEach var="list2" items="<%=listMain %>">
    <a href="${list2.no }"><img src="${list2.coverSmallUrl }"></a>
    <c:set var="cnt" value="${cnt+1 }" />
    <c:if test="${cnt == 3}">
    	<c:set var="cnt" value="0" />
    	&nbsp;<p/>
    </c:if>
  </c:forEach>
<!-- main book list end -->  
</body>
</html>