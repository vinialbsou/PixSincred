<?php
namespace App\Services;


use GuzzleHttp\Client;

class SicrediPixService
{
    protected $baseUrl;
    protected $certPath;
    protected $certKey;
    protected $clientId;
    protected $clientSecret;
    protected $sicredPixKey;

    public function __construct()
    {
        $this->baseUrl = config('sicredi.sicredi_base_url'); 
        $this->certPath = storage_path('pix/sicredi.pem');
        $this->certKey = storage_path('pix/sicredi.key');
        $this->clientId = config('sicredi.sicredi_client_id'); 
        $this->clientSecret = config('sicredi.sicredi_client_secret'); 
        $this->sicredPixKey = config('sicredi.sicredi_sicred_pix_key'); 
    }

    public function generateCharge(array $data)
    {
         $token = $this->getAccessToken();
        if (!$token) {
            throw new \Exception("Erro ao obter token de autenticação Sicredi");
        }

        $payload = [
            'calendario' => ['expiracao' => 3600],
            'devedor' => [
                'cpf' => preg_replace('/\D/', '', $data['cnpj']), //Verificando se tem letras
                'nome' => $data['nome'],
            ],
            'valor' => ['original' => number_format($data['valor'], 2, '.', '')],
            'chave' => $this->sicredPixKey,
            'solicitacaoPagador' => 'Pagamento de compra'
        ];

        $client = new Client();

        $response = $client->post("{$this->baseUrl}/api/v2/cob", [
            'json' => $payload,
            'cert' => $this->certPath,
            'ssl_key' => $this->certKey,
            'headers' => [
                'Authorization' => 'Bearer ' . $token,
                'Content-Type' => 'application/json',
            ],
            'verify' => false, // cuidado, só use false em dev
        ]);

        return json_decode($response->getBody(), true);
    }

    protected function getAccessToken()
    {
        $client = new Client();

        $response = $client->post(config('sicredi.'), [
            'form_params' => [
                'grant_type' => 'client_credentials',
                'client_id' => $this->clientId,
                'client_secret' => $this->clientSecret,
                'scope' => 'pix.write pix.read',
            ],
            'cert' => $this->certPath,
            'ssl_key' => $this->certKey,
            'verify' => false,
        ]);

        $data = json_decode($response->getBody(), true);

        return $data['access_token'] ?? null;
    }
}
