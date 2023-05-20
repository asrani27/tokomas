<?php

namespace App\Http\Controllers;

use App\Barang;
use App\Retail;
use App\Kustomer;
use App\Supplier;
use App\Pembelian;
use App\Penjualan;
use App\Pengeluaran;
use App\Retur_pembelian;
use App\Retur_penjualan;
use Illuminate\Http\Request;

class LaporanController extends Controller
{
    public function stok()
    {
        return view('laporan.stok');
    }

    public function penjualan()
    {
        return view('laporan.penjualan');
    }

    public function pembelian()
    {
        return view('laporan.pembelian');
    }

    public function customer()
    {
        return view('laporan.customer');
    }

    public function retail()
    {
        return view('laporan.retail');
    }

    public function supplier()
    {
        return view('laporan.supplier');
    }

    public function pengeluaran()
    {
        return view('laporan.pengeluaran');
    }

    public function returpenjualan()
    {
        return view('laporan.returpenjualan');
    }

    public function returpembelian()
    {
        return view('laporan.returpembelian');
    }

    public function printstok()
    {
        $data = Barang::all();
        return view('print.stok', compact('data'));
    }

    public function printretail()
    {
        $data = Retail::all();
        return view('print.retail', compact('data'));
    }

    public function printpenjualan()
    {
        $data = Penjualan::all();
        return view('print.penjualan', compact('data'));
    }

    public function printpembelian()
    {
        $data = Pembelian::all();
        return view('print.pembelian', compact('data'));
    }

    public function printreturpenjualan()
    {
        $data = Retur_penjualan::all();
        return view('print.returpenjualan', compact('data'));
    }

    public function printreturpembelian()
    {
        $data = Retur_pembelian::all();
        return view('print.returpembelian', compact('data'));
    }

    public function laba()
    {
        $penjualan = [];
        $pengeluaran = [];

        return view('laporan.laba', compact('penjualan', 'pengeluaran'));
    }

    public function tampilkanlaba()
    {
        $bulan = request('bulan');
        $tahun = request('tahun');
        $pengeluaran = Pengeluaran::whereMonth('tanggal', '=', $bulan)->whereYear('tanggal', '=', $tahun)->get();
        $penjualan = Penjualan::whereMonth('created_at', '=', $bulan)->whereYear('created_at', '=', $tahun)->get();
        return view('laporan.laba', compact('pengeluaran', 'penjualan'));
    }

    public function printcustomer()
    {
        $data = Kustomer::all();
        return view('print.customer', compact('data'));
    }

    public function printsupplier()
    {
        $data = Supplier::all();
        return view('print.supplier', compact('data'));
    }

    public function printpengeluaran()
    {
        $bulan = request('bulan');
        $tahun = request('tahun');
        $data = Pengeluaran::whereMonth('tanggal', '=', $bulan)->whereYear('tanggal', '=', $tahun)->get();

        return view('print.pengeluaran', compact('data'));
    }
}
