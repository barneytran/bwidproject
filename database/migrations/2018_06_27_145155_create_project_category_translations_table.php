<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProjectCategoryTranslationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('project_category_translations', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('project_category_id')->index();
            $table->string('locale')->index();

            $table->string('name')->nullable();
            $table->string('slug')->nullable();
            $table->text('description')->nullable();

            $table->unique(['project_category_id','locale']);
            $table->foreign('project_category_id')->references('id')->on('project_categories')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('project_category_translations');
    }
}
