import 'package:cloud_firestore/cloud_firestore.dart';

class CounterModel {
  final String? id;
  final int count;
  final DateTime timestamp;

  CounterModel({
    this.id,
    required this.count,
    required this.timestamp,
  });

  // Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Convert JSON to Model
  factory CounterModel.fromJson(Map<String, dynamic> json, String id) {
    return CounterModel(
      id: id,
      count: json['count'] ?? 0,
      timestamp: DateTime.parse(json['timestamp']),
    );
  }

  // Convert Firestore Document to Model
  factory CounterModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CounterModel(
      id: doc.id,
      count: data['count'] ?? 0,
      timestamp: DateTime.parse(data['timestamp']),
    );
  }

  // Convert Model to Firestore Document
  Map<String, dynamic> toFirestore() {
    return {
      'count': count,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  // Create a copy with updated values
  CounterModel copyWith({
    String? id,
    int? count,
    DateTime? timestamp,
  }) {
    return CounterModel(
      id: id ?? this.id,
      count: count ?? this.count,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
