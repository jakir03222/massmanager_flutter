import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/counter_controller.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CounterController(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Mass Manager'),
        ),
        body: Consumer<CounterController>(
          builder: (context, controller, child) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (controller.errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.red.shade100,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          controller.errorMessage!,
                          style: TextStyle(color: Colors.red.shade900),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  const Text(
                    'You have pushed the button this many times:',
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 20),
                  if (controller.isLoading)
                    const CircularProgressIndicator()
                  else
                    Text(
                      '${controller.counter}',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        onPressed: controller.isLoading
                            ? null
                            : () => controller.decrementCounter(),
                        heroTag: 'decrement',
                        child: const Icon(Icons.remove),
                      ),
                      const SizedBox(width: 20),
                      FloatingActionButton(
                        onPressed: controller.isLoading
                            ? null
                            : () => controller.resetCounter(),
                        heroTag: 'reset',
                        backgroundColor: Colors.orange,
                        child: const Icon(Icons.refresh),
                      ),
                      const SizedBox(width: 20),
                      FloatingActionButton(
                        onPressed: controller.isLoading
                            ? null
                            : () => controller.incrementCounter(),
                        heroTag: 'increment',
                        child: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
