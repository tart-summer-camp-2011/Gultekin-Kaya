<?php

class Model_Singleton_Registry
{

    /**
     * @var Model_Singleton_Registry
     */
    private static $_instance;
    /**
     * @var array
     */
    private static $_valArray = array();

    private static function __construct()
    {

    }

    public static function getInstance()
    {
        if(!($this->_instance instanceof Model_Singleton_Registry)) {
             $this->_instance = new Model_Singleton_Registry();
         }

        return $this->_instance;
    }

    public static function __set($name, $val)
    {
        if (!($this->_valArray[$name])) {
            $this->_valArray[$name] = $val;
        }
    }

    public static function __get($name)
    {
        return $this->_valArray[$name];
    }

}

?>
