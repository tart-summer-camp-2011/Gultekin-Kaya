<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PaymentMethodOne
 *
 * @author TEKIN
 */
class Model_Adapter_PaymentMethodTwoAdapter implements PaymentInterface
{
    private $_paymentMethodTwo;

    function __construct($paymentMethodTwo)
    {
        $this->_paymentMethodTwo = $paymentMethodTwo;
    }

    public function doPayment(){
        $this->_paymentMethodTwo->doPaymentMethodTwo();
    }
    //put your code here
}

?>
