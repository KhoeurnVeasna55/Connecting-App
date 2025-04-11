import 'package:connecting_app/controller/quesiton_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'myapp.dart';

void main() {
  Get.put(QuestionController());
  runApp(MyApp());
}
