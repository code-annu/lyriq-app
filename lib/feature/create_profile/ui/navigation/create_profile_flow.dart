import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lyriq/feature/create_profile/bloc/create_profile_bloc.dart';
import 'package:lyriq/feature/create_profile/ui/screen/choose_artist_screen.dart';

class CreateProfileFlow extends StatelessWidget {
  const CreateProfileFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateProfileBloc(),
      child: ChooseArtistScreen(),
    );
  }
}
