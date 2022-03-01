import 'package:bloc/bloc.dart';
import 'package:dog/dog.dart';
import 'package:tinder_cat_dog_app/constants.dart';
import 'package:tinder_cat_dog_app/features/animals/data/repositories/vote_repository_impl.dart';
import 'package:tinder_cat_dog_app/features/animals/domain/entities/animal.dart';
import 'package:tinder_cat_dog_app/features/animals/domain/usecases/do_vote.dart';

class VoteCubit extends Cubit<bool> {
  late final DoVote doVote;

  VoteCubit() : super(false) {
    doVote = DoVote(VoteRepositoryImpl());
  }

  Future<void> hasLiked(Animal animal) async {
    await doVote.hasLiked(animal).then(emit).catchError(_handleError);
  }

  Future<void> like(Animal animal) async {
    return doVote.like(animal).catchError(_handleError);
  }

  Future<void> dislike(Animal animal) async {
    return doVote.dislike(animal).catchError(_handleError);
  }

  void _handleError(error) {
    dog.e(errorServerMessage);
  }
}
