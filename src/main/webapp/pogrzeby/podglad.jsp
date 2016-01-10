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
        <h1 class="text-center">Pogrzeb</h1>
        <br/>

        <label>Data:</label>
        <div class="well well-sm">${pogrzebEdytowany.getData()}</div>

        <label>Trumna:</label>
        <div class="well well-sm">${pogrzebEdytowany.getTrumna().getRodzaj()}</div>

        <label>Cena:</label>
        <div class="well well-sm">${pogrzebEdytowany.getCena()}</div>

        <label>Opis:</label>
        <div class="well well-lg">${pogrzebEdytowany.getOpis()}</div>
	<div class="form-group text-center">
		                <a href="${pageContext.request.contextPath}/EdytujPogrzeb/${pogrzebEdytowany.getId()}" class="btn btn-primary" role="button">Edytuj</a>
		                <a href="${pageContext.request.contextPath}/UsunPogrzeb/${pogrzebEdytowany.getId()}" class="btn btn-danger" role="button">Usuń</a>
				<a href="${pageContext.request.contextPath}/Pogrzeby" class="btn btn-default" role="button">Wróć</a>
    	</div>
    </div>

    <jsp:include page="../elementy/stopka.jsp" />
</div>
</body>
</html>
