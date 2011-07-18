<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Cc5PaymentAdapter
 *
 * @author TEKIN
 */
class Model_Adapter_Cc5PaymentAdapter implements Model_Adapter_PaymentTransactionInterface
{
    private $cc5Transaction;
    public function __construct()
    {
        $this->cc5Transaction = new Model_Adapter_CC5PaymentTransaction();
    }

    public function doPayment($amount)
    {
        return $this->cc5Transaction->doCc5Transaction($amount);
    }
}

?>
