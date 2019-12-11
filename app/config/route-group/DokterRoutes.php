<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class DokterRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'dokter',
        ]);

        $this->setPrefix('/dokter');

        $this->addGet(
            '/home',
            [
                'action' => 'home',
            ]
        );
        
    }
}