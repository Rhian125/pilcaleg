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
						<th style="width: 60px">No</th>
						<th>Eksekutor</th>
						<th>Deskripsi</th>
						<th>Waktu Eksekusi</th>
						<th style="width: 20%">#aksi</th>
					</tr>
					@foreach($log as $v)
					<tr>
						<td>{{ ($log ->currentpage()-1) * $log ->perpage() + $loop->index + 1 }}</td>
						<td>{{ $v->user ? $v->user->name : '' }} </td>
						<td>{{ $v->description }}</td>
						<td>{{ \Carbon\Carbon::parse($v->created_at)->diffForHumans(); }}</td>
						<td><a href="#" class="btn btn-xs btn-flat btn-info" data-toggle="modal" data-target="#modalDetail{{$v->id}}">Detail</a></td>
					</tr>
					
					<div class="modal fade" id="modalDetail{{$v->id}}">
						<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
								<span aria-hidden="true">&times;</span></button>
								<h4 class="modal-title">Detail Log</h4>
							</div>
							<div class="modal-body">
								<div class="row">
									<div class="col-md-3"><b>Eksekutor</b></div>
									<div class="col-md-4 ml-auto">: {{ $v->user ? $v->user->name : '' }}</div>
								</div>
								<div class="row">
									<div class="col-md-3"><b>Deskripsi </b></div>
									<div class="col-md-4 ml-auto">: {{ $v->description }}</div>
								</div>
								<div class="row">
									<div class="col-md-3"><b>Waktu Eksekusi</b></div>
									<div class="col-md-4 ml-auto">: {{ $v->created_at->format('d-m-Y H:i:s') }}</div>
								</div>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
							</div>
						</div>
						<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
					@endforeach
				</table>

			</div>
		<div class="box-footer">
			<!-- PAGINATION -->
			<div class="float-right">{{ $log->appends(Request::only('search'))->links() }}</div>
		</div>
	</div>
	</section>
</div>
@endsection