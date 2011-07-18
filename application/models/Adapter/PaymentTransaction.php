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
class Model_Adapter_PaymentTransaction
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
            return $this->adaptor->doPaymentTransaction ($amount, $userInfo);
        } else {
            return $this->adaptor->doPaymentTransaction($amount);
        }
    }

    public function setUserInfo($userInfo)
    {
        $this->userInfo = $userInfo;
    }
}

?>
