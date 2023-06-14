import 'dart:io';
import 'package:empriusapp/src/core/services/networking/api_endpoint.dart';
import 'package:flutter/material.dart';

ImageProvider assetOrFileImage (String path) =>
  path.startsWith("assets/") ? AssetImage(path) as ImageProvider : FileImage(File(path));

// Check if a string is a sha256 hash, used to check if is a empirus image
bool isEmpriusImage(String hash) {
  RegExp exp = RegExp(r'^[A-Fa-f0-9]{64}$');
  return exp.hasMatch(hash);
}