<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of UserModel
 *
 * @author TEKIN
 */
class UserModel
{
    public function getCurrentName($name)
    {
        return Model_Singleton_Registry::getInstance()->__get($name);
    }
}

?>
