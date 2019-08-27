<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      DB::table('users')->insert([
        [
          'id_number' => '2011-100422',
          'role_id' => '1',
          'name' => 'John David Solomnon',
          'email' => 'jlsolomon@student.apc.edu.ph',
          'phone_number' => '09140748733',
          'password' => 'password',
        ],
        [
          'id_number' => '2013-100222',
          'role_id' => '1',
          'name' => 'Dody Alkarim',
          'email' => 'dalkarim@student.apc.edu.ph',
          'phone_number' => '09140748733',
          'password' => 'password',
          
        ],
        [
          'id_number' => '2008-10042',
          'role_id' => '2',
          'name' => 'Manuel Sebastian Sanchez',
          'email' => 'manuels@apc.edu.ph',
          'phone_number' => '09243327742',
          'password' => 'password',
          
        ],
        [
          'id_number' => '2000-10442',
          'role_id' => '3',
          'name' => 'John Doe',
          'email' => '',
          'phone_number' => '',
          'password' => 'password',
          
        ],
        [
          'id_number' => '2015-10525',
          'role_id' => '4',
          'name' => 'Angel Arca',
          'email' => 'angela@apc.edu.ph',
          'phone_number' => '09120748733',
          'password' => 'password',
        ],
        [
          'id_number' => '2003-10843',
          'role_id' => '5',
          'name' => 'Ernesto Boydon',
          'email' => 'ernestob@apc.edu.ph',
          'phone_number' => '0913748733',
          'password' => 'password',
        ],
        [
          'id_number' => '2018-10682',
          'role_id' => '6',
          'name' => 'Raymart J. Cabiten',
          'email' => 'raymartc@apc.edu.ph',
          'phone_number' => '09160748733',
          'password' => 'password',
        ],
      ]);
    }
}
