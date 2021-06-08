<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Tree extends Model
{
    use HasFactory;

    protected $fillable = [
        'text',
    ];

    public function parent(){
        return $this->belongsTo(Tree::class,'parentID');
    }

    public function children(){
        return $this->hasMany(Tree::class,'parentID');
    }
}
