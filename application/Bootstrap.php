<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
    public function _initModuleAutoloader()
    {
        $moduleLoader = new Zend_Application_Module_Autoloader(array(
            'namespace' => "",
            'basePath' => APPLICATION_PATH
        ));
    }

}

