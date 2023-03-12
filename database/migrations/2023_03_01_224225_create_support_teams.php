<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateSupportTeams extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('support_teams', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->bigInteger('support_teams_family_card_number')->nullable();
            $table->bigInteger('support_teams_id_number')->nullable();
            $table->string('support_teams_name')->nullable();
            $table->string('support_teams_place_of_birth')->nullable();
            $table->date('support_teams_date_of_birth')->nullable();
            $table->enum('support_teams_gender',['L','P'])->nullable();
            $table->string('support_teams_work')->nullable();
            $table->bigInteger('support_teams_cellphone')->nullable();
            $table->text('support_teams_address')->nullable();
            $table->integer('support_teams_rt')->nullable();
            $table->integer('support_teams_rw')->nullable();
            $table->integer('support_teams_must_choose')->nullable();

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
        Schema::dropIfExists('support_teams');
    }
}
