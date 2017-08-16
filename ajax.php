<?php
//                   db name
$dsn = 'mysql:dbname=angular_test;host=127.0.0.1';
$user = 'root';
$password = '';
try {
    $dbh = new PDO($dsn, $user, $password);

    if(isset($_POST['user'])){
        $user = json_decode($_POST['user']);
        $sql = 'INSERT INTO user SET login = :login,
                password = :password, email = :email';

        $sth = $dbh->prepare($sql);

        $sth->execute(array(':login' => $user->login,
                            ':password' => $user->password,
                            ':email' => $user->email));
    }    

    if(isset($_POST['delete'])){
        $id = $_POST['delete'];
        $sql = 'DELETE from user where id = :id';
        $sth = $dbh->prepare($sql);
        $sth->execute(array(':id' => $id));
    }

    $sql = 'SELECT `id`, `login`, `password`, `email`, `status` FROM user';
    $st = $dbh->query($sql);
    $results = $st->fetchAll(PDO::FETCH_ASSOC);
    echo json_encode($results);
} catch (PDOException $e) {
    echo 'Подключение не удалось: ' . $e->getMessage();
}
