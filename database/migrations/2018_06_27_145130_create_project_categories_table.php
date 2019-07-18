<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

/**
 * Class CreateProjectCategoriesTable.
 */
class CreateProjectCategoriesTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('project_categories', function(Blueprint $table) {
            $table->increments('id');
            $table->integer('position')->nullable();
            $table->string('thumbnail')->nullable();
            $table->string('banner')->nullable();
            $table->string('icon')->nullable();
            $table->tinyInteger('active')->nullable()->index();
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
		Schema::drop('project_categories');
	}
}
