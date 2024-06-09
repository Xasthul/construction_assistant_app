import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:equatable/equatable.dart';

class Project extends Equatable {
  const Project({
    required this.id,
    required this.title,
    required this.users,
    required this.createdBy,
  });

  final String id;
  final String title;
  final List<User> users;
  final String createdBy;

  @override
  List<Object> get props => [
        id,
        title,
        users,
        createdBy,
      ];
}
