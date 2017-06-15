(function () {
  var app = angular.module('arasma', ['ionic', 'arasma.controller', 'arasma.collapse']);


  app.config(function($stateProvider, $urlRouterProvider) {

    $stateProvider.state('login', {
      url: '/login',
      abstract: false,
      cache: false,
      templateUrl: 'login.html',
      controller: 'SideCtrl'
    });

    $stateProvider.state('results', {
      url: '/results',
      abstract: false,
      cache: false,
      controller: 'AppCtrl',
      templateUrl: function(){
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/course_results.html';
        } else {
          return 'login.html';
        }
      }
    });

    $stateProvider.state('registration', {
      url: '/registration',
      abstract: false,
      cache: false,
      controller: 'AppCtrl',
      templateUrl: function(){
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/course_registration.html';
        } else {
          return 'login.html';
        }
      }
    });

    $stateProvider.state('transcript', {
      url: '/transcript',
      abstract: false,
      cache: false,
      controller: 'AppCtrl',
      templateUrl: function(){
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/request_transcript.html';
        } else {
          return 'login.html';
        }
      }
    });

    $stateProvider.state('about', {
      url: '/about',
      abstract: false,
      cache: false,
      controller: 'AppCtrl',
      templateUrl: function(){
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/about.html';
        } else {
          return 'login.html';
        }
      }
    });

    $stateProvider.state('appeal', {
      url: '/appeal',
      abstract: false,
      cache: false,
      controller: 'SuppCtrl',
      templateUrl: function(){
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/appeal.html';
        } else {
          return 'login.html';
        }
      }
    });

    $stateProvider.state('supplementary', {
      url: '/supplementary',
      abstract: false,
      cache: false,
      controller: 'SuppCtrl',
      templateUrl: function(){
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/supplementary.html';
        } else {
          return 'login.html';
        }
      }
    });

    $stateProvider.state('confirmview', {
      url: '/confirmview',
      abstract: false,
      cache: false,
      controller: 'SuppCtrl',
      templateUrl: function(){
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/confirmview.html';
        } else {
          return 'login.html';
        }
      }
    });

    $stateProvider.state('appconfirm', {
      url: '/appconfirm',
      abstract: false,
      cache: false,
      controller: 'SuppCtrl',
      templateUrl: function(){
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/appconfirm.html';
        } else {
          return 'login.html';
        }
      }
    });

    $stateProvider.state('myprofile', {
      url: '/myprofile',
      controller: 'AppCtrl',
      templateUrl: function(){
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/myprofile.html';
        } else {
          return 'login.html';
        }
      }
    });

    $stateProvider.state('changepassword', {
      url: '/changepassword',
      abstract: false,
      cache: false,
      controller: 'AppCtrl',
      templateUrl: function() {
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/change_password.html';
        } else {
          return 'login.html';
        }
      }
    });

    $stateProvider.state('index', {
      url: '/index',
      abstract: false,
      cache: false,
      controller: 'AppCtrl',
      templateUrl: function() {
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/index.html';
        } else {
          return 'login.html';
        }
        
      }
    });

    $stateProvider.state('edit', {
      url: '/edit/',
      abstract: false,
      cache: false,
      controller: 'AppCtrl',
      templateUrl: function() {
        if(sessionStorage.getItem('loggedIn_status')) {
          return 'student/edit.html';
        } else {
          return 'login.html';
        }
        
      }
    });

    $urlRouterProvider.otherwise('/login');
  });


  app.run(function($ionicPlatform) {
    $ionicPlatform.ready(function() {
      if(window.cordova && window.cordova.plugins.Keyboard) {
        
        cordova.plugins.Keyboard.hideKeyboardAccessoryBar(true);

        cordova.plugins.Keyboard.disableScroll(true);
      }
      if(window.StatusBar) {
        StatusBar.styleDefault();
      }
    });
  })

}());