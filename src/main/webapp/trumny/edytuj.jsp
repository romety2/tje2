<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    	<jsp:include page="../elementy/head.jsp" />
	<jsp:include page="../elementy/skrypty.jsp" />
</head>

<body>
<jsp:include page="../elementy/menu.jsp" />

<div class="container">
    <div class="row">
        <h1 class="text-center">Edytuj trumnę</h1>

        	<form action="${pageContext.request.contextPath}/EdytujTrumne/${trumnaEdytowana.getId()}" data-toggle="validator" method="post" class="form-horizontal">
		        <div class="form-group">
		            <label for="rodzaj" class="col-sm-2 control-label">Rodzaj:</label>

		            <div class="col-sm-10">
		                <input type="text" name="rodzaj" id="rodzaj" class="form-control" value="${trumnaEdytowana.getRodzaj()}" required>
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="cena" class="col-sm-2 control-label">Cena:</label>

		            <div class="col-sm-10">
		                <input type="text" name="cena" id="cena" pattern="^[0-9]+$|^[0-9]+[.][0-9]+$" class="form-control"  placeholder="0.0" value="${trumnaEdytowana.getCena()}" required>
		            </div>
		        </div>

		        <div class="form-group">
		            <label for="ilosc" class="col-sm-2 control-label">Ilość:</label>

		            <div class="col-sm-10">
		                <input type="text" name="ilosc" id="ilosc" pattern="^[0-9]+$" class="form-control" placeholder="0" value="${trumnaEdytowana.getIlosc()}" required>
		            </div>
		        </div>
		        <div class="form-group text-center">
		                <button type="submit" class="btn btn-primary">Edytuj</button>
				<a href="${pageContext.request.contextPath}/Trumny" class="btn btn-default" role="button">Wróć</a>
		 	    </div>
		        </div>
            	</form>

    <jsp:include page="../elementy/stopka.jsp" />
</div>
</body>
</html>
