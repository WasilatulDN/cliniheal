<?php

use Phalcon\Mvc\Model;

class Rekammedis extends Model
{
    public $idRekamMedis;
    public $idDokter;
    public $idPasien;
    public $tanggal;
    public $keluhan;
    public $diagnosis;
    public $prognosis;
    public $anamnesa;
    public $obyektif;
}