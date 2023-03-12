<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVolunteer extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('volunteers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('volunteers_id_number')->nullable();
            $table->string('volunteers_name')->nullable();
            $table->string('volunteers_place_of_birth')->nullable();
            $table->date('volunteers_date_of_birth')->nullable();
            $table->enum('volunteers_gender',['L','P'])->nullable();
            $table->string('volunteers_work')->nullable();
            $table->text('volunteers_address')->nullable();
            $table->integer('volunteers_rt')->nullable();
            $table->integer('volunteers_rw')->nullable();
            $table->bigInteger('volunteers_cellphone')->nullable();

            $table->unsignedBigInteger('subdistricts_id');
            $table->foreign("subdistricts_id")->references('id')->on("subdistricts");

            $table->unsignedBigInteger('village_districts_id');
            $table->foreign("village_districts_id")->references('id')->on("village_districts");

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('volunteer');
    }
}
