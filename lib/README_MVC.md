# MVC Pattern Structure

This Flutter app follows the MVC (Model-View-Controller) architectural pattern with Firebase integration.

## 📁 Folder Structure

```
lib/
├── models/           # Data Models
│   └── counter_model.dart
├── views/            # UI Components (Screens)
│   └── home_view.dart
├── controllers/      # Business Logic & State Management
│   └── counter_controller.dart
├── firebase_options.dart
└── main.dart
```

## 🏗️ Architecture Overview

### **Models** (`lib/models/`)
- Define data structures
- Handle data conversion (Firestore, JSON)
- Example: `CounterModel` - Represents counter data

### **Views** (`lib/views/`)
- UI components and screens
- Display data from controllers
- Handle user interactions
- Example: `HomeView` - Main screen

### **Controllers** (`lib/controllers/`)
- Business logic
- State management
- Data operations (Firestore CRUD)
- Example: `CounterController` - Manages counter logic

### **Main** (`lib/main.dart`)
- App initialization
- Firebase setup
- Root widget configuration

## 🔥 Firebase Integration

- **Firestore**: Database for storing counter data
- **Collection**: `counters` - Stores counter history
- Each increment/decrement/reset creates a new document

## 📦 Dependencies

- `firebase_core`: Firebase initialization
- `cloud_firestore`: Firestore database
- `firebase_auth`: Authentication (ready for use)
- `firebase_storage`: File storage (ready for use)
- `provider`: State management

## 🚀 Features

1. **MVC Pattern**: Clean separation of concerns
2. **Firebase Integration**: Cloud database for data persistence
3. **State Management**: Provider pattern for reactive UI
4. **Error Handling**: User-friendly error messages
5. **Loading States**: Visual feedback during operations

## 📝 Adding New Features

### To add a new model:
1. Create file in `lib/models/your_model.dart`
2. Define data structure and conversion methods

### To add a new view:
1. Create file in `lib/views/your_view.dart`
2. Use Consumer<YourController> for state management

### To add a new controller:
1. Create file in `lib/controllers/your_controller.dart`
2. Extend ChangeNotifier for state management
3. Add Firestore operations as needed

## 🔗 Usage Example

```dart
// In a View
Consumer<CounterController>(
  builder: (context, controller, child) {
    return Text('Count: ${controller.counter}');
  },
)
```
