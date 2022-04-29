<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Note extends Model
{
    use HasFactory;

    protected $table = 'notes';


    public function createNote()
    {
        $user = DB::SELECT('INSERT INTO notes
                          (title, creationDate, status, iduser, icon)
                          VALUES(NULL, current_timestamp(), NULL, 0, NULL);
                          ');
        return $user;
    }
}
