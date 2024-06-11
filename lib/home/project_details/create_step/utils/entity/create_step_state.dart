import 'package:equatable/equatable.dart';

class CreateStepState extends Equatable {
  const CreateStepState({
    required this.nameText,
    required this.detailsText,
    required this.orderText,
    required this.assets,
  });

  factory CreateStepState.empty() => const CreateStepState(
        nameText: '',
        detailsText: '',
        orderText: '',
        assets: [],
      );

  final String nameText;
  final String detailsText;
  final String orderText;
  final List<String> assets;

  CreateStepState copyWith({
    String? nameText,
    String? detailsText,
    String? orderText,
    List<String>? assets,
  }) =>
      CreateStepState(
        nameText: nameText ?? this.nameText,
        detailsText: detailsText ?? this.detailsText,
        orderText: orderText ?? this.orderText,
        assets: assets ?? this.assets,
      );

  @override
  List<Object> get props => [
        nameText,
        detailsText,
        orderText,
        assets,
      ];
}
