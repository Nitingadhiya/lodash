import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_pl/test_pl.dart';

void main() {
  const MethodChannel channel = MethodChannel('test_pl');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await TestPl.platformVersion, '42');
  });
}
