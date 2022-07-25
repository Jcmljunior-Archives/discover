import 'package:dartz/dartz.dart';
import 'package:discover/src/core/usecase/errors/failure.dart';
import 'package:discover/src/features/domain/entities/counter_entity.dart';
import 'package:discover/src/features/domain/repositories/counter_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:discover/src/features/domain/usecases/counter_usecase.dart';
import 'package:mocktail/mocktail.dart';

class MockCounterRepository extends Mock implements CounterRepository {}

void main() {
  late CounterUsecase usecase;
  late CounterRepository repository;

  setUp(() {
    repository = MockCounterRepository();
    usecase = CounterUsecase(repository);
  });

  const tNumber = 5;
  const tCounter = CounterEntity(
    id: 1,
    counter: 10,
  );

  test(
    'Deve obter sucesso ao receber uma entidade de contador a partir de um valor númerico.',
    () async {
      when(() => repository.counterIncrement(tNumber)).thenAnswer(
          (_) async => const Right<Failure, CounterEntity>(tCounter));

      final result = await usecase(tNumber);
      expect(result, const Right(tCounter));

      verify(() => repository.counterIncrement(tNumber)).called(1);
    },
  );

  test(
    'Deve obter falha ao não receber uma entidade de contador a partir de um valor númerico.',
    () async {
      when(() => repository.counterIncrement(tNumber)).thenAnswer(
          (_) async => Left<Failure, CounterEntity>(ServerFailure()));

      final result = await usecase(tNumber);
      expect(result, Left(ServerFailure()));

      verify(() => repository.counterIncrement(tNumber)).called(1);
    },
  );
}
