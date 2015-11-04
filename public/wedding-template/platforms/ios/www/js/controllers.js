angular.module('starter.controllers', [])

.controller('UpdatesCtrl', function($scope) {
})

.controller('MentorsCtrl', function($scope) {})

.controller('GiftsCtrl', function($scope, GiftItems) {
	$scope.giftItems = GiftItems.all();	
})

.controller('ScheduleCtrl', function($scope, ScheduleItems) {
  $scope.scheduleItems = ScheduleItems.all();
});
