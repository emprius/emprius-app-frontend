import 'dart:io';
import 'package:flutter/material.dart';

ImageProvider assetOrFileImage (String path) =>
  path.startsWith("assets/") ? AssetImage(path) as ImageProvider : FileImage(File(path));