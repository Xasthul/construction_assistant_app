import 'package:equatable/equatable.dart';

class CreateStepState extends Equatable {
  const CreateStepState({
    required this.nameText,
    required this.detailsText,
    required this.orderText,
  });

  factory CreateStepState.empty() => const CreateStepState(
        nameText: '',
        detailsText: '',
        orderText: '',
      );

  final String nameText;
  final String detailsText;
  final String orderText;

  CreateStepState copyWith({
    String? nameText,
    String? detailsText,
    String? orderText,
  }) =>
      CreateStepState(
        nameText: nameText ?? this.nameText,
        detailsText: detailsText ?? this.detailsText,
        orderText: orderText ?? this.orderText,
      );

  @override
  List<Object> get props => [
        nameText,
        detailsText,
        orderText,
      ];
}
