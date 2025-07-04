<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Services\SicrediPixService;

class PixSincredController extends Controller
{
        public function create(Request $request)
    {
        $pix = new SicrediPixService();
        $response = $pix->generateCharge($request->all());

        return response()->json($response);
    }
}
