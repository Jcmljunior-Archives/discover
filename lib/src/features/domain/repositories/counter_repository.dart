import 'package:dartz/dartz.dart';
import 'package:discover/src/features/domain/entities/counter_entity.dart';

import '../../../core/usecase/errors/failure.dart';

abstract class CounterRepository {
  Future<Either<Failure, CounterEntity>> counterIncrement(int count);
}
