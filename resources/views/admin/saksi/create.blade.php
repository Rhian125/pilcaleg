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
							<select class="form-control" name="subdistricts_id" id="subdistricts_id" onChange="tampil_kelurahan()">
                                <option value=""> -Pilih Kecamatan-</option>
                                @foreach($kecamatan as $v)
                                <option value="{{ $v->id }}" @if(old('subdistricts_id')==$v->id) selected @endif>{{ $v->subdistricts_name}}</option>
                                @endforeach
                            </select>

						</div>
					</div>

					<div class="form-group @if ($errors->has('village_districts_id')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Kelurahan') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('village_districts_id'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('village_districts_id') }}</label>@endif

                            @if(old('village_districts_id'))
								@php

								$kelurahans = DB::table('subdistricts')
										->leftJoin('village_districts', 'subdistricts.id', '=', 'village_districts.subdistricts_id')
										->where('subdistricts.id', old('village_districts_id'))->get();
								@endphp

								<select class="form-control" name="village_districts_id" id="village_districts_id">
                                        	<option value=""> -Pilih Kelurahan-</option>
									@foreach($kelurahans as $v)
										echo "<option value="{{ $v->id }}"  @if(old('village_districts_id')==$v->id) selected @endif>{{ $v->village_districts_name }}</option>";
									@endforeach
                                    	</select>
							@else
								<select class="form-control" name="village_districts_id" id="village_districts_id" >
                                        	<option value=""> -Pilih Kelurahan-</option>
                                    	</select>
							@endif

						</div>
					</div>

					<div class="form-group @if ($errors->has('rt_number')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('RT') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('rt_number'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('rt_number') }}</label>@endif
							<input type="text" class="form-control" placeholder="RT" name="rt_number" value="{{ old('rt_number') }}" >
						</div>
					</div>

					<div class="form-group @if ($errors->has('rw_number')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('RW') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('rw_number'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('rw_number') }}</label>@endif
							<input type="text" class="form-control" placeholder="RT" name="rw_number" value="{{ old('rw_number') }}" >
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

<script>
    function tampil_kelurahan()
    {
        subdistricts_id = document.getElementById("subdistricts_id").value;
        url = "{{ url('/kelurahan/village_districts_name') }}"
        $.ajax({
            url:""+url+"/"+subdistricts_id+"",
            success: function(response){
                $("#village_districts_id").html(response);
            }
        });
        return false;
    }
    </script>

@endsection
