part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}
class RegisterLoading extends RegisterState {}
class RegisterSuccess extends RegisterState {}
class RegisterFailed extends RegisterState {
  String errMassege;
  RegisterFailed({required this.errMassege});
}
