import 'package:cloud_firestore/cloud_firestore.dart' as firestore;
import 'package:freezed_annotation/freezed_annotation.dart';

class TimestampConverter
    implements JsonConverter<DateTime, firestore.Timestamp?> {
  const TimestampConverter();

  @override
  DateTime fromJson(firestore.Timestamp? json) {
    //* workaround for firestore returning timestamp as null initially
    if (json == null) return DateTime.timestamp();

    return json.toDate();
  }

  @override
  firestore.Timestamp toJson(DateTime data) {
    return firestore.Timestamp.fromDate(data);
  }
}
