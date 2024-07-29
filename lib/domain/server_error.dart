import 'package:camping/core/app_colors.dart';
import 'package:camping/screens/common/flash.dart';
import 'package:camping/screens/common/flash/flash.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' hide Headers;

class ServerError implements Exception {
  String _errorMessage = "";

  ServerError.withError({required DioException error}) {
    _handleError(error);
  }

  _handleError(DioException error) async {
    switch (error.type) {
      case DioExceptionType.sendTimeout:
        _errorMessage = "Connection timeout";
        flash(_errorMessage, AppColors.grey_100,
            position: FlashPosition.bottom);
        break;
      case DioExceptionType.receiveTimeout:
        _errorMessage = "Connection timeout";
        flash(_errorMessage, AppColors.grey_100,
            position: FlashPosition.bottom);
        break;
      case DioExceptionType.cancel:
        _errorMessage = "Canceled";
        flash(_errorMessage, AppColors.grey_100,
            position: FlashPosition.bottom);
        break;
      case DioExceptionType.connectionTimeout:
        _errorMessage = "Connection timeout";
        flash(_errorMessage, AppColors.grey_100,
            position: FlashPosition.bottom);
        break;
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        break;
      case DioExceptionType.badResponse:
        try{
          _errorMessage = error.response?.data['message'];
        }catch(e){
          _errorMessage = 'Server bilan xatolik yuz berdi';
        }
        flash(_errorMessage, AppColors.grey_100,
            position: FlashPosition.bottom);
        break;
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        break;
      case DioExceptionType.unknown:
        _errorMessage = "Something wrong";
        final status = await Connectivity().checkConnectivity();
        if (status == ConnectivityResult.none) {
          _errorMessage = 'Internet aloqasi uzilgan';
        }
        flash(_errorMessage, AppColors.grey_100,
            position: FlashPosition.bottom);
        break;
    }
  }
}
