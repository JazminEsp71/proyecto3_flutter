class Usuario {
  String nombre;
  String password;

  Usuario({required this.nombre, required this.password});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      nombre: json['nombre'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': nombre,
      'password': password,
    };
  }
}
