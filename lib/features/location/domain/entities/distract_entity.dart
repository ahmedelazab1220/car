import 'package:equatable/equatable.dart';

class DistractEntity extends Equatable {
  final int id;
  final String title;

  const DistractEntity({required this.id, required this.title});

  @override
  List<Object> get props => [id, title];
}
