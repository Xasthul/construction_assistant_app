import 'package:equatable/equatable.dart';

class Step extends Equatable {
  Step({
    required this.id,
    required this.projectId,
    required this.title,
    required this.details,
    required this.assets,
    required this.order,
    required this.isCompleted,
    required this.completedBy,
  });

  final String id;
  final String projectId;
  final String title;
  final String details;
  final List<String> assets;
  final int order;
  final bool isCompleted;
  final String? completedBy;

  @override
  List<Object?> get props => [
        id,
        projectId,
        title,
        details,
        assets,
        order,
        isCompleted,
        completedBy,
      ];
}
