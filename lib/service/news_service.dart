import 'package:dio/dio.dart';
import 'package:nuews/core/constants.dart';
import 'package:nuews/core/networ_error.dart';

import 'package:nuews/model/newes_model.dart';

class NewesService {
  Future<dynamic> getTesla() async {
    try {
      Response response = await Dio().get(MyConstants.tesla);
      if (response.statusCode == 200) {
        return SuccessResponse(NewseModel.fromJson(response.data));
      } else {
        return NetworOrHttpError(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }

  Future<dynamic> getApple() async {
    try {
      Response response = await Dio().get(MyConstants.apple);
      if (response.statusCode == 200) {
        return SuccessResponse(NewseModel.fromJson(response.data));
      } else {
        return NetworOrHttpError(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }

  Future<dynamic> headlines() async {
    try {
      Response response = await Dio().get(MyConstants.headlines);

      if (response.statusCode == 200) {
        return SuccessResponse(NewseModel.fromJson(response.data));
      } else {
        return NetworOrHttpError(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }

  Future<dynamic> techcrunch() async {
    try {
      Response response = await Dio().get(MyConstants.techcrunch);
      if (response.statusCode == 200) {
        return SuccessResponse(NewseModel.fromJson(response.data));
      } else {
        return NetworOrHttpError(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }

  Future<dynamic> domains() async {
    try {
      Response response = await Dio().get("https://newsapi.org/v2/everything?domains=wsj.com&apiKey=3c4bf47591c74423a7fe942aebb73431");
      if (response.statusCode == 200) {
      
        return SuccessResponse(NewseModel.fromJson(response.data));
      } else {
        return NetworOrHttpError(response.statusMessage.toString());
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
