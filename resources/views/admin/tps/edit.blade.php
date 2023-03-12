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
			<h3 class="box-title">Edit {{ __($title) }}</h3>
		</div>

		<form action="{{ url('/'.Request::segment(1).'/edit/'.Crypt::encrypt($tps->id)) }}" method="POST" enctype="multipart/form-data" class="form-horizontal">
		{{ csrf_field() }}
		<input type="hidden" name="_method" value="PUT">

			<div class="box-body">
				<div class="col-lg-12">

					@if($tps)
					<div class="form-group @if ($errors->has('subdistricts_id')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Kecamatan') }}</label>
						<div class="col-sm-10">
							@if ($errors->has('subdistricts_id'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('subdistricts_id') }}</label>@endif
							<select class="form-control" name="subdistricts_id" id="subdistricts_id" onChange="tampil_kelurahan();">
                                <option value=""> -Pilih Kecamatan-</option>
                                @foreach($kecamatan as $v)
                                <option value="{{ $v->id }}" @if($tps->subdistricts_id==$v->id) selected @endif>{{ $v->subdistricts_name}}</option>
                                 @endforeach
                            </select>

						</div>
					</div>
					@endif

                    <div class="form-group @if ($errors->has('village_districts_id')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('Kelurahan') }} <span class="required" style="color: #dd4b39;">*</span></label>
						<div class="col-sm-10">
							@if ($errors->has('village_districts_id'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('village_districts_id') }}</label>@endif

							@if($tps->village_districts_id)
								@php

								$kelurahans = DB::table('subdistricts')
										->leftJoin('village_districts', 'subdistricts.id', '=', 'village_districts.subdistricts_id')
										->where('subdistricts.id', $tps->subdistricts_id)->get();
								@endphp

								<select class="form-control" name="village_districts_id" id="village_districts_id">
                                        	<option value=""> -Pilih Kelurahan-</option>
									@foreach($kelurahans as $v)
										echo "<option value="{{ $v->id }}"  @if($tps->village_districts_id==$v->id) selected @endif>{{ $v->village_districts_name }}</option>";
									@endforeach
                                    	</select>
							@else
								<select class="form-control" name="village_districts_id" id="village_districts_id">
                                        	<option value=""> -Pilih Kelurahan-</option>
                                    	</select>
							@endif
						</div>
					</div>

					<div class="form-group @if ($errors->has('number_of_tps')) has-error @endif">
						<label class="col-sm-2 control-label">{{ __('No. TPS') }} <span class="required" style="color: #dd4b39;">*</span></label>
						<div class="col-sm-10">
							@if ($errors->has('number_of_tps'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('number_of_tps') }}</label>@endif
							<input type="number" class="form-control" placeholder="No. TPS" name="number_of_tps" value="{{ $tps->number_of_tps }}" >
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">{{ __('Keterangan') }}</label>
						<div class="col-sm-10">
							<textarea class="form-control" placeholder="Keterangan" name="tps_information">{{ $tps->tps_information }}</textarea>
						</div>
					</div>

					<div class="form-group @if ($errors->has('tps')) has-error @endif">
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
