import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static Env? _instance;

  Env._();

  static Env get instance => _instance ??= Env._();

  Future<void> load() => dotenv.load();

  String get(String key) {
    String? value;

    value = dotenv.maybeGet(key);
    if (value == null) {
      value = dotenv.maybeGet(key);
      if (value == null) {
        throw Exception('Env $key not found');
      } else {
        return value;
      }
    } else {
      return value;
    }
  }
}
