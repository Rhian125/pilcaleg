<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateWitness extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('witness', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('witness_id_number')->nullable();
            $table->string('witness_name')->nullable();
            $table->string('witness_place_of_birth')->nullable();
            $table->date('witness_date_of_birth')->nullable();
            $table->enum('witness_gender',['L','P'])->nullable();
            $table->string('witness_work')->nullable();
            $table->text('witness_address')->nullable();
            $table->integer('witness_rt')->nullable();
            $table->integer('witness_rw')->nullable();
            $table->bigInteger('witness_cellphone')->nullable();

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
        Schema::dropIfExists('witness');
    }
}
