class Position {

 double lat;
 double lng;
 String data;
 int angulo;
 int velocidade;
 String veiculo_placa;
 String condutor_nome;

 Position(
   this.lat,
   this.lng,
   this.data,
   this.angulo,
   this.velocidade,
   this.veiculo_placa,
   this.condutor_nome,
 );

 Position.fromJson(Map<String, dynamic> json)
     : lat = json['lat'] ?? 0.0,
       lng = json['lng'] ?? 0.0,
       data = json['data'] ?? "",
       angulo = json['angulo'] ?? 0,
       velocidade = json['velocidade'] ?? 0,
       veiculo_placa = json['veiculo_placa'] ?? "",
       condutor_nome = json['condutor_nome'] ?? "";

}
