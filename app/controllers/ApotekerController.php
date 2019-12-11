<?php

use Phalcon\Mvc\Controller;
use Phalcon\Http\Response;
use App\Events\ApotekerProtectController;

class ApotekerController extends Controller
{
    public function homeAction()
    {

    }

    public function listResepAction()
    {
        $reseps = Resep::find();
        $data = array();
        
            foreach ($reseps as $resep) {
                $rm = Rekammedis::findFirst("idRekamMedis='$resep->idRekamMedis'");
                $pasien = Pasien::findFirst("idPasien='$rm->idPasien'");
                if($resep->status == 1)
                {
                    $status = "antri";
                }
                else{
                    $status = "selesai";
                }
                    $data[] = array(
                        'tanggal' => $rm->tanggal,
                        'nama' => $pasien->nama,
                        'alamat' => $pasien->alamat,
                        'resep' => $resep->resep,
                        'status' => $status,
                        'link' => $resep->idResep,
                    );
            }
            
            $content = json_encode($data);
            return $this->response->setContent($content);

    }

    public function updateResepAction($id)
    {
        $resep = Resep::findFirst("idResep='$id'");
        if($resep){
            $resep->status = 2;
            if($resep->save()){
                $this->flashSession->success('Berhasil mengupdate antrian');
                return $this->response->redirect('apoteker/home');
            }
        }
    }

}