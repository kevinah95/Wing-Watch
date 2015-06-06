'strict'
app.directive('sidebarDirective', function(){
	// Runs during compile
	return {
		controller: 'sidebarCtrl',
		restrict: 'E', // E = Element, A = Attribute, C = Class, M = Comment
		templateUrl: '_wing-watch-core/reusables/sidebar/sidebarView.html'
		
	};
});