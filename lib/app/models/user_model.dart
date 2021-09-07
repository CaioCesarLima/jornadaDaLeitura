class User {
  final String id;
  final String name;
  final int level;
  bool respondeuNivelAtual;
  final bool permitirRepetir;
  final bool isAdmin;

  User(
      {this.isAdmin,
      this.id,
      this.name,
      this.level,
      this.respondeuNivelAtual,
      this.permitirRepetir});
}
