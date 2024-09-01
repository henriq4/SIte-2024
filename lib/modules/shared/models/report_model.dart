class ReportModel {
  final bool isSecondSemester;
  final int workload;
  final int completedWorkload;
  final int absencesNumber;
  final int absencesPercentage;
  final Phases? firstPhase;
  final Phases? secondPhase;
  final Phases? thirdPhase;
  final Phases? fourthPhase;

  ReportModel({
    required this.isSecondSemester,
    required this.workload,
    required this.completedWorkload,
    required this.absencesNumber,
    required this.absencesPercentage,
    this.firstPhase,
    this.secondPhase,
    this.thirdPhase,
    this.fourthPhase,
  });

  factory ReportModel.fromJson(Map<String, dynamic> json) {
    return ReportModel(
      isSecondSemester: json['segundo_semestre'],
      workload: json['carga_horario'],
      completedWorkload: json['carga_horaria_cumprida'],
      absencesNumber: json['numero_faltas'],
      absencesPercentage: json['percentual_carga_horaria_frequentada'],
      firstPhase: Phases.fromJson(json['nota_etapa_1']),
      secondPhase: Phases.fromJson(json['nota_etapa_2']),
      thirdPhase: Phases.fromJson(json['nota_etapa_3']),
      fourthPhase: Phases.fromJson(json['nota_etapa_4']),
    );
  }
}

class Phases {
  final int absences;
  final int? note;

  Phases({
    required this.absences,
    this.note,
  });

  factory Phases.fromJson(Map<String, dynamic> json) {
    return Phases(
      absences: json['absences'],
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'absences': absences,
      'note': note,
    };
  }
}
