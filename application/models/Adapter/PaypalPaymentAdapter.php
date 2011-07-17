<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PaypalPaymentAdapter
 *
 * @author TEKIN
 */
class Model_Adapter_PaypalPaymentAdapter implements Model_Adapter_PaypalTransactionInterface
{
    private $paypalPayment;

    public function __construct()
    {
        $this->paypalPayment = new Model_Adapter_PaypalPaymentTransaction();
    }

    public function doPayment($amount, $userInfo)
    {
        $this->paypalPayment->doPaypalTransaction($amount, $userInfo);
    }

}

?>
