import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:base_client/core/utils/http/app_exceptions.dart';
import 'package:base_client/core/utils/http/process_response.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  HttpClient._();
  static const timeoutException = 20;

  // --- GET
  static Future<dynamic> get({required String uri}) async {
    try {
      var response = await http
          .get(Uri.parse(uri))
          .timeout(const Duration(seconds: timeoutException));
      return processResponse(response);
    } on SocketException {
      throw FetchDataException(message: "Connection Failed.");
    } on TimeoutException {
      throw ApiNotRespondingException(message: "Server not responded in time.");
    }
  }

  // --- POST
  static Future<dynamic> post({required String uri, Map? payload}) async {
    Map body = payload ?? {};
    try {
      var response = await http
          .post(Uri.parse(uri), body: jsonEncode(body))
          .timeout(const Duration(seconds: timeoutException));
      return processResponse(response);
    } on SocketException {
      throw FetchDataException(message: "Connection Failed.");
    } on TimeoutException {
      throw ApiNotRespondingException(message: "Server not responded in time.");
    }
  }

  // --- PUT
  static Future<dynamic> put({required String uri, required Map body}) async {
    try {
      var response = await http
          .put(Uri.parse(uri), body: jsonEncode(body))
          .timeout(const Duration(seconds: timeoutException));
      return processResponse(response);
    } on SocketException {
      throw FetchDataException(message: "Connection Failed.");
    } on TimeoutException {
      throw ApiNotRespondingException(message: "Server not responded in time.");
    }
  }

  // --- PATCH
  static Future<dynamic> patch({required String uri, required Map body}) async {
    try {
      var response = await http
          .patch(Uri.parse(uri), body: jsonEncode(body))
          .timeout(const Duration(seconds: timeoutException));
      return processResponse(response);
    } on SocketException {
      throw FetchDataException(message: "Connection Failed.");
    } on TimeoutException {
      throw ApiNotRespondingException(message: "Server not responded in time.");
    }
  }

  // --- DELETE
  static Future<dynamic> delete({required String uri}) async {
    try {
      var response = await http
          .delete(Uri.parse(uri))
          .timeout(const Duration(seconds: timeoutException));
      return processResponse(response);
    } on SocketException {
      throw FetchDataException(message: "Connection Failed.");
    } on TimeoutException {
      throw ApiNotRespondingException(message: "Server not responded in time.");
    }
  }
}
