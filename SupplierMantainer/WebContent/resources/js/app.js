// app.js
// create angular app
var validationApp = angular.module('validationApp', []);

// create angular controller
validationApp.controller('mainController', function($scope) {

	var text = 'Hello World!';

	// function to submit the form after all validation has occurred
	$scope.submitForm = function(isValid) {

		// check to make sure the form is completely valid
		if (isValid) {
			alert('form submited');
		}
	}
});

var miAp = angular.module('miAp', []);

miAp.controller('ControladorFiltros',
		function ControladorFiltros($scope, $http) {
			$http.get('/SupplierMantainer/listAll').success(function(data) {
				$scope.suppliers = data;
				this.text = 'Hello World!';
				
			});
				$scope.orderBy = function(order) {
					$scope.orderSelected = order;
				};
		});

// Function to check letters and numbers
function letters(inputForm) {
	var Onlyletters = /^[A-Za-z\s]{1,}[\.]{0,1}[A-Za-z\s]{0,}$/;
	var PhoneLetters = /[0-9+extEXTextensionEXTENSION.\s]$/;
	var EmailLetters = /(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])/;
	var AddressLeters = /[a-zA-Z\d\s\-\,\#\.\+]+/;
	var flag;
	if (!(inputForm.name.value.match(Onlyletters))) {
		alert("Please enter only letters to name");
		return false;
	}
	if (!(inputForm.address.value.match(AddressLeters))) {
		alert("Please enter only letters to address");
		return false;
	}
	if (!(inputForm.email.value.match(EmailLetters))) {
		alert("Please enter only available characters to email");
		return false;
	}
	if (!(inputForm.phone.value.match(PhoneLetters))) {
		alert("Please enter only available characters to phone");
		return false;
	}
}