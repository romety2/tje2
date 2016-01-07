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
		<div class="jumbotron">
			<i><h1 class="text-center"><small>Zakład pogrzebowy</small></h1></i>
			<i><u><h2 class="text-center">Łukasz Mielewczyk</h2></u></i>
			<i><h3 class="text-center"><small><a href="mailto:lmielewczyk@inf.ug.edu.pl">lmielewczyk@inf.ug.edu.pl</a></small></h3></i>
			<p class="text-center">Nasza firma świadcząca usługi związane z pochówkiem zmarłych. Kompleksowe usługi obejmują:
			    </br>transport zwłok
			    </br>handel trumnami lub urnami
			    </br>kremację lub pośrednictwo w zorganizowaniu kremacji
			    </br>oprawę muzyczną uroczystości pogrzebowych
			    </br>sprzedaż wiązanek kwiatów i wieńców
			    </br>złożenie trumny lub urny w grobie, czy też grobowcu
			</p>
		</div>
	</div>
	<jsp:include page="elementy/stopka.jsp" />
</body>
</html>
