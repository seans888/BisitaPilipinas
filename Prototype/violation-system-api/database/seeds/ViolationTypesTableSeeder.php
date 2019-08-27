<?php

use Illuminate\Database\Seeder;

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
