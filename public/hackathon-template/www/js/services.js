angular.module('starter.services', [])

.factory('ScheduleItems', function($http) {

  // var headers = {
  //   'Access-Control-Allow-Origin' : '*',
  //   'Access-Control-Allow-Methods' : 'POST, GET, OPTIONS, PUT',
  //   'Content-Type': 'application/json',
  //   'Accept': 'application/json'
  // };
  //
  // $http({
  //   method: "GET",
  //   headers: headers,
  //   url: 'http://localhost:3000/events/2/schedule.json'
  // }).then(function(res) {
  //   console.log(res);
  // }, function(res) {
  //   console.log('Error in schedule item factory');
  // });

  var scheduleItems = [
    {
      "schedule_id": 2,
      "description": "Cookies"
    }, {
      "schedule_id": 3,
      "description": "Shit"
    }
  ];

  return {
    all: function() {
      return scheduleItems;
    }
  };
});
