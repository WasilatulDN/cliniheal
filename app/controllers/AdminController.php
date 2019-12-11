<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use Phalcon\Mvc\Dispatcher;
use App\Validation\PasienValidation;
use App\Events\AdminProtectController;

class AdminController extends Controller
{
    public function homeAction()
    {

    }

    public function listAntrianAction()
    {
        $antrians = Antrian::find();
        $data = array();
        
            foreach ($antrians as $antrian) {
                $idnya = $antrian->idPasien;
                $pasien = Pasien::findFirst("idPasien='$antrian->idPasien'");
                    if($antrian->status == 1)
                    {
                        $status = "antri";
                    }
                    else{
                        $status = "selesai";
                    }
                    $data[] = array(
                        'nama' => $pasien->nama,
                        'alamat' => $pasien->alamat,
                        'status' => $status,
                        'link' => $antrian->idAntrian,
                    );
            }
            $content = json_encode($data);
            return $this->response->setContent($content);
    }

    public function searchPasienAction()
    {
        $nik = $this->request->getPost('nik');
        $pasien = Pasien::findFirst("nik='$nik'");
        
        if($pasien){
            $antrian = new Antrian();
            $antrian->idPasien = $pasien->idPasien;
            $antrian->status = 1;

            if($antrian->save()){
                $this->flashSession->success('Berhasil menambahkan antrian');
                return $this->response->redirect('admin/home');
            }
        }
        else{
            $this->flashSession->error('NIK tidak ditemukan');
            return $this->response->redirect('admin/home');
        }
    }

    public function addPasienAction()
    {
        $this->view->messages = $this->messages;
    }

    public function storePasienAction()
    {
        $pasien = new Pasien();
        $pasien->nama = $this->request->getPost('namaPasien');
        $pasien->jkel = $this->request->getPost('jkel');
        $pasien->tgllahir = $this->request->getPost('tgllahir');
        $pasien->alamat = $this->request->getPost('alamat');
        $pasien->tlp = $this->request->getPost('telepon');
        $pasien->nik = $this->request->getPost('nik');

        $val = new PasienValidation();
        $messages = $val->validate($_POST);

        if (count($messages)) {
            foreach ($messages as $m) {
                $this->messages[$m->getField()] = $m;
            }
            $this->dispatcher->forward(['action'=>'addPasien']);
        }
        else{
            $pasien->save();
            $this->flashSession->success('Berhasil menambahkan pasien baru');
            return $this->response->redirect('admin/daftar-pasien');
        }
    }

    public function updateAntrianAction($id)
    {
        $antrian = Antrian::findFirst("idAntrian='$id'");

        if($antrian){
            $antrian->status=2;

            if($antrian->save()){
                $this->flashSession->success('Berhasil mengupdate antrian');
                return $this->response->redirect('admin/home');
            }  
        }
    }

    public function deleteAntrianAction($id)
    {
        $antrian = Antrian::findFirst("idAntrian='$id'");
        if($antrian){
            if($antrian->delete()){
                $this->flashSession->success('Berhasil menghapus antrian');
                return $this->response->redirect('admin/home');
            }
        }
    }

    public function daftarPasienAction()
    {

    }

    public function listPasienAction()
    {
        $pasiens = Pasien::find();
        $data = array();
        
            foreach ($pasiens as $pasien) {
                    $data[] = array(
                        'nik' => $pasien->nik,
                        'nama' => $pasien->nama,
                        'alamat' => $pasien->alamat,
                        'jkel' => $pasien->jkel,
                        'tgllahir' => $pasien->tgllahir,
                    );
                    // var_dump($data); die();

            }
            
            $content = json_encode($data);
            return $this->response->setContent($content);
    }
}