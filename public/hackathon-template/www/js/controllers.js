angular.module('starter.controllers', [])

.controller('UpdatesCtrl', function($scope, AppData) {
  setColors($scope, AppData)
  AppData.updateItems().then(function(res) {
    $scope.updateItems = res.data;
  }, function(res) {
    console.log('Error in app data factory');
  })
})

.controller('MentorsCtrl', function($scope, AppData) {
  setColors($scope, AppData)
  AppData.mentorItems().then(function(res) {
    $scope.mentorItems = res.data;
  }, function(res) {
    console.log('Error in app data factory');
  })
})

.controller('PrizesCtrl', function($scope, AppData) {
  setColors($scope, AppData)
  AppData.prizeItems().then(function(res) {
    $scope.prizeItems = res.data;
  }, function(res) {
    console.log('Error in app data factory');
  })
})

.controller('ScheduleCtrl', function($scope, AppData) {
  setColors($scope, AppData)
  AppData.scheduleItems().then(function(res) {

    res.data.map(function(item) {
      item.start_time = moment(item.start_time).format('h:mm A');
      item.end_time = moment(item.end_time).format('h:mm A');
      return item;
    });

    $scope.scheduleItems = res.data;
  }, function(res) {
    console.log('Error in app data factory');
  })
});

setColors = function($scope, AppData) {
  AppData.fgstyle().then(function(res) {
    $scope.fgstyle = res.data;
  }, function(res) {
    console.log('Error in app data factory');
  })
  AppData.bgstyle().then(function(res) {
    $scope.bgstyle = res.data;
  }, function(res) {
    console.log('Error in app data factory');
  })
}