import 'package:designsprit/features/project_status/domain/entities/installments.dart';

class InstallmentsModel extends Installments {
  const InstallmentsModel({
    required super.id,
    required super.projectName,
    required super.installmentValue,
    required super.date,
    required super.status,
  });

  factory InstallmentsModel.fromJson(Map<String, dynamic> json) => InstallmentsModel(
        id: json['id'],
        projectName: json['projectName'],
        installmentValue: json['installmentValue'],
        date: json['date'],
        status: json['status'],
      );
}
