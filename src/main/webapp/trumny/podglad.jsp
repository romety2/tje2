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
        <h1 class="text-center">Trumna</h1>
        <br/>

        <label>Rodzaj:</label>
        <div class="well well-sm">${trumnaEdytowana.getRodzaj()}</div>

        <label>Cena:</label>
        <div class="well well-sm">${trumnaEdytowana.getCena()}</div>

        <label>Ilość:</label>
        <div class="well well-sm">${trumnaEdytowana.getIlosc()}</div>
	<div class="form-group text-center">
		                <a href="${pageContext.request.contextPath}/EdytujTrumne/${trumnaEdytowana.getId()}" class="btn btn-primary" role="button">Edytuj</a>
		                <a href="${pageContext.request.contextPath}/UsunTrumne/${trumnaEdytowana.getId()}" class="btn btn-danger" role="button">Usuń</a>
				<a href="${pageContext.request.contextPath}/Trumny" class="btn btn-default" role="button">Wróć</a>
    	</div>
    </div>

    <jsp:include page="../elementy/stopka.jsp" />
</div>
</body>
</html>
