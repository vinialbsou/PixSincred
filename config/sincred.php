<?php

return [
    'sicredi_base_url' => env('SICREDI_BASE_URL', 'https://api-pix.sicredi.com.br'),
    'sicredi_client_id' => env('SICREDI_CLIENT_ID',''),
    'sicredi_client_secret'=> env('SICREDI_CLIENT_SECRET',''),
    'sicredi_sicred_pix_key'=> env('SICREDI_PIX_KEY',''),
    'auth_sicredi' => 'https://auth.sicredi.com.br/auth/realms/sandbox/protocol/openid-connect/token',
];
