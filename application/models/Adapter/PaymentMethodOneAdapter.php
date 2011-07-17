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
class Model_Adapter_PaymentMethodOneAdapter implements Model_Adapter_PaymentInterface
{
    private $paymentMethodOne;

    function __construct($paymentMethodOne)
    {
        $this->paymentMethodOne = $paymentMethod;
    }
    public function doPayment(){
        $this->paymentMethodOne->doPaymentMethodOne();
    }
    //put your code here
}

?>
