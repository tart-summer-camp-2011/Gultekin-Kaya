<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    protected function initDoctype()
    {
        $this->bootstrap('view');
        $view = $this->getResource('view');
        $view->doctype('XHTML1_STRICT');
    }
}
?>
