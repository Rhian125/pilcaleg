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
			<h3 class="box-title">{{ __($title) }}</h3>
		</div>
		
		<form action="{{ url('/'.Request::segment(1).'/edit/'.$setting->id) }}" method="POST" enctype="multipart/form-data" class="form-horizontal">
		{{ csrf_field() }}
		<input type="hidden" name="_method" value="PUT">
		
			<div class="box-body">
				
				@if ($message = Session::get('status'))
					<div class="alert alert-info alert-dismissible">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
						<h4><i class="icon fa fa-check"></i>Berhasil !</h4>
						{{ $message }}
					</div>
				@endif

				<div class="col-lg-12">
					
					<div class="form-group @if ($errors->has('application_name')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Nama Aplikasi') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('application_name'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('application_name') }}</label>@endif
							<input type="application_name" class="form-control" placeholder="Nama Aplikasi" name="application_name" value="{{ $setting->application_name }}" >
						</div>
					</div>
					
					<div class="form-group @if ($errors->has('short_application_name')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Singkatan Nama Aplikasi') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('short_application_name'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('short_application_name') }}</label>@endif
							<input type="short_application_name" class="form-control" placeholder="Singkatan Nama Aplikasi" name="short_application_name" value="{{ $setting->short_application_name }}" >
						</div>
					</div>
					
					<div class="form-group @if ($errors->has('small_icon')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Logo Kecil') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('small_icon'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('small_icon') }}</label>@endif
							<input type="file" class="form-control" name="small_icon" value="{{ $setting->small_icon }}" >
							<span style="font-size:11px"><i>Ukuran File Tidak Boleh Lebih Dari 500 Kb (jpg,jpeg,png)</i></span>
							@if($setting->small_icon)
								<br>
								<img src="{{ asset('upload/setting/'.$setting->small_icon) }}" width="50px" height="50px">
							@endif
						</div>
					</div>
					
					<div class="form-group @if ($errors->has('large_icon')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Logo Besar') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('large_icon'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('large_icon') }}</label>@endif
							<input type="file" class="form-control" name="large_icon" value="{{ $setting->large_icon }}" >
							<span style="font-size:11px"><i>Ukuran File Tidak Boleh Lebih Dari 500 Kb (jpg,jpeg,png)</i></span>
							@if($setting->large_icon)
								<br>
								<img src="{{ asset('upload/setting/'.$setting->large_icon) }}" width="200px" height="50px">
							@endif
						</div>
					</div>
					
					<div class="form-group @if ($errors->has('background_login')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Background Login') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('background_login'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('background_login') }}</label>@endif
							<input type="file" class="form-control" name="background_login" value="{{ $setting->background_login }}" >
							<span style="font-size:11px"><i>Ukuran File Tidak Boleh Lebih Dari 500 Kb (jpg,jpeg,png)</i></span>
							@if($setting->background_login)
								<br>
								<img src="{{ asset('upload/setting/'.$setting->background_login) }}" width="150px" height="150px">
							@endif
						</div>
					</div>
					
					
					<div class="form-group @if ($errors->has('gmaps_key')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Google Map Key') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('gmaps_key'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('gmaps_key') }}</label>@endif
							<input type="gmaps_key" class="form-control" placeholder="Google Map Key" name="gmaps_key" value="{{ $setting->gmaps_key }}" >
						</div>
					</div>
					
					<div class="form-group @if ($errors->has('layout')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Layout') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('layout'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('group') }}</label>@endif
							<select class="form-control" name="layout">
								<option value="">- Pilih Layout-</option>
								<option value="default" @if($setting->layout =="default") selected @endif>default</option>
								<option value="sidebar-collapse" @if($setting->layout =="sidebar-collapse") selected @endif>sidebar-collapse</option>
								<option value="layout-boxed" @if($setting->layout =="layout-boxed") selected @endif>layout-boxed</option>
							</select>

						</div>
					</div>
					
					<div class="form-group @if ($errors->has('skin')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Skin') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('skin'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('group') }}</label>@endif
							<select class="form-control" name="skin">
								<option value="">- Pilih Skin-</option>
								<option value="skin-black" @if($setting->skin =="skin-black") selected @endif>skin-black</option>
								<option value="skin-black-light" @if($setting->skin =="skin-black-light") selected @endif>skin-black-light</option>
								<option value="skin-red" @if($setting->skin =="skin-red") selected @endif>skin-red</option>
								<option value="skin-red-light" @if($setting->skin =="skin-red-light") selected @endif>skin-red-light</option>
								<option value="skin-green" @if($setting->skin =="skin-green") selected @endif>skin-green</option>
								<option value="skin-green-light" @if($setting->skin =="skin-green-light") selected @endif>skin-green-light</option>
								<option value="skin-blue" @if($setting->skin =="skin-blue") selected @endif>skin-blue</option>
								<option value="skin-blue-light" @if($setting->skin =="skin-blue-light") selected @endif>skin-blue-light</option>
								<option value="skin-yellow" @if($setting->skin =="skin-yellow") selected @endif>skin-yellow</option>
								<option value="skin-yellow-light" @if($setting->skin =="skin-yellow-light") selected @endif>skin-yellow-light</option>
								<option value="skin-purple" @if($setting->skin =="skin-purple") selected @endif>skin-purple</option>
								<option value="skin-purple-light" @if($setting->skin =="skin-purple-light") selected @endif>skin-purple-light</option>
							</select>

						</div>
					</div>
					
					<div class="form-group @if ($errors->has('group')) has-error @endif">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-10">
							<div>
								<button type="submit" class="btn btn-primary btn-flat btn-sm" title="Tambah Data"> Simpan</button>
								<button type="reset" class="btn btn-danger btn-flat btn-sm" title="Reset Data"> Reset</button>
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