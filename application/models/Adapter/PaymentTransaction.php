<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of PaymentTransaction
 *
 * @author TEKIN
 */
class PaymentTransaction
{
    private $adaptor;
    private $userInfo;

    public function __construct($adapter)
    {
        if ($adapter instanceof Model_Adapter_PaymentTransactionInterface) {
            $this->adaptor = $adapter;
        }
    }

    public function doPayment($amount)
    {
        if(isset($userIn )){
            $this->adaptor->doPaymentTransaction ($amount, $userInfo);
        } else {
            $this->adaptor->doPaymentTransaction($amount);
        }
    }

    public function setUserInfo($userInfo)
    {
        $this->userInfo = $userInfo;
    }
}

?>
