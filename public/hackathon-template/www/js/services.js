angular.module('starter.services', [])

.factory('AppData', function($http) {
  return {
    updateItems: function() {
      // TODO: don't hard-code event number 1
      // return $http.get('http://localhost:3000/events/1/update.json');
      return {
        then: function(f) {
          f({data:[
            {
              "id": 2,
              "description": "Cookies",
              "title": "asdf"
            },
            {
              "id": 3,
              "description": "aynf;njygn",
              "title": "tndnhyng"
            }
          ]});
        }
      };
    },
    mentorItems: function() {
      return {
        then: function(f) {
          f({data:[
            {
              "id": 2,
              "name": "Sergey",
              "company": "google",
              "skills": "coding"
            }
          ]});
        }
      };
      // return $http.get('http://localhost:3000/events/1/mentor.json');
    },
    prizeItems: function() {
      return {
        then: function(f) {
          f({data:[
            {
              "id": 2,
              "company": "google",
              "description": "description",
              "award": "award"
            }
          ]});
        }
      };
      // return $http.get('http://localhost:3000/events/1/prize.json');
    },
    scheduleItems: function() {
      return {
        then: function(f) {
          f({data:[
            {
              "id": 2,
              "description": "description",
              "start_time": "12/03/2015",
              "end_time": "12/04/2015",
              "title": "title"
            }
          ]});
        }
      };
      // return $http.get('http://localhost:3000/events/1/schedule.json');
    }
  };
});
