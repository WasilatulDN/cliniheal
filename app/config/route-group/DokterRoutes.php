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

        $this->addGet(
            '/list-pasien',
            [
                'action' => 'listPasien',
            ]
        );

        $this->addGet(
            '/create-rekam-medis/{id}',
            [
                'action' => 'createRekamMedis',
            ]
        );

        $this->addPost(
            '/store-rekam-medis',
            [
                'action' => 'storeRekamMedis',
            ]
        );

        $this->addGet(
            '/rekam-medis',
            [
                'action' => 'rekamMedis',
            ]
        );

        $this->addGet(
            '/list-rekam-medis',
            [
                'action' => 'listRekamMedis',
            ]
        );

        $this->addGet(
            '/detail-rekam-medis/{id}',
            [
                'action' => 'detailRekamMedis',
            ]
        );
        
    }
}