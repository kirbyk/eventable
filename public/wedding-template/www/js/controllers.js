angular.module('starter.controllers', [])

.controller('UpdatesCtrl', function($scope) {})
.controller('MentorsCtrl', function($scope) {})
.controller('GiftsCtrl', function($scope) {})
.controller('ScheduleCtrl', function($scope, ScheduleItems) {
  $scope.scheduleItems = ScheduleItems.all();
});
