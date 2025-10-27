import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/counter_model.dart';

class CounterController extends ChangeNotifier {
  int _counter = 0;
  bool _isLoading = false;
  String? _errorMessage;

  int get counter => _counter;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String _collection = 'counters';

  CounterController() {
    _loadCounter();
  }

  // Load counter from Firestore
  Future<void> _loadCounter() async {
    try {
      _isLoading = true;
      notifyListeners();

      final snapshot = await _firestore
          .collection(_collection)
          .limit(1)
          .orderBy('timestamp', descending: true)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final counterData = CounterModel.fromFirestore(snapshot.docs.first);
        _counter = counterData.count;
      }
      
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Error loading counter: $e';
      debugPrint(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Increment counter
  Future<void> incrementCounter() async {
    try {
      _isLoading = true;
      notifyListeners();

      _counter++;

      // Save to Firestore
      final counterModel = CounterModel(
        count: _counter,
        timestamp: DateTime.now(),
      );

      await _firestore.collection(_collection).add(
        counterModel.toFirestore(),
      );

      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Error incrementing counter: $e';
      debugPrint(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Decrement counter
  Future<void> decrementCounter() async {
    try {
      _isLoading = true;
      notifyListeners();

      if (_counter > 0) {
        _counter--;
      }

      // Save to Firestore
      final counterModel = CounterModel(
        count: _counter,
        timestamp: DateTime.now(),
      );

      await _firestore.collection(_collection).add(
        counterModel.toFirestore(),
      );

      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Error decrementing counter: $e';
      debugPrint(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  // Reset counter
  Future<void> resetCounter() async {
    try {
      _isLoading = true;
      notifyListeners();

      _counter = 0;

      // Save to Firestore
      final counterModel = CounterModel(
        count: _counter,
        timestamp: DateTime.now(),
      );

      await _firestore.collection(_collection).add(
        counterModel.toFirestore(),
      );

      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Error resetting counter: $e';
      debugPrint(_errorMessage);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }
}
