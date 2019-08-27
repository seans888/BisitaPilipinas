<?php

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class RolesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      DB::table('roles')->insert([
        [
          'role_name' => 'student',
        ],
        
        [
          'role_name' => 'professor',
        ],
        
        [
          'role_name' => 'security guard',
        ],
        
        [
          'role_name' => 'guidance counselor',
        ],
        
        [
          'role_name' => 'program director',
        ],
        
        [
          'role_name' => 'discipline officer',
        ],
      ]);
    }
}
