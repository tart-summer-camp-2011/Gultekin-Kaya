<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of CinnemonDecorator
 *
 * @author TEKIN
 */
class Model_Decorator_CinnemonDecorator extends Model_Decorator_CoffeeDecoratorAbstract
{

    public function __construct($coffeeToDecorate)
    {
        parent::__construct($coffeeToDecorate);
    }

    public function getCost()
    {
        return parent::getCost() + 0.3;
    }

    public function getIngridients()
    {
        return parent::getIngridients() . $this->_sperator . 'Cinnemon';
    }

}

?>
