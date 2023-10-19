import 'dart:isolate';

class TestIsolateHelper {
  TestIsolateHelper._();

  static Isolate? _isolate;

  static bool get isActive => _isolate != null;

  static toggle() async {
    if (isActive) {
      _close();
    } else {
      await _start();
    }
  }

  static Future<void> _start() async {
    if (_isolate != null) {
      return;
    }
    _isolate = await Isolate.spawn(
      (msg) async {
        while (true) {
          await Future.delayed(const Duration(seconds: 1));
          print('isolateMsg');
        }
      },
      'hello',
      debugName: 'simpleIsolate',
    );
    print('initIsolateSuccess ${_isolate.hashCode}');
  }

  static void _close() {
    print('close');
    _isolate?.kill();
    _isolate = null;
  }
}
