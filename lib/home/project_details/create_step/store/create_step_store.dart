import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:mobx/mobx.dart';

part 'create_step_store.g.dart';

class CreateStepStore = _CreateStepStore with _$CreateStepStore;

abstract class _CreateStepStore with Store {
  _CreateStepStore({
    required Project project,
    required Step step,
  })  : _project = project,
        _step = step;

  final Project _project;

  @readonly
  Step _step;
}
