import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.name,
    required this.email,
  });

  final String name;
  final String email;

  @override
  List<Object> get props => [name, email];
}
