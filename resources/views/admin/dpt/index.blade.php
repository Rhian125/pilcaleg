@extends('admin.layout')
@section('konten')
<div class="content-wrapper">
	<section class="content-header">
	<h1 class="fontPoppins">{{ __($title) }}
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> DASHBOARD</a></li>
		<li><a href="#"> {{ __($title) }}</a></li>
	</ol>
	</section>

	<section class="content">
	<div class="box">
		<div class="box-header with-border">
			<div class="box-tools pull-left">
				<div style="padding-top:10px">
					@can('tambah-data')
						<a href="{{ url('/'.Request::segment(1).'/create') }}" class="btn btn-success btn-flat" title="Tambah Data">Tambah</a>
					@endcan
					<a href="{{ url('/'.Request::segment(1)) }}" class="btn btn-warning btn-flat" title="Refresh halaman">Refresh</a>
				</div>
			</div>
			<div class="box-tools pull-right">
				<div class="form-inline">
					<form action="{{ url('/'.Request::segment(1).'/search') }}" method="GET">
						<div class="input-group margin">
							<input type="text" class="form-control" name="search" placeholder="Masukkan kata kunci pencarian">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-danger btn-flat">cari</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>

		@can('read-data')
			<div class="table-responsive box-body">

				@if ($message = Session::get('status'))
					<div class="alert alert-info alert-dismissible">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<h4><i class="icon fa fa-check"></i>Berhasil !</h4>
						{{ $message }}
					</div>
				@endif

				<table class="table table-bordered">
					<tr style="background-color: gray;color:white">
						<th rowspan="2"style="width: 60px">No</th>
						<th rowspan="2">Nama Kelurahan</th>
						<th colspan="2">Data Pemilih</th>
						<th rowspan="2">Total</th>
						<th style="width: 20%" rowspan="2">#aksi</th>
					</tr>
                    <tr style="background-color: gray;color:white">
						<th>Laki-laki</th>
						<th>perempuan</th>
                    </tr>
					@foreach($dpt as $v)
					<tr>
						<td>{{ ($dpt ->currentpage()-1) * $dpt ->perpage() + $loop->index + 1 }}</td>
                        <td>
                            @if ($v->subdistricts_id)
								{{ $v->kelurahan->village_districts_name}}
							@endif
						</td>
						<td>{{ $v->amount_dpt_male }}</td>
						<td>{{ $v->amount_dpt_female }}</td>
						<td>{{ $v->amount_dpt_male + $v->amount_dpt_female}}</td>
						<td>
							@can('ubah-data')
								<a href="{{ url('/'.Request::segment(1).'/edit/'.Crypt::encrypt($v->id) ) }}" class="btn btn-xs btn-flat btn-warning">Edit</a>
							@endcan
							@can('hapus-data')
								<a href="{{ url('/'.Request::segment(1).'/hapus/'.Crypt::encrypt($v->id) ) }}" class="btn btn-xs btn-flat btn-danger"  onclick="return confirm('Anda Yakin ?');">Hapus</a>
							@endcan
						</td>
					</tr>
					@endforeach
				</table>

			</div>
		@endcan
		<div class="box-footer">
			<!-- PAGINATION -->
			<div class="float-right">{{ $dpt->appends(Request::only('search'))->links() }}</div>
		</div>
	</div>
	</section>
</div>
@endsection
