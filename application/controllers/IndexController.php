<?php

class IndexController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        die('foo');
    }

    public function factoryAction()
    {
        $myFood = Model_Factory_FoodFactory::getFood("icecek", 20);
        $this->view->assign("food", $myFood);
    }

    public function singletonAction()
    {
        $registry = Model_Singleton_Registry::getInstance();
        $registry->name = 'tekin';

        $this->view->assign('myname', $registry->name);
    }

    public function adapterAction()
    {
        $cc5adapter = new Model_Adapter_Cc5PaymentAdapter();
        $cTrans = new Model_Adapter_PaymentTransaction($cc5adapter);

        $this->view->assing('ctans',$cTrans->doPayment(1000));

        $paypalAdapter = new Model_Adapter_PaypalPaymentAdapter();
        $pTrans = new Model_Adapter_PaymentTransaction($paypalAdapter);

        $this->view->assign('ptrans',$pTrans->doPayment(3000, 'firat'));

    }

    public function doPayments(Model_Adapter_PaymentInterface $adater)
    {
        $adapter->doPayment();
    }

    public function decoratorAction()
    {
        $simpleCoffe = new Model_Coffee_SimpleCoffee();
        $coffeeWithMilk = new Model_Coffee_MilkDocotator($simpleCoffe);
        $coffeeWithCreme = new Model_Coffee_CremeDecorator($simpleCoffe);
        $coffeeWithCremeAndCinnemon = new Model_Coffee_CinnemonDecorator($coffeeWithCreme);


        $this->view->assign('coffee', $coffeeWithCremeAndCinnemon);
    }

    public function strategyAction()
    {
        $myQuickSorter = new Model_Strategy_StrategyContext('quick');
        $mybubbleSorter = new Model_Strategy_StrategyContext('bubble');
        $myInsertionSorter = new Model_Strategy_StrategyContext('insertion');

        $arr = array(12, 14, 34, 56, 23, 45, 34, 56, 56);

        $quickSortedArr = $mySorter->sort($arr);
        $bubbleSortedArr = $mySorter->sort($arr);
        $insertionSortedArr = $mySorter->sort($arr);


        $arrays = array(
            'unsorted'=>$arr,
            'quicksorted'=> $quickSortedArr,
            'insertionsorted'=> $insertionSortedArr,
            'bubblesorted'=> $bubbleSortedArr
            );

        $this->view->assign('myarrays', $arrays);


    }

}

?>
