<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PaypalTransaction
 *
 * @author TEKIN
 */
class Model_Adapter_PaypalPaymentTransaction
{
    function doPaypalTransaction($amount, $userName)
    {
        return "$userName done paypal transaction with an amount $amount";
    }
}

?>
