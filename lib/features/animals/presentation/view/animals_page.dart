import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinder_cat_dog_app/constants.dart';
import 'package:tinder_cat_dog_app/features/animals/domain/entities/animal.dart';
import 'package:tinder_cat_dog_app/features/animals/presentation/animals.dart';
import 'package:tinder_cat_dog_app/features/animals/presentation/bloc/cubit/animal_cubit.dart';
import 'package:tinder_cat_dog_app/features/animals/presentation/bloc/cubit/vote_cubit.dart';
import 'package:tinder_cat_dog_app/features/settings/settings.dart';

class AnimalsPage extends StatelessWidget {
  static const routeName = '/';

  const AnimalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tinder for Cats and Dogs'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SettingsPage.routeName);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocConsumer<AnimalCubit, AnimalState>(
        listener: (context, state) {
          if (state is AnimalLoadInFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AnimalInitial) {
            Future.microtask(() => context.read<AnimalCubit>().refresh());
          } else if (state is AnimalLoadSuccess) {
            List<Animal> animals = state.animals;
            return SwipableListview(
              itemCount: animals.length,
              itemBuilder: (context, index) {
                Future.microtask(
                    () => context.read<VoteCubit>().hasLiked(animals[index]));
                return Stack(
                  children: [
                    Positioned.fill(
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/loading.gif',
                        image: '$apiBaseUrl${animals[index].path}',
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 30,
                      right: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.clear),
                          Text(
                            animals[index].name,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          BlocBuilder<VoteCubit, bool>(
                            builder: (context, state) => state
                                ? const Icon(Icons.favorite, color: Colors.red)
                                : const Icon(Icons.favorite),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              onLikedItem: (index, isLiked) {
                Future.microtask(() => isLiked
                    ? context.read<VoteCubit>().like(animals[index])
                    : context.read<VoteCubit>().dislike(animals[index]));
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
