<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;

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
                    // var_dump($data); die();

            }
            
            $content = json_encode($data);
            return $this->response->setContent($content);
    }

    public function searchPasienAction()
    {
        $nik = $this->request->getPost('nik');
        $pasien = Pasien::findFirst("nik='$nik'");
        
        $antrian = new Antrian();
        $antrian->idPasien = $pasien->idPasien;
        $antrian->status = 1;

        $antrian->save();
        $this->response->redirect('admin/home');

        
    }

    public function addPasienAction()
    {

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

        $pasien->save();
        $this->response->redirect('admin/home-antrian');

    }

    public function updateAntrianAction($id)
    {
        $antrian = Antrian::findFirst("idAntrian='$id'");

        $antrian->status="selesai";

        $antrian->save();

        $this->response->redirect('admin/home');   

    }

    public function deleteAntrianAction($id)
    {
        $antrian = Antrian::findFirst("idAntrian='$id'");

        $antrian->delete();

        $this->response->redirect('admin/home');   

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