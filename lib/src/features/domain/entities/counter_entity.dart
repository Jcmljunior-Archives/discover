import 'package:equatable/equatable.dart';

class CounterEntity extends Equatable {
  final int id;
  final int counter;

  const CounterEntity({
    required this.id,
    required this.counter,
  });

  @override
  List<Object?> get props => [
        id,
        counter,
      ];
}
