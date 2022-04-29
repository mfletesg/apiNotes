<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Login extends Model
{
    use HasFactory;

    protected $table = 'login';


    public function checkLogin($usuario, $password)
    {
        $user = DB::SELECT('SELECT name, password
                            FROM users
                            WHERE status = ? AND name = ? AND password = ? LIMIT 1' ,
                            [1, $usuario, $password]);
        return $user;
    }

}
