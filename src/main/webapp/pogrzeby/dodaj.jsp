<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    	<jsp:include page="elementy/head.jsp" />
</head>

<body>
<jsp:include page="elementy/menu.jsp" />

<div class="container">
    <div class="row">
        <h1 class="text-center">Trumny</h1>
        <div>
        	<button type="submit" class="btn btn-success">Dodaj</button>
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
                            <td>${pogrzeb.rodzaj}</td>
                            <td>${pogrzeb.cena}</td>
                            <td>${pogrzeb.ilosc}</td>
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
                <div class="well">Brak trumien!</div>
            </c:otherwise>
        </c:choose>
    </div>

    <jsp:include page="elementy/stopka.jsp" />
</div>

<jsp:include page="elementy/skrypty.jsp" />
</body>
</html>
