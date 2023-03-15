import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:ecommercecourse/core/class/statusrequest.dart';
import 'package:ecommercecourse/core/functions/checkinternet.dart';
import 'package:http/http.dart' as http;

class Crud {
  //
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(linkurl), body: data);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          // ignore: avoid_print
          print(responsebody);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverfailure);
        }
      } else {
        return const Left(StatusRequest.offlinefailure);
      }
    } catch (e) {
      // ignore: avoid_print
      print("ERROR $e");
      return const Left(StatusRequest.serverException);
    }
  }
  //
}
