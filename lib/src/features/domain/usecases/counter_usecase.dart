import 'package:dartz/dartz.dart';
import 'package:discover/src/core/usecase/usecase.dart';
import 'package:discover/src/features/domain/entities/counter_entity.dart';
import 'package:discover/src/features/domain/repositories/counter_repository.dart';

import '../../../core/usecase/errors/failure.dart';

class CounterUsecase implements Usecase<CounterEntity, int> {
  final CounterRepository repository;

  CounterUsecase(
    this.repository,
  );

  @override
  Future<Either<Failure, CounterEntity>> call(int count) async {
    return await repository.counterIncrement(count);
  }
}
