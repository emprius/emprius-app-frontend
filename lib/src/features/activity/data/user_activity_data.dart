class ActivityData {
  final int id;
  final String name;
  final double bookingCount;
  final double requestCount;

  const ActivityData({
    required this.name,
    required this.id,
    required this.bookingCount,
    required this.requestCount,
  });
}

class BarData {
  // to display numbers on sides
  static int interval = 5;

  static final List<ActivityData> userActivityCount = [
    const ActivityData(
      id: 0,
      name: 'Gener',
      bookingCount: 6,
      requestCount: 7,
    ),
    const ActivityData(
      id: 1,
      name: 'Febrer',
      bookingCount: 15,
      requestCount: 2,
    ),
    const ActivityData(
      id: 2,
      name: 'Marc',
      bookingCount: 4,
      requestCount: 6,
    ),
    const ActivityData(
      id: 3,
      name: 'Abrrl',
      bookingCount: 7,
      requestCount: 1,
    ),
    const ActivityData(
      id: 4,
      name: 'Maig',
      bookingCount: 5,
      requestCount: 10,
    ),
    const ActivityData(
      id: 5,
      name: 'Juny',
      bookingCount: 3,
      requestCount: 12,
    ),
  ];
}