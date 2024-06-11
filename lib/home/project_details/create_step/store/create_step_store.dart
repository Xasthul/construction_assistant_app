import 'dart:convert';
import 'dart:typed_data';

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
  ObservableList<Uint8List> assets = ObservableList.of([]);
  @readonly
  bool _isStepCreatedSuccessfully = false;
  @readonly
  bool _isLoadingAsset = false;
  @readonly
  String? _errorMessage;

  @computed
  bool get isCreateButtonEnabled => _createAccountState.nameText.isNotEmpty && _createAccountState.orderText.isNotEmpty;

  @computed
  int get addedAssetsCount => assets.length;

  @computed
  bool get canAddMoreAssets => assets.length < 3;

  @action
  void updateCreateStepState({
    String? nameText,
    String? detailsText,
    String? orderText,
  }) =>
      _createAccountState = _createAccountState.copyWith(
        nameText: nameText,
        detailsText: detailsText,
        orderText: orderText,
      );

  @action
  Future<void> createStep() async {
    try {
      final List<String> assets = this.assets.map((asset) => base64Encode(asset)).toList();
      await _projectDetailsUseCase.createStep(
        projectId: _project.id,
        title: _createAccountState.nameText,
        details: _createAccountState.detailsText,
        assets: assets,
        order: int.parse(_createAccountState.orderText),
      );
      await _projectDetailsNotifier.loadSteps();
      _isStepCreatedSuccessfully = true;
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> addAsset() async {
    _isLoadingAsset = true;
    try {
      final asset = await _projectDetailsUseCase.selectImage();
      if (asset == null) {
        return;
      }
      assets.add(asset);
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    } finally {
      _isLoadingAsset = false;
    }
  }

  @action
  void resetIsStepCreatedSuccessfully() => _isStepCreatedSuccessfully = false;

  @action
  void resetErrorMessage() => _errorMessage = null;
}
