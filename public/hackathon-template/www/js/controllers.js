angular.module('starter.controllers', [])

.controller('UpdatesCtrl', function($scope) {
})

.controller('MentorsCtrl', function($scope) {})

.controller('PrizesCtrl', function($scope) {})

.controller('ScheduleCtrl', function($scope, ScheduleItems) {
  ScheduleItems.all().then(function(res) {
    console.log(res.data);
    $scope.scheduleItems = res.data;
  }, function(res) {
    console.log('Error in schedule item factory');
  })
});
