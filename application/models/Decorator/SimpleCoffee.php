<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of SimpleCoffee
 *
 * @author TEKIN
 */
class Model_Decorator_SimpleCoffee implements Model_Decorator_CoffeeInterface
{
    function getCost()
    {
        return 3;
    }

    function getIngridients()
    {
        return 'Coffee ';
    }
}

?>
