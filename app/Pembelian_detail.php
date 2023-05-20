<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pembelian_detail extends Model
{
    protected $table = 'pembelian_detail';
    public $timestamps = false;

    public function pembelian()
    {
        return $this->belongsTo(Pembelian::class, 'pembelian_id');
    }

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
