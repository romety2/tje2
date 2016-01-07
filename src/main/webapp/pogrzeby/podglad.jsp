<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    	<jsp:include page="strony/head.jsp" />
</head>

<body>
<jsp:include page="strony/menu.jsp" />

<div class="container">
    <div class="row">
        <h1 class="text-center">Pogrzeby</h1>
        <div>
        	<button type="submit" class="btn btn-success">Dodaj</button>
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
                            <td>${pogrzeb.data}</td>
                            <td>${pogrzeb.trumna.rodzaj}</td>
                            <td>${pogrzeb.cena}</td>
                            <td>${pogrzeb.opis}</td>
                            <td>
                                <a href="pogladP/${message.id}">
                                    Podgląd
                                </a>
                                |
                                <a href="edytujP/${message.id}">
                                    Edytuj
                                </a>
                                |
                                <a href="usunPogrzeb/${message.id}">
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

    <jsp:include page="strony/stopka.jsp" />
</div>

<jsp:include page="strony/skrypty.jsp" />
</body>
</html>
