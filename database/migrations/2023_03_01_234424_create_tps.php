<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateTps extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('tps', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('number_of_tps')->nullable();
            $table->text('tps_information')->nullable();

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
        Schema::dropIfExists('tps');
    }
}
