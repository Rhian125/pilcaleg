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
			<h3 class="box-title">Tambah {{ __($title) }}</h3>
		</div>

		<form action="{{ url('/'.Request::segment(1)) }}" method="POST" enctype="multipart/form-data" class="form-horizontal">
		{{ csrf_field() }}
			<div class="box-body">
				<div class="col-lg-12">

					<div class="form-group @if ($errors->has('subdistricts_id')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Kecamatan') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('subdistricts_id'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('subdistricts_id') }}</label>@endif
							<select class="form-control" name="subdistricts_id">
								<option value="">- Pilih Kecamatan -</option>
								@foreach($kecamatan as $v)
									<option value="{{ $v->id }}" @if(old('subdistricts_id')=="$v->id") selected @endif>{{ $v->subdistricts_name }}</option>
								@endforeach
							</select>

						</div>
					</div>

					<div class="form-group @if ($errors->has('village_districts_name')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Kelurahan') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('village_districts_name'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('village_districts_name') }}</label>@endif
							<input type="text" class="form-control" placeholder="Nama Kelurahan" name="village_districts_name" value="{{ old('village_districts_name') }}" >
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-10">
							<div>
								<button type="submit" class="btn btn-primary btn-flat btn-sm" title="Tambah Data"> Simpan</button>
								<button type="reset" class="btn btn-danger btn-flat btn-sm" title="Reset Data"> Reset</button>
								<a href="{{ url('/'.Request::segment(1)) }}" class="btn btn-warning btn-flat btn-sm" title="Kembali">Kembali</a>
							</div>
						</div>
					</div>

				</div>
			</div>
		</form>
	</div>
	</section>
</div>

@endsection
