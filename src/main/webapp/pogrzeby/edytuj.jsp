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
				$( "#data" ).datepicker
				(
					{
						changeMonth: true,
						changeYear: true,
						dateFormat: "yy-mm-dd",
					},
					$.datepicker.regional[ "pl" ]
				);
			}
		);
	</script>
	<script>
		$(document).ready(function()
			{
				$( "#edytuj" ).on('click', function(e)
					{	
						e.preventDefault();
						$.ajax
						(
						{
						    url: '${pageContext.request.contextPath}/rest/pogrzeb/edytuj/${pogrzebEdytowany.getId()}',
						    type: 'PUT',
						    data:
							{
								data: document.getElementById('data').value,
								trumna: document.getElementById('trumna').value,
								cena: document.getElementById('cena').value,
								opis: document.getElementById('opis').value
								
							},
						    success: function() { document.location.replace("${pageContext.request.contextPath}/Pogrzeby"); },
 						    error: function() { alert("Nieprawidłowo wprowadzono dane!"); }
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
        <h1 class="text-center">Edytuj pogrzeb</h1>
            	<form data-toggle="validator" method="put" class="form-horizontal">

		        <div class="form-group">
		            <label for="data" class="col-sm-2 control-label">Data:</label>

		            <div class="col-sm-10">
		                <input type="date" name="data" id="data" class="form-control" value="${pogrzebEdytowany.getData()}" placeholder="rrrr-mm-dd" required>
		            </div>
		        </div>

		        <div class="form-group">
		         	<label for="trumna" class="col-sm-2 control-label">Trumna:</label>
				<div class="col-sm-10">
				         <select type="text" name="trumna" id="trumna" class="form-control" required>
				     		<c:forEach var="trumnaFK" items="${trumnyDostepne}" varStatus="loopCounter">
						<c:choose>
						    <c:when test="${trumnaFK.id == pogrzebEdytowany.getTrumna().getId()}">
						    	<option value="${trumnaFK.id}" selected="selected">${trumnaFK.getRodzaj()}</option>
						    </c:when>
						    <c:otherwise>
							<option value="${trumnaFK.id}">${trumnaFK.rodzaj}</option>
							<br />
						    </c:otherwise>
						</c:choose>
					</c:forEach>
					</select>
				</div>
		        </div>

		        <div class="form-group">
		            	<label for="cena" class="col-sm-2 control-label" >Cena:</label>

		            	<div class="col-sm-10">
		                	<input type="text" pattern="^[0-9]+$|^[0-9]+[.][0-9]+$" name="cena" id="cena" class="form-control" value="${pogrzebEdytowany.getCena()}" placeholder="0.0" required>
		            	</div>
		        </div>

		        <div class="form-group">
		           	<label for="opis" class="col-sm-2 control-label" min="2">Opis:</label>

		            	<div class="col-sm-10">
		                	<input type="text" name="opis" id="opis" class="form-control" value="${pogrzebEdytowany.getOpis()}">
		            	</div>
		        </div>
		        <div class="form-group text-center">
		                <button id="edytuj" type="submit" class="btn btn-primary">Edytuj</button>
				<a href="${pageContext.request.contextPath}/Pogrzeby" class="btn btn-default" role="button">Wróć</a>
		        </div>

            	</form>

    <jsp:include page="../elementy/stopka.jsp" />
</div>
</body>
</html>
