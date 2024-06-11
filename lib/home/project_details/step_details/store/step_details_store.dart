import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/use_case/step_details_use_case.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/project_details/utils/notifier/project_details_notifier.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:mobx/mobx.dart';

part 'step_details_store.g.dart';

class StepDetailsStore = _StepDetailsStore with _$StepDetailsStore;

abstract class _StepDetailsStore with Store {
  _StepDetailsStore({
    required Project project,
    required Step step,
  })  : _project = project,
        _step = step;

  final Project _project;
  final StepDetailsUseCase _stepDetailsUseCase = getIt<StepDetailsUseCase>();
  final ProjectDetailsNotifier _projectDetailsNotifier = getIt<ProjectDetailsStore>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  Step _step;
  @readonly
  String? _errorMessage;

  @computed
  int get assetsCount => _step.assets.length;

  @action
  Future<void> loadStepDetails() async {
    try {
      _step = await _stepDetailsUseCase.getStepDetails(
        projectId: _project.id,
        stepId: _step.id,
      );
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> completeStep() async {
    try {
      await _stepDetailsUseCase.completeStep(
        projectId: _project.id,
        stepId: _step.id,
      );
      await _projectDetailsNotifier.loadSteps();
      await loadStepDetails();
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  void resetErrorMessage() => _errorMessage = null;
}
