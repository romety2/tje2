<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    	<jsp:include page="../elementy/head.jsp" />
	<jsp:include page="../elementy/skrypty.jsp" />
	<script>
		$(document).ready(function()
			{	
			$.ajax
				(
					{
						url: '${pageContext.request.contextPath}/rest/trumna/podglad/${trumnaId}',
						type: 'GET',
						success: function(w) { 
										document.getElementById('pole1').innerHTML = w.rodzaj;
										document.getElementById('pole2').innerHTML = w.cena;
										document.getElementById('pole3').innerHTML = w.ilosc;
									}
					}	
				);
			}
		);
	</script>
	<script>
		$(document).ready(function()
			{
				$( "#usun" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/rest/trumna/usun/${trumnaId}',
						    type: 'DELETE',
						    success: function() { document.location.replace("${pageContext.request.contextPath}/Trumny"); }
						}	
						);
					}
				);
			}
		);
	</script>
</head>

<body>
<jsp:include page="../elementy/menu.jsp" />

<div class="container">
    <div class="row">
        <h1 class="text-center">Trumna</h1>
        <br/>

        <label>Rodzaj:</label>
        <div id = "pole1" class="well well-sm"></div>

        <label>Cena:</label>
        <div id = "pole2" class="well well-sm"></div>

        <label>Ilość:</label>
        <div id = "pole3" class="well well-sm"></div>
	<div class="form-group text-center">
		                <a href="${pageContext.request.contextPath}/EdytujTrumne/${trumnaId}" class="btn btn-primary" role="button">Edytuj</a>
		                <button id="usun" type="submit" class="btn btn-danger">Usuń</button>
				<a href="${pageContext.request.contextPath}/Trumny" class="btn btn-default" role="button">Wróć</a>
    	</div>
    </div>

    <jsp:include page="../elementy/stopka.jsp" />
</div>
</body>
</html>
