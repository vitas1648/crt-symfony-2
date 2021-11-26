<?php
    include 'header.php';
    include 'exception_class.php';
    $error = false;
    if (isset($_POST)) {
        $id = $_POST['id'];
        $name = $_POST['name'];
        $age = $_POST['age'];
        $email = $_POST['email'];
        $user = new User();
        try {
            $user->load($_POST['id']);
        } catch (Exception $e) {
            $error = true;
            echo $e->getMessage(), "\n";
#            include 'exception_form.php';
        }
        if (!$error) {
            $error_validate = false;
            $ufv = new UserFormValidator();
            $data = ["id" => $id, "name" => $name, "age" => $age, "email" => $email];
            try {
                $ufv->validate($data);
            } catch (Exception $e) {
                $error_validate = true;
                echo $e->getMessage(), "\n";
#                include 'exception_form.php';
            }
            if (!$error_validate) {
                if ($user->save($data)) {
                    echo "Форма успешно сохранена\n";
                    $id="";
                    $name="";
                    $age="";
                    $email="";
                } else {
                    echo "Ошибка сохранения формы\n";
                }
            }
        }
        include 'exception_form.php';
    }
?>
