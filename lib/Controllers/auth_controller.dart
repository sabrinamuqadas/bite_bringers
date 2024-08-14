import 'package:bite_bringers/data/repository/auth_repo.dart';
import 'package:bite_bringers/models/response_model.dart';
import 'package:bite_bringers/models/signup_body_model.dart';
import 'package:get/get.dart';

class AuthController extends GetxController implements GetxService{
  final AuthRepo authRepo;

  AuthController({
   required this.authRepo,
});

  bool _isLoading = false;
  bool get isLoading =>_isLoading;

  Future<ResponseModel> registration(SignUpBody  signUpBody) async {
    _isLoading = true;
    update();
    late ResponseModel responseModel;
    Response response = await authRepo.registration(signUpBody);
    if(response.statusCode==200){
      authRepo.saveUserToken(response.body["token"]);
      responseModel = ResponseModel(true, response.body["token"]);
    }else{
      responseModel = ResponseModel(false, response.statusText!);
    }
    _isLoading = false;
    update();
    return responseModel;
  }
}