import 'package:clean_arch_web_socket_app/domain/entities/crypto_currency_entity.dart';
import 'package:clean_arch_web_socket_app/domain/repositories/crypto_currency_repository.dart';
import 'package:clean_arch_web_socket_app/domain/usecases/fetch_list_crypto_currency_usecase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCryptoCurrencyRepository extends Mock
    implements CryptoCurrencyRepository {}

void main() {
  late CryptoCurrencyRepository repository;
  late FetchListCryptoCurrencyUseCase useCase;
  late List<CryptoCurrencyEntity> validData;

  List<CryptoCurrencyEntity> mockValidData() => [
        CryptoCurrencyEntity(
          id: faker.randomGenerator.integer(10),
          name: faker.person.name(),
          sortIndex: faker.randomGenerator.integer(10),
          lastTrade: faker.randomGenerator.integer(10),
          volume: faker.randomGenerator.decimal(),
          change: faker.randomGenerator.decimal(),
        ),
        CryptoCurrencyEntity(
          id: faker.randomGenerator.integer(10),
          name: faker.person.name(),
          sortIndex: faker.randomGenerator.integer(10),
          lastTrade: faker.randomGenerator.integer(10),
          volume: faker.randomGenerator.decimal(),
          change: faker.randomGenerator.decimal(),
          imagePath: faker.internet.httpUrl(),
        ),
      ];

  When mockCryptoCurrencyRepositoryCall() =>
      when(() => repository.fetchListCryptoCurrency());

  void mockCryptoCurrencyRepository() =>
      mockCryptoCurrencyRepositoryCall().thenAnswer((_) async => validData);

  setUp(() {
    repository = MockCryptoCurrencyRepository();
    useCase = FetchListCryptoCurrencyUseCase(repository);
    validData = mockValidData();
    mockCryptoCurrencyRepository();
  });

  test('should validate currect execution', () async {
    final stream = await useCase();

    stream.listen((list) {
      expect(list, validData);
    });

    verify(() => repository.fetchListCryptoCurrency()).called(1);
  });
}
