<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateVillageDistricts extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('village_districts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('village_districts_name')->nullable();

            $table->unsignedBigInteger('subdistricts_id');
            $table->foreign("subdistricts_id")->references('id')->on("subdistricts");
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
        Schema::dropIfExists('village_districts');
    }
}
