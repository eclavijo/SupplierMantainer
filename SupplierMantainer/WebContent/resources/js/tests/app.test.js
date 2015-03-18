describe("An Angular JS test suite", function() {
	it('should have tests', function() {
		expect(true).toBe(true);
	});

});

describe("A spec using beforeEach and afterEach", function() {
	var foo = 0;

	beforeEach(function() {
		foo += 1;
	});

	afterEach(function() {
		foo = 0;
	});

	it("is just a function, so it can contain any code", function() {
		expect(foo).toEqual(1);
	});

	it("can have more than one expectation", function() {
		expect(foo).toEqual(1);
		expect(true).toEqual(true);
	});

});

describe('Unit: miAp', function() {
	// Load the module with ControladorFiltros
	beforeEach(module('miAp'));

	// inject the $controller and $rootScope services
	// in the beforeEach block
	// beforeEach(inject(function($injector) {
	//
	// rootScope = $injector.get('$rootScope');
	// $controller = $injector.get('$controller');
	// $scope = $rootScope.$new();
	//
	// }));
	//
	// beforeEach(inject(function($controller) {
	// ControladorFiltros = $controller("ControladorFiltros");
	// }));
	//
	// it("Should say hello", function() {
	// expect(ControladorFiltros.text).toBe("Hello World!");
	// });

	var ctrl, scope;
	// inject the $controller and $rootScope services
	// in the beforeEach block
	beforeEach(inject(function($controller, $rootScope) {
		// Create a new scope that's a child of the $rootScope
		scope = $rootScope.$new();
		// Create the controller
		ctrl = $controller('ControladorFiltros', {
			$scope : scope
		});
	}));
	
	it('should have a a hello world on the "text" of the scope', 
		    function() {
		      expect(scope.text).toEqual("Hello World!");
		  });

});

// describe("validation update form", function(){
// beforeEach(module('validationApp'));
//	
// var mainController;
//	
// beforeEach(inject(function($controller){
//		
// mainController= $controller('v');
// }));
//	
// it("scope.text should be hello world!", function() {
// expect(scope.text).toBe('Hello World!');
// });
//
// });
