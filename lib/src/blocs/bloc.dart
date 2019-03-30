import 'dart:async';
import './validators.dart';
import 'package:rxdart/rxdart.dart';
class Bloc with Validators{
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  Function(String) get updateEmail => _emailController.sink.add;
  Function(String) get updatePassword => _passwordController.sink.add;

  Stream<String> get email => _emailController.stream.transform(validateEmail);
  Stream<String> get password => _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Observable.combineLatest2(email, password, (email, password) {
    return true;
  });

  submit() {
    final validEmail = _emailController.value;
    final validPassword = _passwordController.value;
    print('Logging in with email: $validEmail and password: $validPassword');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}