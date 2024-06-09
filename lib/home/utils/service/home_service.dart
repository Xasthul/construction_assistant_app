import 'package:construction_assistant_app/app/app_dependencies.dart';
import 'package:construction_assistant_app/app/utils/entity/app_constants.dart';
import 'package:construction_assistant_app/app/utils/network/dio_authorized_client.dart';
import 'package:construction_assistant_app/app/utils/network/response/app_data_response.dart';
import 'package:construction_assistant_app/home/utils/network/project_response.dart';

class HomeService {
  final DioAuthorizedClient _client = getIt<DioAuthorizedClient>();

  Future<List<ProjectResponse>> getProjects() async {
    final response = await _client.get('${AppConstants.serviceUrl}/projects');
    final appDataResponse = AppDataResponse.fromJson(response);
    final projectsResponse = appDataResponse.data as List<Map<String, dynamic>>;
    return projectsResponse.map((projectResponse) => ProjectResponse.fromJson(projectResponse)).toList();
  }
}
