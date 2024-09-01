class AcademicYear {
  final int ano_letivo;
  final int periodo_letivo;

  AcademicYear({
    required this.ano_letivo,
    required this.periodo_letivo,
  });

  factory AcademicYear.fromJson(Map<String, dynamic> json) {
    return AcademicYear(
      periodo_letivo: json['periodo_letivo'],
      ano_letivo: json['ano_letivo'],
    );
  }
}
