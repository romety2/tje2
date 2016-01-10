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
        <h1 class="text-center">Trumny</h1>
        <div>
        	<a href="${pageContext.request.contextPath}/DodajTrumne" class="btn btn-success" role="button">Dodaj</a>
         </div>
        <br/>

        <c:choose>
            <c:when test="${trumny.size() > 0}">
                <table class="table table-striped">
                    <tr>
                        <th>Rodzaj</th>
                        <th>Cena</th>
                        <th>Ilość</th>
                        <th></th>
                    </tr>
                    <c:forEach var="trumna" items="${trumny}" varStatus="loopCounter">
                        <tr>
                            <td>${trumna.getRodzaj()}</td>
                            <td>${trumna.getCena()}</td>
                            <td>${trumna.getIlosc()}</td>
                            <td>
                                <a href="trumny/poglad/${trumna.getId()}">
                                    Podgląd
                                </a>
				<a href="${pageContext.request.contextPath}/EdytujTrumne/${trumna.getId()}" class="btn btn-primary" role="button">
					Edytuj
				</a>
                                <a href="${pageContext.request.contextPath}/UsunTrumne/${trumna.getId()}" class="btn btn-danger" role="button">
                                    Usuń
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </c:when>
            <c:otherwise>
                <div class="well">Brak trumien!</div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="../elementy/stopka.jsp" />
</div>

<jsp:include page="../elementy/skrypty.jsp" />
</body>
</html>
