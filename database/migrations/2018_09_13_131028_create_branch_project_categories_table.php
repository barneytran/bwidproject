<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateBranchProjectCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('branch_project_categories', function (Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('branch_id')->index();
            $table->unsignedInteger('project_category_id')->index();
            $table->foreign('branch_id')->references('id')->on('branch')->onDelete('cascade');
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
        Schema::dropIfExists('branch_project_categories');
    }
}
