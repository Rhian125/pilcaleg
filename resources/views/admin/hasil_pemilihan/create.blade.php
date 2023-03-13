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

                <form action="{{ url('/' . Request::segment(1)) }}" method="POST" enctype="multipart/form-data" class="form-horizontal">
                    {{ csrf_field() }}
                    <div class="box-body">
                        <div class="col-lg-12">

                            <center>
                                <p style="font-size:20px">DATA PRIBADI</p>
                            </center>

                            <div class="form-group @if ($errors->has('support_teams_family_card_number')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('No. KK') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_family_card_number'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_family_card_number') }}</label>@endif
                                    <input type="text" class="form-control" placeholder="No. KK" name="support_teams_family_card_number" value="{{ old('support_teams_family_card_number') }}">
                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('support_teams_id_number')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('NIK') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_id_number'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_id_number') }}</label>@endif
                                    <input type="text" class="form-control" placeholder="NIK" name="support_teams_id_number" value="{{ old('support_teams_id_number') }}">
                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('support_teams_name')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('Nama Lengkap') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_name'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_name') }}</label>@endif
                                    <input type="text" class="form-control" placeholder="Nama Lengkap" name="support_teams_name" value="{{ old('support_teams_name') }}">
                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('support_teams_place_of_birth')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('Tempat Lahir') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_place_of_birth'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_place_of_birth') }}</label>@endif
                                    <input type="text" class="form-control" placeholder="Tempat Lahir" name="support_teams_place_of_birth" value="{{ old('support_teams_place_of_birth') }}">
                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('support_teams_date_of_birth')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('Tanggal Lahir') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_date_of_birth'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_date_of_birth') }}</label>@endif
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control datepicker" placeholder="Tanggal Lahir" name="support_teams_date_of_birth" value="{{ old('support_teams_date_of_birth') }}">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('support_teams_gender')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('Jenis Kelamin') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_gender'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_gender') }}</label>@endif
                                    <select class="form-control select2" name="support_teams_gender">
                                        <option value=""> -Pilih Jenis Kelamin-</option>
                                        <option value="Pria" @if (old('support_teams_gender') == 'Pria') selected @endif> Pria</option>
                                        <option value="Wanita" @if (old('support_teams_gender') == 'Wanita') selected @endif> Wanita</option>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('jobs_id')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('Pekerjaan') }}</label>
                                <div class="col-sm-10">
                                    @if ($errors->has('jobs_id'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('jobs_id') }}</label>@endif
                                    <select class="form-control select2" name="jobs_id">
                                        <option value="">- Pilih Pekerjaan -</option>
                                        @foreach($jobs as $v)
                                            <option value="{{ $v->id }}" @if(old('jobs_id')=="$v->id") selected @endif>{{ $v->jobs_name }}</option>
                                        @endforeach
                                    </select>

                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('support_teams_address')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('Alamat') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_address'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_address') }}</label>@endif
                                    <textarea class="form-control" placeholder="Alamat" name="support_teams_address">{{ old('support_teams_address') }}</textarea>
                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('subdistricts_id')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('Kecamatan') }}</label>
                                <div class="col-sm-10">
                                    @if ($errors->has('subdistricts_id'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('subdistricts_id') }}</label>@endif
                                    <select class="form-control select2" name="subdistricts_id" id="subdistricts_id" onChange="tampil_kelurahan()">
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

                                        <select class="form-control select2" name="village_districts_id" id="village_districts_id">
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

                            <div class="form-group @if ($errors->has('support_teams_rt')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('RT') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_rt'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_rt') }}</label>@endif
                                    <select class="form-control select2" name="support_teams_rt">
                                        <option value=""> -Pilih RT-</option>
                                        <option value="001" @if (old('support_teams_rt') == '001') selected @endif> 001</option>
                                        <option value="002" @if (old('support_teams_rt') == '002') selected @endif> 002</option>
                                        <option value="003" @if (old('support_teams_rt') == '003') selected @endif> 003</option>
                                        <option value="004" @if (old('support_teams_rt') == '004') selected @endif> 004</option>
                                        <option value="005" @if (old('support_teams_rt') == '005') selected @endif> 005</option>
                                    </select>

                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('support_teams_rw')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('RW') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_rw'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_rw') }}</label>@endif
                                    <select class="form-control select2" name="support_teams_rw">
                                        <option value=""> -Pilih RW-</option>
                                        <option value="001" @if (old('support_teams_rw') == '001') selected @endif> 001</option>
                                        <option value="002" @if (old('support_teams_rw') == '002') selected @endif> 002</option>
                                        <option value="003" @if (old('support_teams_rw') == '003') selected @endif> 003</option>
                                        <option value="004" @if (old('support_teams_rw') == '004') selected @endif> 004</option>
                                        <option value="005" @if (old('support_teams_rw') == '005') selected @endif> 005</option>
                                    </select>

                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('support_teams_cellphone')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('Nomor HandPhone') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_cellphone'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_cellphone') }}</label>@endif
                                    <input type="text" class="form-control" placeholder="Nomor HandPhone" name="support_teams_cellphone" value="{{ old('support_teams_cellphone') }}">
                                </div>
                            </div>

                            <div class="form-group @if ($errors->has('support_teams_must_choose')) has-error @endif">
                                <label class="col-sm-2 control-label">{{ __('Wajip Pilih Dalam Rumah') }} <span class="required" style="color: #dd4b39;">*</span></label>
                                <div class="col-sm-10">
                                    @if ($errors->has('support_teams_must_choose'))<label class="control-label" for="inputError"><i class="fa fa-times-circle-o"></i> {{ $errors->first('support_teams_must_choose') }}</label>@endif
                                    <input type="number" class="form-control" placeholder="Wajip Pilih Dalam Rumah" name="support_teams_must_choose" value="{{ old('support_teams_must_choose') }}">
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-2"></div>
                                <div class="col-sm-10">
                                    <div style="padding-top:10px">
                                        <button type="submit" class="btn btn-primary btn-flat btn-sm" title="Tambah Data"> Simpan</button>
                                        <button type="reset" class="btn btn-danger btn-flat btn-sm" title="Reset Data"> Reset</button>
                                        <a href="{{ url('/' . Request::segment(1)) }}" class="btn btn-warning btn-flat btn-sm" title="Kembali">Kembali</a>
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
