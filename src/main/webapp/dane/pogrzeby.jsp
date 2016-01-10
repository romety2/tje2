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
        <h1 class="text-center">Pogrzeby</h1>
        <div>
        	<a href="${pageContext.request.contextPath}/DodajPogrzeb" class="btn btn-success" role="button">Dodaj</a>
         </div>
        <br/>

        <c:choose>
            <c:when test="${pogrzeby.size() > 0}">
                <table class="table table-striped">
                    <tr>
                        <th>Data</th>
                        <th>Trumna</th>
                        <th>Cena</th>
                        <th>Opis</th>
                        <th></th>
                    </tr>
                    <c:forEach var="pogrzeb" items="${pogrzeby}" varStatus="loopCounter">
                        <tr>
                            <td>${pogrzeb.getData()}</td>
                            <td>${pogrzeb.getTrumna().getRodzaj()}</td>
                            <td>${pogrzeb.getCena()}</td>
                            <td>${pogrzeb.getOpis()}</td>
                            <td>
                                <a href="pogrzeby/poglad/${pogrzeb.getId()}">
                                    Podgląd
                                </a>
                                <a href="pogrzeby/edytuj/${pogrzeb.getId()}">
					<a href="${pageContext.request.contextPath}/EdytujPogrzeb/${pogrzeb.getId()}" class="btn btn-primary" role="button">Edytuj</a>
                                </a>
                                <a href="usunPogrzeb/${pogrzeb.getId()}">
                                    Usuń
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <div class="well">Brak pogbrzebów!</div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="../elementy/stopka.jsp" />
</div>

<jsp:include page="../elementy/skrypty.jsp" />
</body>
</html>
