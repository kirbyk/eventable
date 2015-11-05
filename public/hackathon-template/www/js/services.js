angular.module('starter.services', [])

.factory('AppData', function($http) {
  if (IS_WEB_PREVIEW) {
    API_ENDPOINT = 'http://localhost:3000/events/';
  } else {
    API_ENDPOINT = 'https://kirby.ngrok.io/events/';
  }
  
  return {
    updateItems: function() {
      return $http.get(API_ENDPOINT + EVENT_ID + '/updates.json');
    },
    mentorItems: function() {
      return $http.get(API_ENDPOINT + EVENT_ID + '/mentors.json');
    },
    prizeItems: function() {
      return $http.get(API_ENDPOINT + EVENT_ID + '/prizes.json');
    },
    scheduleItems: function() {
      return $http.get(API_ENDPOINT + EVENT_ID + '/schedule.json');
    },
    fgstyle: function() {
      return $http.get(API_ENDPOINT + EVENT_ID + '/fgstyle.json');
      return $http.get('http://localhost:3000/events/' + EVENT_ID + '/fgstyle.json');
    },
    bgstyle: function() {
      return $http.get(API_ENDPOINT + EVENT_ID + '/bgstyle.json');
      return $http.get('http://localhost:3000/events/' + EVENT_ID + '/bgstyle.json');
    },
  };
});
