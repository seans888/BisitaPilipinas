<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->smallInteger('id_number', 11);
            $table->integer('role_id')->index()->nullable();
            $table->string('name', 45);
            $table->string('email')->unique();
            $table->string('phone_number', 11);
            $table->string('password', 45);
            $table->rememberToken();
            $table->timestamps();

            $table->primary('id_number');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
