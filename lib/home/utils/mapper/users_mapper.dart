import 'package:construction_assistant_app/home/utils/entity/user.dart';
import 'package:construction_assistant_app/home/utils/network/user_response.dart';

class UsersMapper {
  User mapUserResponseToDomain(UserResponse userResponse) => User(
        name: userResponse.name,
        email: userResponse.email,
      );
}
