<?php

class Product {
  private string $name;
  private float $price;

  public function __construct(string $name, float $price) {
    $this->name = $name;
    $this->price = $price;
  }

  public function getName() {
    return $this->name;
  }

  public function getPrice() {
    return $this->price;
  }
}

class BasketPosition {
  private Product $product;
  private int $quantity;

  public function __construct(Product $product, int $quantity) {
    $this->product = $product;
    $this->quantity = $quantity;
  }

  public function getProduct() {
    return $this->product;
  }

  public function getQuantity() {
    return $this->quantity;
  }

  public function getPrice() {
    return $this->quantity * $this->product->getPrice();
  }
}

class Basket {
  private array $basket;

  function __construct() {
    $this->basket = [];
  }

  public function addProduct(Product $product, int $quantity) {
    array_push($this->basket, new BasketPosition($product, $quantity));
  }

  public function getPrice() {
    $sum = 0;
    foreach ($this->basket as $value) {
      $sum += $value->getQuantity() * $value->getProduct()->getPrice();
    }
    return $sum;
  }

  public function describe() {
    foreach ($this->basket as $value) {
      printf("%s - %s - %s\n", $value->getProduct()->getName(), $value->getProduct()->getPrice(), $value->getQuantity());
    }
  }

} 

class Order {
  private Basket $basket;
  private float $ship_cost;

  function __construct(Basket $basket, float $ship_cost) {
    $this->basket = $basket;
    $this->ship_cost = $ship_cost;
  }

  public function getBusket() {
    return $this->basket;
  }

  public function getPrice() {
    return $this->basket->getPrice() + $this->ship_cost;
  }
}

?>

