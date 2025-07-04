<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PaymentPixModel extends Model
{
    protected $table = 'payment_pix';

    protected $fillable = [
        'key_pix',
        'full_pix',
        'status',
        'participant_id',
    ];
}
