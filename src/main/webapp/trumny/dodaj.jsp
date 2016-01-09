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
        <h1 class="text-center">Dodaj trumnę</h1>

            <form action="add" method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="message" class="col-sm-2 control-label">Rodzaj:</label>

                    <div class="col-sm-10">
                        <input type="text" name="rodzaj" id="rodzaj" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="author" class="col-sm-2 control-label">Cena:</label>

                    <div class="col-sm-10">
                        <input type="text" name="cena" id="cena" class="form-control">
                    </div>
                </div>

                <div class="form-group">
                    <label for="author" class="col-sm-2 control-label">Ilość:</label>

                    <div class="col-sm-10">
                        <input type="text" name="ilosc" id="ilosc" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="text-center">
                        <button type="submit" class="btn btn-success">Dodaj</button>
			<a href="../Trumny" class="btn btn-default" role="button">Wróć</a>
	 	    </div>
                </div>

    <jsp:include page="../elementy/stopka.jsp" />
</div>

</body>
</html>
