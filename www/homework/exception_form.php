<p>Пользователь:</p>
<form action="exception_action.php" method="post">
    <label>Id<input type="text" name="id" value=<?php if (isset($id)) echo($id); ?>></label>
    <label>Имя<input type="text" name="name" value=<?php if (isset($name)) echo($name); ?>></label>
    <label>Возраст<input type="text" name="age" value=<?php if (isset($age)) echo($age); ?>></label>
    <label>Email<input type="text" name="email" vallue=<?php if (isset($email)) echo($email); ?>></label>
    <input type="submit" value="Отправить">
</form>
