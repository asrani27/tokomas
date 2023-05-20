<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Keranjang extends Model
{
    protected $table = 'keranjang_belanja';
    public $timestamps = false;

    public function barang()
    {
        return $this->belongsTo(Barang::class, 'barang_id');
    }
}
