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
							url: '${pageContext.request.contextPath}/rest/trumna/dajWszystkie',
							type: 'GET',
							success: function(dane)
							{ 
								var d = dane.length;
								var table = document.getElementById("tabela");
								for (var i = 0; i < d; i++)
								{

									    tr = $('<tr/>');
									    tr.append("<td>"+dane[i].rodzaj+"</td>");
									    tr.append("<td>"+dane[i].cena+"</td>");
									    tr.append("<td>"+dane[i].ilosc+"</td>");
									    td = $('<td/>');
									    td.append(
"<a href='${pageContext.request.contextPath}/PodgladTrumna/"+dane[i].id+"' class='btn btn-xs btn-warning' role='button'> Podgląd </a> "+
"<a href='${pageContext.request.contextPath}/EdytujTrumne/"+dane[i].id+"' class='btn btn-xs btn-primary' role='button'>Edytuj</a> "+
"<button id="+dane[i].id+" onClick='usun("+dane[i].id+")' type='submit' class='btn btn-xs btn-danger'>Usuń</button>");
									    tr.append(td);
									    $(table).append(tr);
								}
							}
						}	
					);
				}
			);
	</script>
	<script>
		function usun(id)
				{	
					$.ajax
					(
						{
							url: '${pageContext.request.contextPath}/rest/trumna/usun/'+id,
							type: 'DELETE',
							success: function() { document.location.reload(true);}
						}	
					);
				}
	</script>
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

        <table id="tabela" class="table table-striped">
               <tr>
                     <th>Rodzaj</th>
                     <th>Cena</th>
                     <th>Ilość</th>
                     <th></th>
              </tr>
	</table>
    </div>

    <jsp:include page="../elementy/stopka.jsp" />
</div>

<jsp:include page="../elementy/skrypty.jsp" />
</body>
</html>
