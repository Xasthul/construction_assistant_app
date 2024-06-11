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

  @readonly
  Step _step;
}
