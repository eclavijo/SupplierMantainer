<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">

<title>Spring MVC - Spring MVC Example</title>

</head>
<body>

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
			<div>
				<c:if test="${suppliers}">
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>Id:</th>
								<th>Name</th>
								<th>Email</th>
								<th>Address</th>
								<th>Phone</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="supplier" items="${suppliers}">
								<tr>
									<td>${supplier.id}</td>
									<td>${supplier.name}</td>
									<td>${supplier.email}</td>
									<td>${supplier.address}</td>
									<td>${supplier.phone}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>

				<c:if test="${supplier != null}">
					<table class="table table-bordered">
						<tr>
							<th>Id:</th>
							<th>Name</th>
							<th>Address</th>
							<th>Email</th>
							<th>Phone</th>
						</tr>
						<tr>
							<td>${supplier.id}</td>
							<td>${supplier.name}</td>
							<td>${supplier.address}</td>
							<td>${supplier.email}</td>
							<td>${supplier.phone}</td>
						</tr>
					</table>
				</c:if>
				<c:if test="${deleted != null}">
					<table class="table table-bordered">
						<tr>
							<th>Id:</th>
							<th>Name</th>
							<th>Address</th>
							<th>Email</th>
							<th>Phone</th>
						</tr>
						<tr>
							<td>${deleted.id}</td>
							<td>${deleted.name}</td>
							<td>${deleted.address}</td>
							<td>${deleted.email}</td>
							<td>${deleted.phone}</td>
						</tr>
					</table>
				</c:if>
			</div>
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