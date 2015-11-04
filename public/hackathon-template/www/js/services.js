angular.module('starter.services', [])

.factory('AppData', function($http) {
  return {
    updateItems: function() {
      // TODO: don't hard-code event number 1
      return $http.get('http://localhost:3000/events/1/updates.json');
    },
    mentorItems: function() {
      return $http.get('http://localhost:3000/events/1/mentors.json');
    },
    prizeItems: function() {
      return $http.get('http://localhost:3000/events/1/prizes.json');
    },
    scheduleItems: function() {
      return $http.get('http://localhost:3000/events/1/schedule.json');
    }
  };
});
