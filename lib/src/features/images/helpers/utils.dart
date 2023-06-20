import 'dart:convert';
import 'dart:io';

String imageToBase64 (File image) => base64Encode(image.readAsBytesSync());