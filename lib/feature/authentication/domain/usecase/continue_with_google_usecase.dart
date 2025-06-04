import 'package:firebase_auth/firebase_auth.dart';
import 'package:lyriq/feature/authentication/data/repository_impl/auth_repository_impl.dart';

class ContinueWithGoogleUsecase {
  final _authRepository = AuthRepositoryImpl();

  Future<User> execute() async {
    return await _authRepository.signInWithGoogle();
  }
}
