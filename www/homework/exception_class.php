<?php

class User {
    public function load(int $id) {
        if ($id == 17) {
            throw new Exception("Пользователь не найден");
        }
    }
    
    public function save(array $data): bool {
        return (1 == rand(0, 1));
    }
}

class UserFormValidator {
    public function validate(array $data) {
        if (strlen($data["name"]) == 0) {
            throw new Exception("Имя не может быть пустым");
        }
        if ((int)$data["age"] < 18) {
            throw new Exception("Возраст должен быть более 18 лет");
        }
        try {
            $res = preg_match('/^\S+@\S+\.\S+$/', $data["email"]);
        } catch (Exception $e) {
            throw new Exception("Неверный формат email");
        }
        if ($res === 0) {
            throw new Exception("Неверный формат email");
        }
    }
}

?>
