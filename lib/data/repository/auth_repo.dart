import 'package:bite_bringers/data/api/api_client.dart';
import 'package:bite_bringers/models/signup_body_model.dart';
import 'package:bite_bringers/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepo{
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
});

  registration(SignUpBody signUpBody){
    apiClient.postData(AppConstants.REGISTRATION_URI, body)
  }
}