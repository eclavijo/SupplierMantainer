<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>

<head>
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
<script
	src="http://code.angularjs.org/1.2.11/i18n/angular-locale_es-es.js"></script>
<script src="resources/js/angular.js"></script>
<script src="resources/js/app.js"></script>

<title>Spring MVC Supplier Admin- Spring MVC Example</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style>
body {
	padding-top: 30px;
}
</style>

</head>
<body ng-app="miAp">
	<div class="container" ng-controller="ControladorFiltros">
		<div class="col-sm-12">

			<div class="pure-menu pure-menu-open pure-menu-horizontal">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li class="pure-menu-selected"><a href="admin.do">Suppliers
							Admin </a></li>
					<li><a href="#">welcome</a></li>
					<li><a href="#">example</a></li>
				</ul>
			</div>

			<div id="message">${message}</div>

			<div class="form-group">

				<form name="addSupplier" action="addSupplier.do" method="post"
					onsubmit="return letters(document.addSupplier)">
					Registration Form:

					<!-- NAME -->
					<div>

						<label class="field" for="name">Name:</label> <input type="text"
							name="name" class="form-control" required
							title="This Field is Required" placeholder="Ex.: Esteban Clavijo" />
					</div>
					<!-- ADDRESS -->
					<div>

						<label class="field" for="address">Address:</label> <input
							type="text" name="address" class="form-control" required
							title="This Field is Required"
							placeholder="Ex.: Av. Apoquindo 4700" />
					</div>
					<!-- EMAIL -->
					<div>
						<label class="field" for="email">Email:</label> <input
							type="email" name="email" class="form-control" required
							title="This Field is Required"
							placeholder="Ex.: eclavijo@nisum.com" />
					</div>
					<!-- PHONE -->
					<div>
						<label class="field" for="phone">Phone:</label> <input type="text"
							name="phone" class="form-control" required
							title="This Field is Required" placeholder="Ex.: +56973340976" />
					</div>
					<!-- SUBMIT -->
					<div align="center">
						<br> <input class="btn btn-default" type="submit"
							value="New Supplier" />
					</div>
				</form>
			</div>


			<c:if test="${suppliers != null}">
				<div class="panel panel-primary">

					<div class="panel-heading">
						<div class="input-group">
							<span class="input-group-addon"><i
								class="glyphicon glyphicon-search"></i></span> <input type="text"
								class="form-control" placeholder="Enter an ID of a Supplier"
								ng-model="search.id">
						</div>
					</div>
					<div class="panel-body">
						<table class="table table-bordered">
							<thead>
								<tr>

									<th><a href="" ng-click="orderBy('id')">Id:</a> <span
										class="caret" style="cursor: pointer"
										ng-click="orderBy('-id')"></span></th>
									<th>Name</th>
									<th>Email</th>
									<th>Address</th>
									<th>Phone</th>
									<th>Delete</th>
									<th>Modify</th>
								</tr>
							</thead>
							<tbody>
								<tr
									ng-repeat="supplier in suppliers | orderBy:orderSelected | filter:search">
									<td>{{supplier.id}}</td>
									<td>{{supplier.name}}</td>
									<td>{{supplier.email}}</td>
									<td>{{supplier.address}}</td>
									<td>{{supplier.phone}}</td>
									<td><a href="delete.do?id={{supplier.id}}">Remove</a></td>
									<td><a href="modify.do?id={{supplier.id}}">Modify</a></td>
								</tr>
							<tbody>
						</table>
					</div>
				</div>
			</c:if>
			<div align="center">
				<br> <br> <a class="" href="index.jsp">Home</a> <br>Spring
				MCV 2015 By eclavijo.
			</div>

		</div>
		<!-- col-sm-8 -->
	</div>
	<!-- /container -->
</body>
</html>
