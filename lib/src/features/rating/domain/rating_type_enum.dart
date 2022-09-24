import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

@JsonEnum()

enum RatingType{
  @JsonValue('All') ALL,
  @JsonValue('Tool') TOOL_RATE,
  @JsonValue('User') USER_RATE,
}