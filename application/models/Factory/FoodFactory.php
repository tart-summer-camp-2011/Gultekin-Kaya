<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of foodFactory
 *
 * @author TEKIN
 */
class Model_Factory_FoodFactory
{

    public static function getFood($foodType, $calori)
    {
        return new Model_Factory_Food($foodType, $calori);
    }

}

?>
