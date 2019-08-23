<?php

/** @var \Illuminate\Database\Eloquent\Factory $factory */

use App\User;
use Faker\Generator as Faker;

$factory->define(User::class, function (Faker $faker) {
    return [
        'id_number' => $faker->idNumber,
        'name' => $faker->name, 
        'email' => $faker->email->unique(), 
        'password' => $faker->password,
        'phone_number' => $faker->e164PhoneNumber,
        'role_id' => $faker->randomElement($array = array (1,2)),

    ];
});
