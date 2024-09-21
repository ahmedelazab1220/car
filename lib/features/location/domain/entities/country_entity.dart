import 'package:equatable/equatable.dart';

class CountryEntity extends Equatable {
  final int id;
  final String title;

  const CountryEntity({required this.id, required this.title});

  @override
  List<Object> get props => [id, title];
}
