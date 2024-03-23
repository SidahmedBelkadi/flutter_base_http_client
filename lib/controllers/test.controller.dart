import 'package:base_client/core/constants/app_links.dart';
import 'package:base_client/core/helpers/app_snackbar.dart';
import 'package:base_client/core/helpers/error_handler.dart';
import 'package:base_client/core/utils/http/http_client.dart';
import 'package:get/get.dart';

class TestController extends GetxController with ErrorHandler {
  RxBool isLoading = false.obs;

  Future<void> getData() async {
    try {
      isLoading(true);
      var response = await HttpClient.get(endpoint: AppLink.getTodo)
          .catchError(handleError);

      if (response == null) return;
    } catch (e) {
      AppSnackbar.errorSnackBar(message: e.toString());
    } finally {
      isLoading(false);
    }
  }

  Future<void> postData() async {
    try {
      Map payload = {'message': 'hello world !! sidahmed'};

      isLoading(true);

      var response =
          await HttpClient.post(endpoint: AppLink.post, payload: payload)
              .catchError(handleError);

      if (response == null) return;

      print(response);
    } catch (e) {
      AppSnackbar.errorSnackBar(message: e.toString());
    } finally {
      isLoading(false);
    }
  }
}
