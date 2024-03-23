import 'package:base_client/core/helpers/app_snackbar.dart';
import 'package:base_client/core/utils/http/app_exceptions.dart';

mixin ErrorHandler {
  void handleError(error) {
    if (error is BadRequestException) {
      AppSnackbar.errorSnackBar(message: error.message);
    } else if (error is FetchDataException) {
      AppSnackbar.errorSnackBar(message: error.message);
    } else if (error is ApiNotRespondingException) {
      AppSnackbar.errorSnackBar(message: "Oops!, it took longer to respond.");
    } else if (error is UnAuthorizedException) {
      AppSnackbar.errorSnackBar(message: error.message);
    }
  }
}
