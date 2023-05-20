@extends('layouts.master')

@push('css')
<link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
@endpush

@section('content')
<div class="content-wrapper">
    <div class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1 class="m-0 text-dark">Selamat Datang Di Aplikasi Toko Emas</h1>
          </div><!-- /.col -->
        </div><!-- /.row -->
      </div><!-- /.container-fluid -->
    </div>

    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-lg-6 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
              <div class="inner">
                <h3>{{$barang}}</h3>

                <p>JUMLAH BARANG</p>
              </div>
              <div class="icon">
                <i class="ion ion-bag"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          {{-- <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-success">
              <div class="inner">
                <h3>0<sup style="font-size: 20px"></sup></h3>

                <p>Penjualan Hari ini</p>
              </div>
              <div class="icon">
                <i class="ion ion-stats-bars"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
          <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
              <div class="inner">
                <h3>0</h3>

                <p>Pembelian Hari Ini</p>
              </div>
              <div class="icon">
                <i class="ion ion-person-add"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div> --}}
          <!-- ./col -->
          <div class="col-lg-6 col-6">
            <!-- small box -->
            <div class="small-box bg-danger">
              <div class="inner">
                <h3>{{\Carbon\Carbon::today()->format('d-m-Y')}}</h3>

                <p>Tanggal</p>
              </div>
              <div class="icon">
                <i class="ion ion-pie-graph"></i>
              </div>
              <a href="#" class="small-box-footer">More info <i class="fas fa-arrow-circle-right"></i></a>
            </div>
          </div>
          <!-- ./col -->
        </div>
      </div>
      {{-- <div class="row">
        <div class="col-12">
          <div class="card card-outline card-primary">
            <div class="card-header">
              Stok Hampir Habis
            </div>
            <!-- /.card-header -->
            <div class="card-body">
              <table id="example1" class="table table-bordered table-striped table-sm">
                <thead>
                <tr>
                  <th>No</th>
                  <th>Kode Barang</th>
                  <th>Nama Barang</th>
                  <th>Satuan</th>
                  <th>Stok</th>
                </tr>
                </thead>
                @php
                $no =1;
                @endphp
                <tbody>
                    @foreach ($brg as $item)
                      <tr>
                          <td>{{$no++}}</td>
                          <td>{{$item->kode}}</td>
                          <td>{{$item->nama}}</td>
                          <td>{{$item->satuan->nama}}</td>
                          <td>{{$item->stok}}</td>
                      </tr>
                    @endforeach
                  
                </tbody>
                
              </table>
            </div>
            <!-- /.card-body -->
          </div>
        </div>
      </div> --}}
      
    </section>
    
</div>
@endsection
