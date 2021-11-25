<?php

include 'istore_class.php';
 
$basket = new Basket();
$basket->addProduct(new Product("apple", 45.96), 3);
$basket->addProduct(new Product("case", 5.99), 1);
$basket->addProduct(new Product("pen", 0.99), 15);
$order = new Order($basket, 120);
printf("Заказ, на сумму: %s Состав:\n", $order->getPrice());
$basket->describe();

?>

