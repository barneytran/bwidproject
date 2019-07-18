<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateServiceTranslationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('service_translation', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('service_id')->unsigned();
            $table->string('locale')->index();
            $table->string('title')->nullable();
            $table->string('slug')->nullable();
            $table->string('description', 1024)->nullable();
            $table->longText('content')->nullable();
            $table->unique(['service_id','locale']);
            $table->foreign('service_id')->references('id')->on('service')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('service_translation');
    }
}
