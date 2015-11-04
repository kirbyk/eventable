angular.module('starter.services', [])

.factory('ScheduleItems', function($http) {

  return {
    all: function() {
      var headers = {
        'Access-Control-Allow-Origin' : '*',
        'Access-Control-Allow-Methods' : 'POST, GET, OPTIONS, PUT',
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      };

      return $http({
        method: "GET",
        headers: headers,
        url: 'http://localhost:3000/events/1/schedule.json'
      });
    }
  };
});