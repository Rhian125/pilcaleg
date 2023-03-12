<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRtRw extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('rt_rw', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('rt_number')->nullable();
            $table->integer('rw_number')->nullable();

            $table->unsignedBigInteger('subdistricts_id');
            $table->foreign("subdistricts_id")->references('id')->on("subdistricts");

            $table->unsignedBigInteger('village_districts_id');
            $table->foreign("village_districts_id")->references('id')->on("village_districts");

            $table->integer('user_id')->nullable();
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
        Schema::dropIfExists('rt_rw');
    }
}
