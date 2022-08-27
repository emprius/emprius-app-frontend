import 'package:freezed_annotation/freezed_annotation.dart';

@JsonEnum()
enum TransportOptions{
  @JsonValue("Cap en especial") NOT_NECESSARY,
  @JsonValue("Necessita remolc") EXTRA_NECESSARY,
  @JsonValue("Necessita vehicle pesat") NECESSARY,
}