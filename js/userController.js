app.controller('userCtrl', ($scope, $http) => {

    let original = [];

    $scope.id = '';
    $scope.login = '';
    $scope.password = '';
    $scope.email = '';
    $scope.status = '';

    $http.get("ajax.php")
        .then((response) => {
            original = $scope.users = response.data;
        });

    $scope.add = (user) => {    
        $scope.error = '';
        $scope.success = '';
        //const emailRegEx = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        if(user.email.length && user.password.length > 6 && user.login.length){
            $http(
                {
                    method: 'POST',
                    url: 'ajax.php',
                    data: 'user=' + JSON.stringify(user), //forms user object
                    headers: {'Content-Type': 'application/x-www-form-urlencoded'}
                }
            ).success((response) => {
                original = $scope.users = response;
                $scope.success = 'User have been added';
            }).error((response) => {
                $scope.error =  response;
            });
        }
        else{
            $scope.error = 'Password must be more then 6 symbols length';
        }
    }

    $scope.myFilter = () => {
        $scope.users = original.filter(function (cur, index) {

            let keep = true;
            //status
            if (($scope.status != 'all') && cur.status != $scope.status)
                keep = false;

            //login
            if ($scope.login.length > 0 && cur.login.toString().indexOf($scope.login) < 0) 
                keep = false;

            //password
            if ($scope.password.length > 0 && cur.password.toString().indexOf($scope.password) < 0) 
                keep = false;

            //email
            if ($scope.email.length > 0 && cur.email.toString().indexOf($scope.email) < 0) 
                keep = false;

            //id
            if ($scope.id.length > 0 && cur.id.toString().indexOf($scope.id) < 0)
                keep = false;

            return keep;
        });
    }

    $scope.delete = (id) => { 
        $scope.error = "";
        $scope.success = "";
        $http({
                method: 'POST',
                url: 'ajax.php',
                data: 'delete=' + id, //forms user object
                headers: {'Content-Type': 'application/x-www-form-urlencoded'}
            }).success((response) => {
                original = $scope.users = response;
                $scope.success = 'User have been deleted';
            }).error((response) => {
                $scope.error =  response;
            });
    }
});
