
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:empriusapp/src/features/bookings/domain/enums/booking_status_enum.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'booking_model.freezed.dart';
part 'booking_model.g.dart';

@freezed
class BookingModel with _$BookingModel{

  const factory BookingModel({
    int? bookingId,
    int? toolId,
    double? emps,
    DateTime? startDate,
    DateTime? endDate,
    int? fromUserId,
    int? toUserId,
    required String contact,
    required BookingStatus bookingStatus,
    String? comments
}) = _BookingModel;


factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

}