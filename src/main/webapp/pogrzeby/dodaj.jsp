<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pl">
<head>
    	<jsp:include page="../elementy/head.jsp" />
	<jsp:include page="../elementy/skrypty.jsp" />
	<script>
		$(function()
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
</head>

<body>
<jsp:include page="../elementy/menu.jsp" />

<div class="container">
    <div class="row">
        <h1 class="text-center">Dodaj pogrzeb</h1>

            <form action="add" method="post" class="form-horizontal">
                <div class="form-group">
                    <label for="data" class="col-sm-2 control-label">Data:</label>

                    <div class="col-sm-10">
                        <input type="date" name="data" id="data" class="form-control"/>
                    </div>
                </div>

                <div class="form-group">
                 	<label for="trumna" class="col-sm-2 control-label">Trumna:</label>
			<div class="col-sm-10">
		                 <select type="text" name="trumna" id="trumna" class="form-control">
		                  	<option>qq</option>
				        <option>dd</option>
				         <option>aaę</option>
				          <option>tr</option>
		                  </select>
			</div>
                </div>

                <div class="form-group">
                    	<label for="cena" class="col-sm-2 control-label" >Cena:</label>

                    	<div class="col-sm-10">
                        	<input type="text" name="cena" id="cena" class="form-control"
				placeholder="double" data-error="Bruh, that email address is invalid"/>
                    	</div>
                </div>

                <div class="form-group">
                   	<label for="opis" class="col-sm-2 control-label">Opis:</label>

                    	<div class="col-sm-10">
                        	<input type="text" name="opis" id="opis" class="form-control"/>
                    	</div>
                </div>
                <div class="form-group">
                    	<div class="text-center">
                        	<button type="submit" class="btn btn-success">Dodaj</button>
				<a href="../Pogrzeby" class="btn btn-default" role="button">Wróć</a>
	 	    	</div>
                </div>
            </form>

    <jsp:include page="../elementy/stopka.jsp" />
</div>
</body>
</html>
