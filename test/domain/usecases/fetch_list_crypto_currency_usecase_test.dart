import 'package:clean_arch_web_socket_app/domain/entities/crypto_currency_entity.dart';
import 'package:clean_arch_web_socket_app/domain/repositories/crypto_currency_repository.dart';
import 'package:clean_arch_web_socket_app/domain/usecases/fetch_list_crypto_currency_usecase.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCryptoCureencyRepository extends Mock
    implements CryptoCurrencyRepository {}

void main() {
  late CryptoCurrencyRepository repository;
  late FetchListCryptoCurrencyUseCase useCase;
  late List<CryptoCurrencyEntity> cryptoList;

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
          imagePath: faker.internet.httpUrl(),
          sortIndex: faker.randomGenerator.integer(10),
          lastTrade: faker.randomGenerator.integer(10),
          volume: faker.randomGenerator.decimal(),
          change: faker.randomGenerator.decimal(),
        ),
      ];

  When mockFetchListCryptoCurrencyCall() =>
      when(() => repository.fetchListCryptoCurrency());

  void mockFetchListCryptoCurrency() =>
      mockFetchListCryptoCurrencyCall().thenAnswer((_) async => cryptoList);

  setUp(() {
    repository = MockCryptoCureencyRepository();
    useCase = FetchListCryptoCurrencyUseCase(repository);
    cryptoList = mockValidData();
    mockFetchListCryptoCurrency();
  });

  test('should return a list of crypto currency entities', () async {
    final result = await useCase();

    expect(result, cryptoList);

    verify(() => repository.fetchListCryptoCurrency()).called(1);
  });
}
