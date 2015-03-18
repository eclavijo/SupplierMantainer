<%@ page session="true"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<link rel="stylesheet"
	href="http://yui.yahooapis.com/pure/0.5.0/pure-min.css">
<title>Spring MVC Supplier Admin- Spring MVC Example</title>
<link rel="stylesheet"
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.3/css/bootstrap.min.css">
<style>
body {
	padding-top: 30px;
}
</style>
</head>
<body>
	<div class="container">
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
			<br>
			<div align='center'>
				<h2>
					Hey You..!! This is a Spring MCV Web App!!!<br> <br>
				</h2>

				<img src="http://www.javatpoint.com/images/spimages/spring1.png" />

				<br />
				<h3>
					<a href="admin.do">Click here to Manage your Suppliers </a>(to
					check Spring MVC Controller... @RequestMapping("/admin"))
				</h3>
			</div>

		</div>
		<!-- col-sm-10 -->
	</div>
	<!-- /container -->
</body>
</html>
