import 'package:construction_assistant_app/app/store/app_store.dart';
import 'package:construction_assistant_app/app/utils/component/dependency_scope.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_formatter.dart';
import 'package:construction_assistant_app/app/utils/core/core_error_handler.dart';
import 'package:construction_assistant_app/app/utils/network/dio_authorized_client.dart';
import 'package:construction_assistant_app/app/utils/network/dio_general_client.dart';
import 'package:construction_assistant_app/app/utils/use_case/secure_storage.dart';
import 'package:construction_assistant_app/l10n/generated/app_localizations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final getIt = GetIt.instance;

class AppDependencies extends StatefulWidget {
  const AppDependencies({
    super.key,
    required Widget child,
  }) : _child = child;

  final Widget _child;

  @override
  State<AppDependencies> createState() => _AppDependenciesState();
}

class _AppDependenciesState extends State<AppDependencies> with DependencyScope {
  @override
  Widget build(BuildContext context) => widget._child;

  @override
  void registerDependencies() {
    getIt.registerLazySingleton<Logger>(
      () => Logger(printer: PrettyPrinter(errorMethodCount: 12)),
    );
    getIt.registerLazySingleton<DioGeneralClient>(() => DioGeneralClient(dio: Dio()));
    getIt.registerLazySingleton<DioAuthorizedClient>(
      () => DioAuthorizedClient(dio: Dio())..addRefreshTokenInterceptor(),
    );
    getIt.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
    getIt.registerLazySingleton<SecureStorage>(() => SecureStorage());
    getIt.registerLazySingleton<AppLocalizations>(() => AppLocalizations.of(context));
    getIt.registerLazySingleton<CoreErrorHandler>(() => CoreErrorHandler());
    getIt.registerLazySingleton<CoreErrorFormatter>(() => CoreErrorFormatter());
    getIt.registerLazySingleton<AppStore>(() => AppStore()..load());
  }
}
