import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_cat_dog_app/core/presentation/bloc/cubit/settings_cubit.dart';
import 'package:tinder_cat_dog_app/features/animals/presentation/bloc/cubit/animal_cubit.dart';

class SettingsPage extends StatelessWidget {
  static const routeName = '/settings';

  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {
        if (state is SettingsManageFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is SettingsInitial) {
          Future.microtask(() => context.read<SettingsCubit>().init());
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
            actions: [
              IconButton(
                onPressed: () {
                  if (state is SettingsManageSuccess) {
                    context.read<SettingsCubit>().save(state.value);
                    BlocProvider.of<AnimalCubit>(context).init();
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.save),
              ),
            ],
          ),
          body: state is SettingsManageSuccess
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Cats'),
                    Switch(
                      value: state.value,
                      onChanged: (value) =>
                          context.read<SettingsCubit>().choose(value),
                    ),
                    const Text('Dogs'),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
