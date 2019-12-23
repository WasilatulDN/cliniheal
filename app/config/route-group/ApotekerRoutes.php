<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class ApotekerRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'apoteker',
        ]);

        $this->setPrefix('/apoteker');

        $this->addGet(
            '/home',
            [
                'action' => 'home',
            ]
        );

        $this->addGet(
            '/list-resep',
            [
                'action' => 'listResep',
            ]
        );

        $this->addGet(
            '/update-resep/{id}',
            [
                'action' => 'updateResep',
            ]
        );
        
    }
}