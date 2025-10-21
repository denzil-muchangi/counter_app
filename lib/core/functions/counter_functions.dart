/// Counter state class to encapsulate counter value and operations
class CounterState {
  int _value;

  CounterState([this._value = 0]);

  /// Get the current counter value
  int get value => _value;

  /// Increment the counter by a custom value
  void incrementBy(int value) {
    _value += value;
  }

  /// Decrement the counter by a custom value (allows negative numbers)
  void decrementBy(int value) {
    _value -= value;
  }

  /// Increment the counter by 1 (legacy method)
  void increment() {
    incrementBy(1);
  }

  /// Decrement the counter by 1 (legacy method, allows negative numbers)
  void decrement() {
    decrementBy(1);
  }

  /// Reset the counter to 0
  void reset() {
    _value = 0;
  }

  /// Set counter to a specific value
  void setValue(int newValue) {
    _value = newValue;
  }
}

/// Global counter state instance
final counterState = CounterState();