/*
  Point to note:
  == The server link is being defined in each controller
  == It is because the controller does not listen to any variable outside of it
  == Same happens to the reused variable of student_id from the local storage, it cannot be listened outside of the controller
  == Each variable declared in one controller cannot be used or reused in another controller, unless redeclared again
  == The local storage is within the browser and can be viewd using the developer option of the browser
  == In an app, the local storage cannot be seen since it does not store as normal files but stores within the running app
  == Json is being printed in the php files and being received with the AngularJS functions for further processing
*/
(function () {

  //Module declaration which handles the whole document with name arasma.controller
  var cont = angular.module('arasma.controller', []);

  //Begin of the AppCtrl controller in relation to the module variable wich handles the login and logout functionalities of the systems
  cont.controller('AppCtrl', function($scope, $ionicModal, $timeout, $ionicPopup, $http, $state, $ionicHistory) {

    //Server link
  	var server = "http://172.30.64.238/ARASMA/arasma-mobile/";

    //Declaration of the id which handles all the inputs (username and password)
  	$scope.loginData = {};

    //Begin of login function
  	$scope.doLogin = function() {

      //Variables declaration containing the username and password in relation to the id
  		var username = $scope.loginData.username;
  		var password = $scope.loginData.password;

      //if both fields are filled with data
  		if (username && password) {
  			
        //Link to the specific php file authenticating the user
  			link = server+"arasma-authenticate-ma.php?username="+username+"&password="+password;

        //http gets the results and determines if succeded or an error
  			$http.get(link)
  				.success(function(response) {

            //on success of the result from the link, does the below
  					$scope.user = response.records;
            //sets the login information in the local storage so that to be known as logged in person
  					sessionStorage.setItem('loggedIn_status', true);
  					sessionStorage.setItem('loggedIn_id', $scope.user.user_id);
            sessionStorage.setItem('loggedIn_name', $scope.user.username);
  					sessionStorage.setItem('loggedIn_password', $scope.user.password);

            //$ionicHistrory - A ionic and cordova built in function to do what is defined to do
  					$ionicHistory.nextViewOptions({
              //disables the animation after logging in
  						disableAnimate: true,
              //disables the back button and back option after logging in
  						disableBack: true
  					})

            //shift of the state from the login state to index state, replaces the location of login and reloads the page
  					$state.go('index', {}, {location: "replace", reload: true});

  				})

  				.error(function() {
            //on error of the result from the link, does the below
  					
            //$ionicPopup is a built in funciton for popups in intergration with the alert function of the js
  					$ionicPopup.alert({
              //prints the below on popup
  						title: 'Error!',
  						template: 'Wrong Username or Password'
  					});	
  				})

  		} else {
        //if none or one of the field is not filled with any data
  			$ionicPopup.alert({
          //returns the popup requesting to retry
  				title: 'Fields Empty',
  				template: 'One of the Field is empty or Both,<br><center>Retry again</center>'
  			});
  		}

  	}
    //End of Login funciton

    //Begin of Logout function
  	$scope.doLogout = function() {
      //clears the stored local storage information
  		sessionStorage.removeItem('loggedIn_status');
  		sessionStorage.removeItem('loggedIn_id');
      sessionStorage.removeItem('loggedIn_password');
  		sessionStorage.removeItem('loggedIn_name');

      //clears the cache and history of the app from the beginning of the use
      $ionicHistory.clearHistory();
      $ionicHistory.clearCache();

      //disables the animation and back option of the app
  		$ionicHistory.nextViewOptions({
  		  	disableAnimate: true,
  		  	disableBack: true
  		})

      //popup for notifying the succesfull logout function
  		$ionicPopup.alert({
  		  	title: 'Goodbye!',
  		  	template: '<p align="center">Successfully Logged Out</p>'
  		});	

      //after logout, change of state from where it was to the login state
  		$state.go('login', {}, {location: "replace", reload: true});
  	}
    //End of Logout function


  });
  //End of the Application Controller

  //Begin of the ShowCtrl controller
  cont.controller('ShowCtrl', function($scope, $stateParams, $http, $state, $ionicPopup) {
    
    //server declaration
    var server = "http://172.30.64.238/ARASMA/arasma-mobile/";

    //call of the id from the session stored in the local storage
    var student_id = sessionStorage.getItem('loggedIn_name');

      //if the id exists in the local storage
      if(student_id) {
        //then declaration of the link to the php file which processes the profile information
        link = server+"arasma-show-profile.php?student_id="+student_id;

        //http gets the results and determines if succeded or an error
        $http.get(link)
          .success(function(response) {
            //on success of the response of the link, gets the json data produced by the php file and attached to the showProfile variable
            $scope.showProfile=response.records;
          })

          .error(function() {
            //on error of the result from the link, does the below

            //a popup option that cant load data
            $ionicPopup.alert({
              title: 'Error',
              template: 'An Error occured, cant load data.'
            });
          });
      }

      $scope.doEdit = function(){
        var student_id = sessionStorage.getItem('loggedIn_name');

        if(student_id) {
          $state.go('edit', [], {location: "replace", reload: true});
        }
      }

  });

  //Begin of the ChangePasswordCtrl Controller
  cont.controller('ChangePasswordCtrl', function($scope, $http, $state, $ionicPopup) {

    var server = "http://172.30.64.238/ARASMA/arasma-mobile/";

    $scope.changeData = {};

    $scope.doChange = function() {

      var oldpassword = $scope.changeData.oldpassword;
      var newpassword = $scope.changeData.newpassword;
      var confirmpassword = $scope.changeData.confirmpassword;
      var student_id = sessionStorage.getItem('loggedIn_name');


      if (oldpassword && newpassword && confirmpassword && student_id) {

        if (newpassword == confirmpassword) {

          if (newpassword == "" && confirmpassword == "") {
            $ionicPopup.alert({
              title: 'Error!',
              template: 'Password fields are empty'
            });
          }

          link = server+"arasma-change-password.php?student_id="+student_id+"&oldpassword="+oldpassword+"&confirmpassword="+confirmpassword;

          $http.get(link)
            .success(function(response) {

              if(response==true) {

                $ionicPopup.alert({
                  title: 'Success',
                  template: 'Password changed successfully'
                });

                $state.go('changepassword', [], {location: "replace", reload: true});
              } else {

                $ionicPopup.alert({
                  title: 'Error!',
                  template: 'Password was not changed'
                });

              }

            })

            .error(function() {
              $ionicPopup.alert({
                title: 'Error!',
                template: 'Password was not changed'
              });
            })
        } else {

          $ionicPopup.alert({
              title: 'Error!',
              template: 'Passwords do not match'
            });

          $state.go('changepassword', [], {location: "replace", reload: true});
        }        

      } else {

        $ionicPopup.alert({
          title: 'Error!',
          template: 'Please fill in all the fields'
        });
      }

    }

  });

  cont.controller('SuppCtrl', function($scope, $http, $state, $ionicPopup) {

    var server = "http://172.30.64.238/ARASMA/arasma-mobile/";

    $scope.suppData = {};

    $scope.doSupp = function() {

      var transaction = $scope.suppData.transactionID;
      var ammount = $scope.suppData.ammount;
      var branch = $scope.suppData.branch;
      var date = $scope.suppData.transDate;
      var student_id = sessionStorage.getItem('loggedIn_name');


      if (transaction && ammount && branch && student_id && date) {

          link = server+"arasma-supplementary.php?transaction="+transaction+"&amount="+ammount+"&branch="+branch+"&student_id="+student_id+"&date="+date;

          $http.get(link)
            .success(function(response) {

              if(response==true) {

                $state.go('confirmview', [], {location: "replace", reload: true});

              } else {

                $ionicPopup.alert({
                  title: 'Error!',
                  template: 'elseDid not apply for Supplementary'
                });

              }

            })

            .error(function() {
              $ionicPopup.alert({
                title: 'Error!',
                template: 'Did not apply for Supplementary'
              });
            })

      } else {

        $ionicPopup.alert({
          title: 'Error!',
          template: 'Please fill in all the fields'
        });
      }

    }

    $scope.doConfirm = function() {

      var subjects = $scope.suppData.subjects;
      var student_id = sessionStorage.getItem('loggedIn_name');


      if (subjects && student_id) {

          link2 = server+"arasma-supplementary.php?subjects="+subjects+"&student_id="+student_id;

          $http.get(link2)
            .success(function(response) {

              if(response==true) {
                $ionicPopup.alert({
                  title: 'Success',
                  template: 'Successfully applied for Supplementary'
                });

                $state.go('supplementary', [], {location: "replace", reload: true});                
              } else {
                $ionicPopup.alert({
                  title: 'Error!',
                  template: 'elseDid not apply for Supplementary'
                });
              }

            })

            .error(function() {
              $ionicPopup.alert({
                title: 'Error!',
                template: 'errorDid not apply for Supplementary'
              });
            })

      } else {

        $ionicPopup.alert({
          title: 'Error!',
          template: 'Please fill in all the fields'
        });
      }

    }

    $scope.appData = {};

    $scope.doAppeal = function() {

      var transaction = $scope.appData.transactionID;
      var ammount = $scope.appData.ammount;
      var branch = $scope.appData.branch;
      var date = $scope.appData.transDate;
      var student_id = sessionStorage.getItem('loggedIn_name');


      if (transaction && ammount && branch && student_id && date) {

          link = server+"arasma-appeal.php?transaction="+transaction+"&amount="+ammount+"&branch="+branch+"&student_id="+student_id+"&date="+date;

          $http.get(link)
            .success(function(response) {

              if(response==true) {

                $state.go('appconfirm', [], {location: "replace", reload: true});

              } else {

                $ionicPopup.alert({
                  title: 'Error!',
                  template: 'Did not Appeal'
                });

              }

            })

            .error(function() {
              $ionicPopup.alert({
                title: 'Error!',
                template: 'Did not Appeal'
              });
            })

      } else {

        $ionicPopup.alert({
          title: 'Error!',
          template: 'Please fill in all the fields'
        });
      }

    }

    $scope.doConfirmAppeal = function() {

      var subjects = $scope.appData.subjects;
      var reason = $scope.appData.reason;
      var student_id = sessionStorage.getItem('loggedIn_name');


      if (subjects && student_id && reason) {

          link = server+"arasma-appeal.php?subjects="+subjects+"&student_id="+student_id+"&reason="+reason;

          $http.get(link)
            .success(function(response) {

              if(response==true) {
                $ionicPopup.alert({
                  title: 'Success',
                  template: 'Successfully Appealed'
                });

                $state.go('appeal', [], {location: "replace", reload: true});                
              } else {
                $ionicPopup.alert({
                  title: 'Error!',
                  template: 'Did not Appeal'
                });
              }

            })

            .error(function() {
              $ionicPopup.alert({
                title: 'Error!',
                template: 'Did not Appeal'
              });
            })

      } else {

        $ionicPopup.alert({
          title: 'Error!',
          template: 'Please fill in all the fields'
        });
      }

    }

  });

  cont.controller('TranscriptCtrl', function($scope, $http, $state, $ionicPopup) {
    
    var server = "http://172.30.64.238/ARASMA/arasma-mobile/";

    var student = sessionStorage.getItem('loggedIn_name');

    if(student) {
      link = server+"arasma-student-transcript.php?student="+student;

      $http.get(link)
        .success(function(response) {
          $scope.showTranscript=response.recorde;
        })

        .error(function() {
          $ionicPopup.alert({
            title: 'Error!',
            template: 'Please complete your profile '
          });
        });
    }

    $scope.doRequest = function() {

      var student_id = sessionStorage.getItem('loggedIn_name');


      if (student_id) {

          link = server+"arasma-transcript.php?studentID="+student_id;

          $http.get(link)
            .success(function(response) {

              if(response==true) {
                $ionicPopup.alert({
                  title: 'Success',
                  template: 'Transcript Request sent successfully'
                });

                $state.go('transcript', [], {location: "replace", reload: true});                
              } else {
                $ionicPopup.alert({
                  title: 'Error!',
                  template: 'Request was not sent'
                });
              }

            })

            .error(function() {
              $ionicPopup.alert({
                title: 'Error!',
                template: 'Request was not sent'
              });
            })

      } else {

        $ionicPopup.alert({
          title: 'Error!',
          template: 'You were not logged in for this action to be succesfull'
        });
      }

    }

  });

  cont.controller('ResultsCtrl', function($scope, $http, $state, $ionicPopup) {

    var server = "http://172.30.64.238/ARASMA/arasma-mobile/";

    var student_id = sessionStorage.getItem('loggedIn_name');
    var student_id2 = sessionStorage.getItem('loggedIn_name');
    var student_id3 = sessionStorage.getItem('loggedIn_name');
    var student_id4 = sessionStorage.getItem('loggedIn_name');
    var student_id5 = sessionStorage.getItem('loggedIn_name');
    var student_id6 = sessionStorage.getItem('loggedIn_name');

      if(student_id) {
        link = server+"arasma-show-results.php?student_id="+student_id;

        $http.get(link)
          .success(function(response) {
            $scope.showResult=response.record;
          })

          .error(function() {
            $ionicPopup.alert({
              title: 'Error',
              template: 'Results cannot be loaded'
            });
          });
      }

      if(student_id && student_id2) {
        linkf1 = server+"arasma-show-results.php?id="+student_id+"&id2="+student_id2;

        $http.get(linkf1)
          .success(function(response) {
            $scope.showResultf1=response.recordf1;
          })

          .error(function() {
            $ionicPopup.alert({
              title: 'Error',
              template: 'Results cannot be loaded'
            });
          });
      }

      if(student_id2) {
        link2 = server+"arasma-show-results.php?student_id2="+student_id2;

        $http.get(link2)
          .success(function(response) {
            $scope.showResult2=response.record2;
          })

          .error(function() {
            $ionicPopup.alert({
              title: 'Error',
              template: 'Results cannot be loaded'
            });
          });
      }

      if(student_id3) {
        link3 = server+"arasma-show-results.php?student_id3="+student_id3;

        $http.get(link3)
          .success(function(response) {
            $scope.showResult3=response.record3;
          })

          .error(function() {
            $ionicPopup.alert({
              title: 'Error',
              template: 'Results cannot be loaded'
            });
          });
      }

      if(student_id4) {
        link4 = server+"arasma-show-results.php?student_id4="+student_id4;

        $http.get(link4)
          .success(function(response) {
            $scope.showResult4=response.record4;
          })

          .error(function() {
            $ionicPopup.alert({
              title: 'Error',
              template: 'Results cannot be loaded'
            });
          });
      }

      if(student_id5) {
        link5 = server+"arasma-show-results.php?student_id5="+student_id5;

        $http.get(link5)
          .success(function(response) {
            $scope.showResult5=response.record5;
          })

          .error(function() {
            $ionicPopup.alert({
              title: 'Error',
              template: 'Results cannot be loaded'
            });
          });
      }

      if(student_id6) {
        link6 = server+"arasma-show-results.php?student_id6="+student_id6;

        $http.get(link6)
          .success(function(response) {
            $scope.showResult6=response.record6;
          })

          .error(function() {
            $ionicPopup.alert({
              title: 'Error',
              template: 'Results cannot be loaded'
            });
          });
      }
  });

  cont.controller('RegistrationCtrl', function($scope, $http, $state, $ionicPopup) {
    
    var server = "http://172.30.64.238/ARASMA/arasma-mobile/";

    var student_id = sessionStorage.getItem('loggedIn_name');
    var student_id2 = sessionStorage.getItem('loggedIn_name');
    var student_id3 = sessionStorage.getItem('loggedIn_name');

      if(student_id) {
        link = server+"arasma-course-registration.php?student_id="+student_id;

        $http.get(link)
          .success(function(response) {
            $scope.showProg=response.record;
          })

          .error(function() {
            $ionicPopup.alert({
              title: 'Error',
              template: 'An Error occured, cant load page.'
            });
          });
      }

      if(student_id2) {
        link2 = server+"arasma-course-registration.php?student_id2="+student_id2;

        $http.get(link2)
          .success(function(response) {
            $scope.showCore=response.records;
          })

          .error(function() {
            $ionicPopup.alert({
              title: 'Error',
              template: 'An Error occured, cant load page.'
            });
          });
      }

      if(student_id3) {
        link3 = server+"arasma-course-registration.php?student_id3="+student_id3;

        $http.get(link3)
          .success(function(response) {
            $scope.showOption=response.recordz;
          })

          .error(function() {
            $ionicPopup.alert({
              title: 'Error',
              template: 'An Error occured, cant load page.'
            });
          });
      }

  });

  cont.controller('SideCtrl', function($scope, $ionicSideMenuDelegate){
      $ionicSideMenuDelegate.canDragContent(false)
      $scope.date = new Date();
  });



}());