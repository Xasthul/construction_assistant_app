import 'dart:convert';

import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/home/project_details/step_details/utils/use_case/step_details_use_case.dart';
import 'package:construction_assistant_app/home/project_details/store/project_details_store.dart';
import 'package:construction_assistant_app/home/project_details/utils/notifier/project_details_notifier.dart';
import 'package:construction_assistant_app/home/utils/entity/project.dart';
import 'package:construction_assistant_app/home/utils/entity/step.dart';
import 'package:construction_assistant_app/home/utils/use_case/image_picker_use_case.dart';
import 'package:flutter/foundation.dart';
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
  final ImagePickerUseCase _imagePickerUseCase = getIt<ImagePickerUseCase>();
  final ProjectDetailsNotifier _projectDetailsNotifier = getIt<ProjectDetailsStore>();
  final CoreErrorFormatter _coreErrorFormatter = getIt<CoreErrorFormatter>();

  @readonly
  Step _step;
  ObservableList<Uint8List> assets = ObservableList.of([]);
  @readonly
  String _newStepName = '';
  @readonly
  String _newStepDetails = '';
  @readonly
  bool _isStepRenamedSuccessfully = false;
  @readonly
  bool _isStepDetailsUpdatedSuccessfully = false;
  @readonly
  bool _areAssetsUpdatedSuccessfully = false;
  @readonly
  bool _isStepDeletedSuccessfully = false;
  ObservableList<Uint8List> updateAssets = ObservableList.of([]);
  @readonly
  bool _isLoadingAsset = false;
  @readonly
  bool _isUpdateAssetsLoading = false;
  @readonly
  String? _errorMessage;

  @computed
  int get assetsCount => _step.assets.length;

  @computed
  bool get isUpdateStepNameEnabled => _newStepName.isNotEmpty;

  @computed
  bool get isUpdateStepDetailsEnabled => _newStepDetails.isNotEmpty;

  @computed
  bool get isSettingsButtonVisible => _project.isOwner;

  @computed
  int get updateAssetsCount => updateAssets.length;

  @computed
  bool get canAddMoreAssets => updateAssets.length < 3;

  @computed
  bool get isSaveAssetsButtonEnabled {
    final one = assets.map((asset) => base64Encode(asset)).toList();
    final two = updateAssets.map((asset) => base64Encode(asset)).toList();
    final temp = !listEquals(one, two);
    return !listEquals(one, two);
  }

  @action
  Future<void> load() async {
    assets = ObservableList.of(_step.assets.map((asset) => base64Decode(asset)).toList());
    updateAssets = assets;
  }

  @action
  Future<void> _loadStep() async {
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
  Future<void> renameStep() async {
    try {
      await _stepDetailsUseCase.updateStepDetails(
        projectId: _project.id,
        stepId: _step.id,
        title: _newStepName,
      );
      await _projectDetailsNotifier.loadSteps();
      await _loadStep();
      _isStepRenamedSuccessfully = true;
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> updateStepDetails() async {
    try {
      await _stepDetailsUseCase.updateStepDetails(
        projectId: _project.id,
        stepId: _step.id,
        details: _newStepDetails,
      );
      await _projectDetailsNotifier.loadSteps();
      await _loadStep();
      _isStepDetailsUpdatedSuccessfully = true;
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> updateStepAssets() async {
    _isUpdateAssetsLoading = true;
    try {
      final List<String> assets = updateAssets.map((asset) => base64Encode(asset)).toList();
      await _stepDetailsUseCase.updateStepDetails(
        projectId: _project.id,
        stepId: _step.id,
        assets: assets,
      );
      await _projectDetailsNotifier.loadSteps();
      await _loadStep();
      this.assets = ObservableList.of(_step.assets.map((asset) => base64Decode(asset)).toList());
      _areAssetsUpdatedSuccessfully = true;
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    } finally {
      _isUpdateAssetsLoading = false;
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
      await _loadStep();
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> deleteStep() async {
    try {
      await _stepDetailsUseCase.deleteStep(
        projectId: _project.id,
        stepId: _step.id,
      );
      await _projectDetailsNotifier.loadSteps();
      _isStepDeletedSuccessfully = true;
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    }
  }

  @action
  Future<void> addAsset() async {
    _isLoadingAsset = true;
    try {
      final asset = await _imagePickerUseCase.selectImage();
      if (asset == null) {
        return;
      }
      updateAssets.add(asset);
    } catch (error) {
      _errorMessage = _coreErrorFormatter.formatError(error);
    } finally {
      _isLoadingAsset = false;
    }
  }

  @action
  void deleteAsset(int index) => updateAssets.removeAt(index);

  @action
  void updateNewStepName(String newName) => _newStepName = newName;

  @action
  void updateNewStepDetails(String newStepDetails) => _newStepDetails = newStepDetails;

  @action
  void resetNewStepName() => _newStepName = '';

  @action
  void resetNewStepDetails() => _newStepDetails = '';

  @action
  void resetUpdateAssets() => updateAssets = assets;

  @action
  void resetIsStepDetailsUpdatedSuccessfully() => _isStepDetailsUpdatedSuccessfully = false;

  @action
  void resetIsStepRenamedSuccessfully() => _isStepRenamedSuccessfully = false;

  @action
  void resetIsStepDeletedSuccessfully() => _isStepDeletedSuccessfully = false;

  @action
  void resetAreAssetsUpdatedSuccessfully() => _areAssetsUpdatedSuccessfully = false;

  @action
  void resetErrorMessage() => _errorMessage = null;
}
