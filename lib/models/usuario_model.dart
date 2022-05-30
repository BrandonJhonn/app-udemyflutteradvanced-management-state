
class UsuarioModel {
  String nombre;
  int edad;
  List<String> profesiones;

  UsuarioModel({
    required this.nombre,
    required this.edad,
    required this.profesiones
  });

  UsuarioModel copyWith({
    String? nombre,
    int? edad,
    List<String>? profesiones,
  }) => UsuarioModel(
    nombre: nombre ?? this.nombre, 
    edad: edad ?? this.edad, 
    profesiones: profesiones ?? this.profesiones
  );
}