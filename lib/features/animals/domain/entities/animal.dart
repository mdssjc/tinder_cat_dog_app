import 'package:equatable/equatable.dart';

class Animal extends Equatable {
  final String id;
  final String name;
  final String path;

  const Animal({
    required this.id,
    required this.name,
    required this.path,
  });

  @override
  List<Object> get props => [id, name, path];
}
