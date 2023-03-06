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
					<a href="{{ url('/'.Request::segment(1).'/create') }}" class="btn btn-success btn-flat" title="Tambah Data">{{ __('general.add_data') }}</a>
				@endcan
					<a href="{{ url('/'.Request::segment(1)) }}" class="btn btn-warning btn-flat" title="Refresh halaman">Refresh</a>
					<button type="button" class="btn btn-info btn-flat" data-toggle="modal" data-target="#modal-default">
						Import Data
					</button>

					<div class="modal fade" id="modal-default">
					<form method="post" action="{{ url('/'.Request::segment(1).'/import') }}" enctype="multipart/form-data">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">Import Data</h4>
								</div>
								<div class="modal-body">
									{{ csrf_field() }}

									<label>Pilih file excel</label>
									<div class="form-group">
										<input type="file" name="file" required="required">
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
									<a href="{{ url('/public/file_tim_pendukung/format_import.xlsx') }}" class="btn btn-warning">Download Format Import</a>
									<button type="submit" class="btn btn-primary">Import Data</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
						</form>
					</div>
					<!-- /.modal -->
				</div>
			</div>
			<div class="box-tools pull-right">
				<div class="form-inline">
					<form action="{{ url('/'.Request::segment(1).'/search') }}" method="GET">
						<select class="form-control" name="filter">
							<option value=""> - {{ __('general.select_search') }} - </option>
							<option value="nip" @if(Request::get('filter')=='nip') selected @endif> {{ __('employee.nip') }}</option>
							<option value="nama_tim_pendukung" @if(Request::get('filter')=='nama_tim_pendukung') selected @endif> {{ __('employee.name') }}</option>
						</select>

						<div class="input-group margin">
							<input type="text" class="form-control" name="search" placeholder="Masukkan kata kunci pencarian" value="{{ Request::get('search') }}">
							<span class="input-group-btn">
								<button type="submit" class="btn btn-danger btn-flat">{{ __('general.search') }}</button>
							</span>
						</div>
					</form>
				</div>
			</div>
		</div>

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
						<th style="width: 60px">{{ __('employee.number') }}</th>
						<th>{{ __('employee.nip') }}</th>
						<th>{{ __('employee.barcode') }}</th>
						<th>{{ __('employee.name') }}</th>
						<th>{{ __('employee.photo') }}</th>
						<th style="width: 15%">#{{ __('general.action') }}</th>
					</tr>
					@foreach($tim_pendukung as $v)
					<tr>
						<td data-toggle="modal" data-target="#modalDetail{{$v->id}}">{{ ($tim_pendukung ->currentpage()-1) * $tim_pendukung ->perpage() + $loop->index + 1 }}</td>
						<td data-toggle="modal" data-target="#modalDetail{{$v->id}}">{{ $v->nip }}</td>
						<td data-toggle="modal" data-target="#modalDetail{{$v->id}}">
							<img src="data:image/png;base64,{{ DNS1D::getBarcodePNG($v->nip, 'C39', 1, 70, [1, 1, 1], true) }}" alt="barcode" />
						</td>
						<td data-toggle="modal" data-target="#modalDetail{{$v->id}}">{{ $v->nama_tim_pendukung }}</td>
						<td data-toggle="modal" data-target="#modalDetail{{$v->id}}"><center>
						@if($v->foto_formal)
							<img src="{{ asset('storage/upload/foto_formal_tim_pendukung/thumbnail/'.$v->foto_formal) }}" class="img-circle" alt="User Image"  width="150px" height="150px">
						@else
							<img src="{{ asset('upload/user/15.jpg') }}" class="img-circle" alt="User Image" width="150px" height="150px">
						@endif
						</td>
						<td>
							@can('ubah-data')
								<a href="{{ url('/'.Request::segment(1).'/edit/'.Crypt::encrypt($v->id)) }}" class="btn btn-xs btn-warning btn-block">{{ __('general.update_data') }}</a>
							@endcan
							@can('hapus-data')
								<a href="{{ url('/'.Request::segment(1).'/hapus/'.Crypt::encrypt($v->id)) }}" class="btn btn-xs btn-danger btn-block"  onclick="return confirm('Anda Yakin ?');">{{ __('general.delete_data') }}</a>
							@endcan
						</td>
					</tr>

					<!-- Modal Update-->
					<div class="modal modal-default fade" id="modalDetail{{$v->id}}">
						<div class="modal-dialog" role="document">
							<div class="modal-content" style="border-radius: 20px;">
								<div class="modal-body" style="border-radius: 20px;">
								<center>
									@if($v->foto_formal)
										<img src="{{ asset('storage/upload/foto_formal_tim_pendukung/thumbnail/'.$v->foto_formal) }}" class="img-circle" alt="User Image"  width="150px" height="150px">
									@else
										<img src="{{ asset('upload/user/15.jpg') }}" class="img-circle" alt="User Image" width="150px" height="150px">
									@endif
									<br><br>
									<p style="font-size:20px">{{ $v->nama_tim_pendukung }}</p>
									<p style="font-size:16px">{{ $v->nip }}</p>
								</center><br>
								<div class="row">
									<div class="col-md-3"><b>Tempat Lahir</b></div>
									<div class="col-md-4 ml-auto">: {{ $v->tempat_lahir }}</div>
								</div>
								<div class="row">
									<div class="col-md-3"><b>Tanggal Lahir</b></div>
									<div class="col-md-4 ml-auto">: {{ date('d-m-Y', strtotime($v->tanggal_lahir)) }}</div>
								</div>
								<div class="row">
									<div class="col-md-3"><b>Jenis kelamin</b></div>
									<div class="col-md-4 ml-auto">: {{ $v->jenis_kelamin }}</div>
								</div>
								<div class="row">
									<div class="col-md-3"><b>Alamat</b></div>
									<div class="col-md-4 ml-auto">: {{ $v->alamat }}</div>
								</div>
								<div class="row">
									<div class="col-md-3"><b>Agama</b></div>
									<div class="col-md-4 ml-auto">: {{ $v->agama }}</div>
								</div>
								<div class="row">
									<div class="col-md-3"><b>Gol. Darah</b></div>
									<div class="col-md-4 ml-auto">: {{ $v->gol_darah }}</div>
								</div>
								<div class="row">
									<div class="col-md-3"><b>Email</b></div>
									<div class="col-md-4 ml-auto">: {{ $v->email }}</div>
								</div>

								</div>
							</div>
						</div>
					</div>

					@endforeach
				</table>

			</div>
		<div class="box-footer">
			<!-- PAGINATION -->
			<div class="float-right">{{ $tim_pendukung->appends(Request::only('filter','search'))->links() }}</div>
		</div>
	</div>
	</section>
</div>
@endsection
