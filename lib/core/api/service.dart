import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_provider/core/api/bean/request/register_request.dart';
import 'package:flutter_provider/core/api/service_learning.dart';
import 'package:flutter_provider/core/model/city_model.dart';
import 'package:flutter_provider/core/model/error/error_response.dart';
import 'package:networking/networking/header.dart';
import 'package:networking/networking/network_config.dart';
import 'package:networking/networking/network_listener.dart';
import 'package:networking/networking/network_manager.dart';
import 'package:networking/networking/networking_factory.dart';
import 'package:flutter_provider/core/api/bean/response/login_response.dart';

import 'bean/request/login_request.dart';

class Service {
  //static final instance = Service._privateConstructor();
  NetworkManager _manager;

  Service({String url="http://37.131.251.245:8080/"}) {
    NetworkConfig _config = new NetworkConfig();
    ServiceLearning _learning = new ServiceLearning();
    _config.setBaseUrl(url);
    _config.addSuccessCodes(200, 205);
    _manager = NetworkingFactory.create(config: _config);
    if (_manager == null) _manager = NetworkingFactory.create(config: _config);
    _manager.learning = _learning;
  }

  Future login({@required LoginRequest loginRequest, NetworkListener<dynamic, dynamic> listener}) async {
    await _manager
        .post<LoginRequest, LoginResponse, ErrorResponse>(url: "/accounts/login", type: LoginResponse(), errorType: ErrorResponse(), body: loginRequest, listener: listener)
        .fetch();
  }

  Future<LoginResponse> register({@required RegisterRequest registerRequest, NetworkListener<dynamic, dynamic> listener}) async {
    await _manager
        .post<RegisterRequest, LoginResponse, ErrorResponse>(
            url: "/accounts/register", type: LoginResponse(), body: registerRequest, errorType: ErrorResponse(), listener: listener)
        .fetch();
  }

  Future getAllCity({NetworkListener<dynamic, dynamic> listener}) async {
    await _manager
        .get<CityCountyListResponse, ErrorResponse>(url: "cities", type: CityCountyListResponse(), errorType: ErrorResponse(), listener: listener)
        .asList(true)
        .contentType(new ContentType("application", "json", charset: "utf-8"))
        .fetch();
  }

  Future getCounties({int cityId, NetworkListener<dynamic, dynamic> listener}) async {
    await _manager
        .get<CityCountyListResponse, ErrorResponse>(url: "cities/$cityId/counties", type: CityCountyListResponse(), errorType: ErrorResponse(), listener: listener)
        .asList(true)
        .contentType(new ContentType("application", "json", charset: "utf-8"))
        .fetch();
  }
}
