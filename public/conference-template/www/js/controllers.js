angular.module('starter.controllers', [])

.controller('UpdatesCtrl', function($scope) {
})

.controller('SpeakersCtrl', function($scope) {})

.controller('PrizesCtrl', function($scope) {})

.controller('ScheduleCtrl', function($scope, ScheduleItems) {
  $scope.scheduleItems = ScheduleItems.all();
});
