import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_profile_event.dart';
part 'create_profile_state.dart';

class CreateProfileBloc extends Bloc<CreateProfileEvent, CreateProfileState> {
  CreateProfileBloc() : super(CreateProfileInitial()) {
    on<CreateProfileEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
