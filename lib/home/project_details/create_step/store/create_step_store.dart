import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/home/project_details/create_step/utils/entity/create_step_state.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/project_details/utils/notifier/project_details_notifier.dart';
import 'package:construction_assistant_app/home/project_details/utils/use_case/project_details_use_case.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:mobx/mobx.dart';

part 'create_step_store.g.dart';

class CreateStepStore = _CreateStepStore with _$CreateStepStore;

abstract class _CreateStepStore with Store {
  _CreateStepStore({required Project project}) : _project = project;

  final Project _project;
  final ProjectDetailsUseCase _projectDetailsUseCase = getIt<ProjectDetailsUseCase>();
  final ProjectDetailsNotifier _projectDetailsNotifier = getIt<ProjectDetailsStore>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  CreateStepState _createAccountState = CreateStepState.empty();
  @readonly
  bool _isStepCreatedSuccessfully = false;
  @readonly
  String? _errorMessage;

  @computed
  bool get isCreateButtonEnabled => _createAccountState.nameText.isNotEmpty;

  @action
  void updateCreateStepState({
    String? nameText,
    String? detailsText,
    String? orderText,
    List<String>? assets,
  }) =>
      _createAccountState = _createAccountState.copyWith(
        nameText: nameText,
        detailsText: detailsText,
        orderText: orderText,
        assets: assets,
      );

  @action
  Future<void> createStep() async {
    try {
      await _projectDetailsUseCase.createStep(
        projectId: _project.id,
        title: _createAccountState.nameText,
        details: _createAccountState.detailsText,
        assets: _createAccountState.assets,
        order: int.parse(_createAccountState.orderText),
      );
      await _projectDetailsNotifier.loadSteps();
      _isStepCreatedSuccessfully = true;
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  void resetIsStepCreatedSuccessfully() => _isStepCreatedSuccessfully = false;

  @action
  void resetErrorMessage() => _errorMessage = null;
}
