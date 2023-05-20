<?php

namespace App\Http\Controllers;

use App\Barang;
use App\Penjualan;
use Carbon\Carbon;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    public function index()
    {
        $barang     = count(Barang::all());
        //$penjualan  = count(Penjualan::whereDate('created_at', Carbon::today())->get());
        $brg = Barang::where('stok', '<=', 5)->get();
        $date1 = Carbon::now();

        // $exp = Barang::where('stok', '<=', 5)->get()->map(function ($item) use ($date1) {
        //     $date2 = \Carbon\Carbon::parse($item->expired);
        //     $item->exp = $date1->diffInDays($date2);
        //     return $item;
        // })->where('exp', '<=', 5);

        return view('backend.home', compact('barang'));
    }
}
