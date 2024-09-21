import 'package:equatable/equatable.dart';

class CitiesEntity extends Equatable {
  final int id;
  final String title;

  const CitiesEntity({required this.id, required this.title});

  @override
  List<Object> get props => [id, title];
}
