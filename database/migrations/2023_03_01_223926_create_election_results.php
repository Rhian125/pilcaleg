<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateElectionResults extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('election_results', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('tps')->nullable();
            $table->integer('number_of_ballots')->nullable();
            $table->integer('number_of_valid_documents')->nullable();
            $table->integer('number_of_invalid_letters')->nullable();
            $table->integer('number_of_ohers')->nullable();

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
        Schema::dropIfExists('election_results');
    }
}
