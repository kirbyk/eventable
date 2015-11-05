angular.module('starter.services', [])

.factory('AppData', function($http) {
  return {
    updateItems: function() {
      return $http.get('http://localhost:3000/events/' + EVENT_ID + '/updates.json');
    },
    mentorItems: function() {
      return $http.get('http://localhost:3000/events/' + EVENT_ID + '/mentors.json');
    },
    prizeItems: function() {
      return $http.get('http://localhost:3000/events/' + EVENT_ID + '/prizes.json');
    },
    scheduleItems: function() {
      return $http.get('http://localhost:3000/events/' + EVENT_ID + '/schedule.json');
    }
  };
});
