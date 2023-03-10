@extends('admin.layout')
@section('konten')
<div class="content-wrapper">
<section class="content-header">
	<h1 class="fontPoppins">Menu Acccess
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> DASHBOARD</a></li>
		<li><a href="#"> Menu Acccess</a></li>
	</ol>
	</section>

	<section class="content">
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">Edit Menu Acccess</h3>
		</div>
		
		<form action="{{ url('/'.Request::segment(1).'/edit/'.Crypt::encrypt($group->id).'/'.Crypt::encrypt($menu_access->id)) }}" method="POST" enctype="multipart/form-data" class="form-horizontal">
		{{ csrf_field() }}
		<input type="hidden" name="_method" value="PUT">
		
			<div class="box-body">
				<div class="col-lg-12">
				<div class="form-group">
						<label class="col-sm-2 control-label">{{ __('Nama Group') }}</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" placeholder="Nama Group" name="group_name" value="{{ $group->group_name }}" disabled>
						</div>
					</div>
					
					<div class="form-group @if ($errors->has('menu_id')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Menu') }} <span class="required" style="color: #dd4b39;">*</span></label>
						<div class="col-sm-10">
							@if ($errors->has('menu_id'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('menu_id') }}</label>@endif
							<select class="form-control" name="menu_id">
								<option value="">- Pilih Menu -</option>
								@foreach($menu as $v)
									<option value="{{ $v->id }}" @if($menu_access->menu_id==$v->id) selected @endif>{{ $v->menu_name }}</option>
								@endforeach
							</select>
						</div>
					</div>
					
					<div class="form-group @if ($errors->has('create')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Create') }} <span class="required" style="color: #dd4b39;">*</span></label>
						<div class="col-sm-10">
							@if ($errors->has('create'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('create') }}</label>@endif
							<select class="form-control" name="create">
								<option value="">- Pilih -</option>
								<option value="1" @if($menu_access->create=="1") selected @endif>Aktif</option>
								<option value="0" @if($menu_access->create=="0") selected @endif>Tidak Aktif</option>
							</select>

						</div>
					</div>

					<div class="form-group @if ($errors->has('read')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Read') }} <span class="required" style="color: #dd4b39;">*</span></label>
						<div class="col-sm-10">
							@if ($errors->has('read'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('read') }}</label>@endif
							<select class="form-control" name="read">
								<option value="">- Pilih -</option>
								<option value="1" @if($menu_access->read=="1") selected @endif>Aktif</option>
								<option value="0" @if($menu_access->read=="0") selected @endif>Tidak Aktif</option>
							</select>

						</div>
					</div>
					
					<div class="form-group @if ($errors->has('update')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Update') }} <span class="required" style="color: #dd4b39;">*</span></label>
						<div class="col-sm-10">
							@if ($errors->has('update'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('update') }}</label>@endif
							<select class="form-control" name="update">
								<option value="">- Pilih -</option>
								<option value="1" @if($menu_access->update=="1") selected @endif>Aktif</option>
								<option value="0" @if($menu_access->update=="0") selected @endif>Tidak Aktif</option>
							</select>

						</div>
					</div>
					
					<div class="form-group @if ($errors->has('delete')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Delete') }} <span class="required" style="color: #dd4b39;">*</span></label>
						<div class="col-sm-10">
							@if ($errors->has('delete'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('delete') }}</label>@endif
							<select class="form-control" name="delete">
								<option value="">- Pilih -</option>
								<option value="1" @if($menu_access->delete=="1") selected @endif>Aktif</option>
								<option value="0" @if($menu_access->delete=="0") selected @endif>Tidak Aktif</option>
							</select>

						</div>
					</div>
					
					<div class="form-group @if ($errors->has('print')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Print') }} <span class="required" style="color: #dd4b39;">*</span></label>
						<div class="col-sm-10">
							@if ($errors->has('print'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('print') }}</label>@endif
							<select class="form-control" name="print">
								<option value="">- Pilih -</option>
								<option value="1" @if($menu_access->print=="1") selected @endif>Aktif</option>
								<option value="0" @if($menu_access->print=="0") selected @endif>Tidak Aktif</option>
							</select>

						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label"></label>
						<div class="col-sm-10">
							<button type="submit" class="btn btn-primary btn-flat btn-sm" title="Tambah Data"> Simpan</button>
							<button type="reset" class="btn btn-danger btn-flat btn-sm" title="Reset Data"> Reset</button>
							<a href="{{ url('/'.Request::segment(1).'/'.Crypt::encrypt($group->id)) }}" class="btn btn-warning btn-flat btn-sm" title="Kembali">Kembali</a>
						</div>
					</div>
					
				</div>
			</div>
		</form>
	</div>
	</section>
</div>

@endsection