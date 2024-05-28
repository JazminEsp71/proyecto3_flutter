class Planta{
  String nombre;
  int frecuenciaDeRiego;
  String foto;

  Planta({required this.nombre, required this.frecuenciaDeRiego, required this.foto});

  factory Planta.fromJson(Map<String, dynamic> json){
    return Planta(
      nombre: json['nombre'],
      frecuenciaDeRiego: json ['frecuenciaDeRiego'],
      foto: json['foto']
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'nombre' : nombre,
      'frecuenciaDeRiego': frecuenciaDeRiego,
      'foto' : foto
    };
  }
}