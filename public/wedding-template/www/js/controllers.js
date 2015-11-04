angular.module('starter.controllers', [])

.controller('UpdatesCtrl', function($scope) {})
.controller('WeddingPartiesCtrl', function($scope) {})
.controller('GiftsCtrl', function($scope) {})
.controller('ScheduleCtrl', function($scope, ScheduleItems) {
  $scope.scheduleItems = ScheduleItems.all();
});
