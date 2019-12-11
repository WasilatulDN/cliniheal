<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;

class IndexController extends Controller
{
    public function indexAction()
    {
        $_isIbu = $this->session->get('auth')['tipe'];
        if ($_isIbu == 1){
            return $this->response->redirect('ibu/home');
        }elseif($_isIbu == 2){
            return $this->response->redirect('posyandu/home');
        }
    }

    public function show404Action()
    {

    }


}