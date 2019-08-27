<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ViolationsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      DB::table('violations')->insert([
        [
          'user_id_number' => '2011-100422',
          'violation_type_id' => '1',
          'violation_name' => 'Dress code',
        ],
        [
          'user_id_number' => '2011-100422',
          'violation_type_id' => '2',
          'violation_name' => 'Plagiarism',
        ],
        [
          'user_id_number' => '',
          'violation_type_id' => '2',
          'violation_name' => 'Sexual Harassment',
        ],
        [
          'user_id_number' => '',
          'violation_type_id' => '1',
          'violation_name' => 'Public Display of Affection',
        ],
        [
          'user_id_number' => '',
          'violation_type_id' => '2',
          'violation_name' => 'Vandalism',
        ],
      ]);
    }
}
