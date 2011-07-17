<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of food
 *
 * @author TEKIN
 */
class Model_Factory_Food
{
    private  $_foodType;
    private  $_quantity;
    private  $_calori;

    function __construct($foodType, $calori)
    {
        $this->_foodType = $foodType;
        $this->_calori = $calori;

    }

    public function setQuantity($quantity)
    {
        $this->_quantity = $quantity;
    }

    public function getCalori()
    {
        return $this->_calori;
    }
}

?>
