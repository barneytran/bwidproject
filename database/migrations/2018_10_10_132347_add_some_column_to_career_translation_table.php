<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddSomeColumnToCareerTranslationTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('career_translation', function (Blueprint $table) {
            $table->text('description')->nullable();
            $table->text('requirement')->nullable();
            $table->text('benefit')->nullable();
            $table->text('resume_requirement')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('career_translation', function (Blueprint $table) {
            $table->dropColumn('description');
            $table->dropColumn('requirement');
            $table->dropColumn('benefit');
            $table->dropColumn('resume_requirement');
        });
    }
}
