import 'package:networking/networking/model/error_model.dart';
import 'package:networking/networking/model/result_model.dart';
import 'package:networking/networking/network_learning.dart';
import 'package:networking/networking/network_listener.dart';

import '../../model/base/base_response.dart';

class ApiLearning extends NetworkLearning {

  @override
  checkCustomError(NetworkListener listener, ErrorModel error) {
    try {
      ErrorModel<BaseResponse> errorResponse = ErrorModel<BaseResponse>();

      if (error.data != null && error.data is BaseResponse) {
        BaseResponse response = error.data;
        errorResponse.description = response.responseException != null
            ? response.responseException!.exceptionMessage
            : response.message;
        return sendError(listener, errorResponse);
      }
      return sendError(listener, error);
    } catch (e) {
      return sendError(listener, error);
    }
  }

  @override
  checkSuccess<T>(NetworkListener listener, ResultModel result) {
    try {
      final response = BaseResponse.fromJson(result.json);

      if (response.statusCode != null &&
          response.statusCode! > 299 &&
          response.responseException != null) {
        ErrorModel<BaseResponse> error = ErrorModel<BaseResponse>();
        error.description = response.responseException!.exceptionMessage;
        return sendError(listener, error);
      } else if (response.success != null && response.success!) {
        return sendSuccess(listener, result);
      } else {
        ErrorModel<String> error = ErrorModel();
        error.description = response.message;
        return sendError(listener, error);
      }
    } on NoSuchMethodError catch (e) {
      ErrorModel<StackTrace> error = new ErrorModel();
      error.data = e.stackTrace!;
      return sendError(listener, error);
    }
  }
}
