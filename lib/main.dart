import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_cat_dog_app/features/animals/presentation/animals.dart';
import 'package:tinder_cat_dog_app/features/animals/presentation/bloc/cubit/animal_cubit.dart';
import 'package:tinder_cat_dog_app/features/settings/settings.dart';

import 'core/presentation/bloc/cubit/settings_cubit.dart';
import 'features/animals/presentation/bloc/cubit/vote_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SettingsCubit()),
        BlocProvider(create: (context) => AnimalCubit()),
        BlocProvider(create: (context) => VoteCubit()),
      ],
      child: MaterialApp(
        initialRoute: '/',
        routes: {
          AnimalsPage.routeName: (context) => const AnimalsPage(),
          SettingsPage.routeName: (context) => const SettingsPage()
        },
      ),
    );
  }
}
