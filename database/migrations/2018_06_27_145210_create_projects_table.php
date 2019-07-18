<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

/**
 * Class CreateProjectsTable.
 */
class CreateProjectsTable extends Migration
{
	/**
	 * Run the migrations.
	 *
	 * @return void
	 */
	public function up()
	{
		Schema::create('projects', function(Blueprint $table) {
            $table->increments('id');
            $table->unsignedInteger('category_id')->index()->nullable();

            $table->string('thumbnail')->nullable();
            $table->string('banner')->nullable();
            $table->string('phone')->nullable();
            $table->string('email')->nullable();
            $table->string('lat')->nullable();
            $table->string('lng')->nullable();
            $table->text('pictures')->nullable();

            $table->integer('position')->nullable();
            $table->tinyInteger('active')->nullable()->index();

            $table->text('features')->nullable();

            $table->timestamps();

            $table->foreign('category_id')->references('id')->on('project_categories')->onDelete('set null');
		});
	}

	/**
	 * Reverse the migrations.
	 *
	 * @return void
	 */
	public function down()
	{
		Schema::drop('projects');
	}
}
