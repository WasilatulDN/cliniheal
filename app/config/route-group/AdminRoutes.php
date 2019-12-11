<?php

use Phalcon\Mvc\Router\Group as RouterGroup;

class AdminRoutes extends RouterGroup
{
    public function initialize()
    {
        $this->setPaths([
            'controller' => 'admin',
        ]);

        $this->setPrefix('/admin');

        $this->addGet(
            '/home',
            [
                'action' => 'home',
            ]
        );

        $this->addGet(
            '/list-antrian',
            [
                'action' => 'listAntrian',
            ]
        );

        $this->addPost(
            '/search-pasien',
            [
                'action' => 'searchPasien',
            ]
        );

        $this->addGet(
            '/add-pasien',
            [
                'action' => 'addPasien',
            ]
        );

        $this->addPost(
            '/store-pasien',
            [
                'action' => 'storePasien',
            ]
        );

        $this->addGet(
            '/update-antrian/{id}',
            [
                'action' => 'updateAntrian',
            ]
        );

        $this->addGet(
            '/daftar-pasien',
            [
                'action' => 'daftarPasien',
            ]
        );

        $this->addGet(
            '/list-pasien',
            [
                'action' => 'listPasien',
            ]
        );
        
    }
}