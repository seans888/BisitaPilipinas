<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ViolationTypesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      DB::table('violation_types')->insert([
        [
          'type' => 'minor',
        ],
        [
          'type' => 'major',
        ],
      ]);
    }
}
