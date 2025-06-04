part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class ContinueWithGoogleButtonClickEvent extends AuthenticationEvent {}
