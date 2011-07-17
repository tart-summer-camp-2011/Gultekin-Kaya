<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of StrategyContext
 *
 * @author TEKIN
 */
class Model_Strategy_StrategyContext
{
    private $_sorter;
    //private $_arrToSort;



    public function __construct($sorter)
    {
      //  $this->_arrToSort = $arrToSort;


        switch($sorter)
        {
            case 'quick':
                $this->_sorter = new Model_Strategy_QuickSort();
                break;
            case 'bubble':
                $this->_sorter = new Model_Strategy_BubbleSort();
                break;
            case 'insertion':
                $this->_sorter = new Model_Strategy_InsertionSort();
                break;
            default:
                break;
        }
    }

    public function sort($arr)
    {
        return $this->_sorter->sort($arr);
    }

    //put your code here
}

?>
