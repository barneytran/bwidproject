<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProjectTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('project_translations', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('project_id')->index();
            $table->string('locale')->index();

            $table->string('name')->nullable();
            $table->string('slug')->nullable();
            $table->string('address')->nullable();
            $table->string('contact_person')->nullable();
            $table->text('description')->nullable();

            $table->unique(['project_id','locale']);
            $table->foreign('project_id')->references('id')->on('projects')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('project_translations');
    }
}
