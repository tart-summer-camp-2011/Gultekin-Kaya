<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of InsertionSort
 *
 * @author TEKIN
 */
class Model_Sort_InsertionSort implements Model_Strategy_StrategyInterface
{

    public function sort($array)
    {
        for ($j = 1; $j < count($array); $j++) {
            $temp = $array[$j];
            $i = $j;
            while (($i >= 1) && ($array[$i - 1] > $temp)) {
                $array[$i] = $array[$i - 1];
                $i--;
            }
            $array[$i] = $temp;
        }
        return $array;
    }

}

?>
