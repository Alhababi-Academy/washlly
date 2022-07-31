import 'package:flutter/material.dart';

circularProgress() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 12.0),
    child: const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.lightBlueAccent),
    ),
  );
}

linearProgress() {
  return Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.only(top: 12.0),
    child: const LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Colors.lightBlueAccent),
    ),
  );
}
