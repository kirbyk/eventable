// Ionic Starter App

// angular.module is a global place for creating, registering and retrieving Angular modules
// 'starter' is the name of this angular module example (also set in a <body> attribute in index.html)
// the 2nd parameter is an array of 'requires'
// 'starter.services' is found in services.js
// 'starter.controllers' is found in controllers.js
angular.module('starter', ['ionic', 'starter.controllers', 'starter.services'])

.run(function($ionicPlatform) {
  $ionicPlatform.ready(function() {
    // Hide the accessory bar by default (remove this to show the accessory bar above the keyboard
    // for form inputs)
    if (window.cordova && window.cordova.plugins && window.cordova.plugins.Keyboard) {
      cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);
      cordova.plugins.Keyboard.disableScroll(true);
    }

    if (window.StatusBar) {
      // org.apache.cordova.statusbar required
      StatusBar.styleLightContent();
    }
  });
})

.config(function($stateProvider, $urlRouterProvider) {
  // IS_WEB_PREVIEW is rendered on the rails app, but not in the native app.
  var pathPrefix = '';
  if (IS_WEB_PREVIEW) {
    pathPrefix = '/conference-template/www/';
  }

  // Ionic uses AngularUI Router which uses the concept of states
  // Learn more here: https://github.com/angular-ui/ui-router
  // Set up the various states which the app can be in.
  // Each state's controller can be found in controllers.js
  $stateProvider

  // setup an abstract state for the tabs directive
  .state('tab', {
    url: '/tab',
    abstract: true,
    templateUrl: pathPrefix + 'templates/tabs.html'
  })

  // Each tab has its own nav history stack:

  .state('tab.updates', {
    url: '/updates',
    views: {
      'tab-updates': {
        templateUrl: pathPrefix + 'templates/tab-updates.html',
        controller: 'UpdatesCtrl'
      }
    }
  })

  .state('tab.speakers', {
    url: '/speakers',
    views: {
      'tab-speakers': {
        templateUrl: pathPrefix + 'templates/tab-speakers.html',
        controller: 'SpeakersCtrl'
      }
    }
  })

  .state('tab.prizes', {
    url: '/prizes',
    views: {
      'tab-prizes': {
        templateUrl: pathPrefix + 'templates/tab-prizes.html',
        controller: 'PrizesCtrl'
      }
    }
  })

  .state('tab.schedule', {
    url: '/schedule',
    views: {
      'tab-schedule': {
        templateUrl: pathPrefix + 'templates/tab-schedule.html',
        controller: 'ScheduleCtrl'
      }
    }
  })

  // if none of the above states are matched, use this as the fallback
  $urlRouterProvider.otherwise('/tab/schedule');

});
