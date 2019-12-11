<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;

class DokterController extends Controller
{
    public function homeAction()
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
                        'link' => $pasien->idPasien,
                    );
                    // var_dump($data); die();

            }
            
            $content = json_encode($data);
            return $this->response->setContent($content);
    }

    public function createRekamMedisAction($idp)
    {
        $pasien = Pasien::findFirst("idPasien='$idp'");
        $this->view->pasien = $pasien;
    }

    public function storeRekamMedisAction()
    {
        $rekammedis = new Rekammedis();
        $rekammedis->idDokter = $this->session->get('auth')['id'];
        $rekammedis->idPasien = $this->request->getPost('idPasien');
        $rekammedis->tanggal = $this->request->getPost('tanggal');
        $rekammedis->keluhan = $this->request->getPost('keluhan');
        $rekammedis->diagnosis = $this->request->getPost('diagnosis');
        $rekammedis->anamnesa = $this->request->getPost('anamnesa');
        $rekammedis->prognosis = $this->request->getPost('prognosis');
        $rekammedis->obyektif = $this->request->getPost('obyektif');

        $max = Rekammedis::maximum(
            [
                'column' => 'idRekamMedis',
            ]
        );

        $resep = new Resep();
        $resep->idRekamMedis = $max+1;
        $resep->resep = $this->request->getPost('resep');
        $resep->status = 1;
        if($rekammedis->save()){
            if($resep->save()){
                $this->flashSession->success('Berhasil menambah rekam medis');
                return $this->response->redirect('dokter/rekam-medis');
            }
            else{
                $this->flashSession->error('Gagal menambah rekam medis');
                return $this->response->redirect('dokter/home');
            }
        }
        else{
            $this->flashSession->error('Gagal menambah rekam medis');
            return $this->response->redirect('dokter/home');
        }
    }

    public function RekamMedisAction()
    {
    
    }

    public function listRekamMedisAction()
    {
        $id = $this->session->get('auth')['id'];
        $rms = Rekammedis::find("idDokter='$id'");
        $data = array();
        
            foreach ($rms as $rm) {
                $pasien = Pasien::findFirst("idPasien='$rm->idPasien'");
                    $data[] = array(
                        'tanggal' => $rm->tanggal,
                        'nama' => $pasien->nama,
                        'link' => $rm->idRekamMedis,
                    );
                    // var_dump($data); die();

            }
            
            $content = json_encode($data);
            return $this->response->setContent($content);
    }

    public function detailRekamMedisAction($idp)
    {
        $rekammedis = Rekammedis::findFirst("idRekamMedis='$idp'");
        $this->view->rm = $rekammedis;
        $resep = Resep::findFirst("idRekamMedis='$idp'");
        $this->view->resep = $resep;
    }

}