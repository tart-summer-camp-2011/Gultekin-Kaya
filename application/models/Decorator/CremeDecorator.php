<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CremeDecorator
 *
 * @author TEKIN
 */
class Model_Decorator_CremeDecorator extends Model_Decorator_CoffeeDecoratorAbstract
{
    public function __construct($coffeeToDecorate)
    {
        parent::__construct($coffeeToDecorate);
    }

    public function getCost()
    {
        return parent::getCost() + 0.6;
    }

    public function getIngridients()
    {
        return parent::getIngridients() . $this->_sperator . 'Creme';
    }
    //put your code here
}

?>
