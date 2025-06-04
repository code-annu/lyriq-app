part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

sealed class AuthenticationActionState extends AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class GoogleAuthenticatingState extends AuthenticationState {}

final class GoogleAuthSuccessState extends AuthenticationActionState {}

final class GoogleAuthFailedState extends AuthenticationActionState {}

final class AuthCompletionState extends AuthenticationState {}
