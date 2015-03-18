<!DOCTYPE html>
<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<script src="resources/js/angular.js"></script>
<script src="resources/js/app.js"></script>
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<style>
body {
	padding-top: 30px;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Spring MVC Supplier Admin- Spring MVC Example</title>
</head>
<body ng-app="validationApp" ng-controller="mainController">

	<div class="container">
		<div class="col-sm-12">
			<div class="pure-menu pure-menu-open pure-menu-horizontal">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li class="pure-menu-selected"><a href="admin">Suppliers
							Admin </a></li>
					<li><a href="#">welcome</a></li>
					<li><a href="#">example</a></li>
				</ul>
			</div>
			<div id="message">${message}</div>

			<c:if test="${modify != null}">
				<div class="form-group">
					<form name="update" action="update.do"
						ng-submit="submitForm(update.$valid)" novalidate method="post">
						<!-- novalidate prevents HTML5 validation since we will be validating ourselves -->
						<legend> Modification Form: </legend>
						<div class="form-group">
							<!-- ID:Hidden for the Object for Controller -->
							<b>Id :<input hidden type="number" name="id"
								value="${modify.id}" /></b>${modify.id}<br>
						</div>

						<!-- NAME -->
						<div
							ng-class="{ 'has-error' : update.name.$invalid && !update.name.$pristine }">
							<label class="field" for="name">Name:</label> <input type="text"
								name="name" class="form-control" ng-pattern="/^[a-zA-Z\s]+$/"
								placeholder="${modify.name}" ng-model="modified.name"
								ng-minlength="3" required />
							<p ng-show="update.name.$invalid && !update.name.$pristine"
								class="help-block">Valid name is required.</p>
							<p ng-show="update.name.$error.minlength" class="help-block">Name
								is too short.</p>
						</div>

						<!-- ADDRESS -->
						<div
							ng-class="{ 'has-error' : update.address.$invalid && !update.address.$pristine }">
							<label class="field" for="address">Address:</label> <input
								type="text" name="address" class="form-control"
								title="This Field is Required" placeholder="${modify.address}"
								ng-minlength="2" ng-model="modified.address" required />
							<p ng-show="update.address.$invalid && !update.address.$pristine"
								class="help-block">You address is required.</p>
							<p ng-show="update.address.$error.minlength" class="help-block">Address
								is too short.</p>
						</div>

						<!-- EMAIL -->
						<div
							ng-class="{ 'has-error' : update.email.$invalid && !update.email.$pristine }">
							<label class="field" for="email">Email:</label> <input
								type="email" name="email" class="form-control"
								title="This Field is Required" placeholder="${modify.email}"
								ng-model="modified.email" required />
							<p ng-show="update.email.$invalid && !update.email.$pristine"
								class="help-block">Valid email is required.</p>


						</div>

						<!-- PHONE -->
						<div
							ng-class="{ 'has-error' : update.phone.$invalid && !update.phone.$pristine }">
							<label class="field" for="phone">Phone:</label> <input
								type="text" name="phone" class="form-control"
								ng-pattern="/[0-9\s+-]/" title="This Field is Required"
								placeholder="${modify.phone}" ng-model="modified.phone" required />
							<p ng-show="update.phone.$invalid && !update.phone.$pristine"
								class="help-block">Valid phone is required.</p>
							<p ng-show="update.phone.$error.minlength" class="help-block">phone
								is too short.</p>

						</div>
						<!-- SUBMIT -->
						<div align="center">
							<input class="btn btn-default" type="submit" value="Modify"
								ng-disabled="update.$invalid" />
						</div>
					</form>

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