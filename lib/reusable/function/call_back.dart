import 'package:flutter/cupertino.dart';

void callBackFunction(Function callback) {
  WidgetsBinding.instance?.addPostFrameCallback((_) {
    callback();
  });
}
