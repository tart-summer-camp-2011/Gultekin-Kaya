<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of DecoratorAbstract
 *
 * @author TEKIN
 */
class Model_Decorator_CoffeeDecoratorAbstract implements Model_Decorator_CoffeeInterface
{
    private $_coffeeToDecorate = null;
    protected $_sperator = ' with ';

    public function __construct($coffeeToDecorate)
    {
        if($coffeeToDecorate instanceof Model_Coffee_CoffeeInterface)
        {
            $this->_coffeeToDecorate = $coffeeToDecorate;
        }
    }
    public function getCost()
    {
         return $this->_coffeeToDecorate->getCost();
    }

    public function getIngridients()
    {
        return $this->_coffeeToDecorate->getIngridients();
    }
}

?>
