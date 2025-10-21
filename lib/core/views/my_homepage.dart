import 'package:flutter/material.dart';
import 'package:counter_app/core/custom_button.dart';
import 'package:counter_app/core/functions/counter_functions.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _incrementController = TextEditingController(text: '1');
  final TextEditingController _decrementController = TextEditingController(text: '1');

  @override
  void dispose() {
    _incrementController.dispose();
    _decrementController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      final int value = int.tryParse(_incrementController.text) ?? 1;
      counterState.incrementBy(value);
    });
  }

  void _decrementCounter() {
    setState(() {
      final int value = int.tryParse(_decrementController.text) ?? 1;
      counterState.decrementBy(value);
    });
  }

  void _resetCounter() {
    setState(() {
      counterState.reset();
      _incrementController.text = '1';
      _decrementController.text = '1';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
          const Text('You have pushed the button this many times:'),
          Text(
            '${counterState.value}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 24), // Spacing between counter and input fields

          // Input fields for custom increment/decrement values
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: <Widget>[
                // Decrement value input
                Expanded(
                  child: TextField(
                    controller: _decrementController,
                    decoration: InputDecoration(
                      labelText: 'Decrement by',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(width: 16), // Spacing between inputs

                // Increment value input
                Expanded(
                  child: TextField(
                    controller: _incrementController,
                    decoration: InputDecoration(
                      labelText: 'Increment by',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32), // Add some spacing between inputs and buttons
          // First row: Decrement and Increment buttons side by side
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomButton(
                  onPressed: _decrementCounter,
                  icon: Icons.remove,
                  label: 'Decrement',
                  buttonType: ButtonType.decrement,
                ),
                const SizedBox(width: 16), // Add spacing between buttons
                CustomButton(
                  onPressed: _incrementCounter,
                  icon: Icons.add,
                  label: 'Increment',
                  buttonType: ButtonType.increment,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20), // Add spacing between rows
          // Second row: Reset button centered below
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CustomButton(
                  onPressed: _resetCounter,
                  icon: Icons.refresh,
                  label: 'Reset',
                  buttonType: ButtonType.reset,
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
