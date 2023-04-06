import 'package:clean_arch_web_socket_app/data/data_source/crypto_currency_data_source.dart';
import 'package:clean_arch_web_socket_app/data/models/crypto_currency_model.dart';
import 'package:clean_arch_web_socket_app/data/repositories/crypto_currency_repository_implementation.dart';
import 'package:clean_arch_web_socket_app/domain/entities/crypto_currency_entity.dart';
import 'package:clean_arch_web_socket_app/domain/repositories/crypto_currency_repository.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCryptoCurrencyDataSource extends Mock
    implements CryptoCurrencyDataSource {}

void main() {
  late CryptoCurrencyDataSource dataSource;
  late CryptoCurrencyRepository repository;
  late List<CryptoCurrencyModel> cryptoCurrencyList;

  List<CryptoCurrencyModel> mockValidData() => [
        CryptoCurrencyModel(
          id: faker.randomGenerator.integer(10),
          name: faker.person.name(),
          sortIndex: faker.randomGenerator.integer(10),
          lastTrade: faker.randomGenerator.integer(10),
          volume: faker.randomGenerator.decimal(),
          change: faker.randomGenerator.decimal(),
        ),
        CryptoCurrencyModel(
          id: faker.randomGenerator.integer(10),
          name: faker.person.name(),
          imagePath: faker.internet.httpUrl(),
          sortIndex: faker.randomGenerator.integer(10),
          lastTrade: faker.randomGenerator.integer(10),
          volume: faker.randomGenerator.decimal(),
          change: faker.randomGenerator.decimal(),
        ),
      ];

  When mockCryptoCurrencyDataSourceCall() =>
      when(() => dataSource.fetchListCryptoCurrency());

  void mockCryptoCurrencyDataSource() => mockCryptoCurrencyDataSourceCall()
      .thenAnswer((_) async => cryptoCurrencyList);

  void mockCryptoCurrencyDataSourceError() =>
      mockCryptoCurrencyDataSourceCall().thenThrow(Exception());

  setUp(() {
    dataSource = MockCryptoCurrencyDataSource();
    repository = CryptoCurrencyRepositoryImplementation(dataSource);
    cryptoCurrencyList = mockValidData();
    mockCryptoCurrencyDataSource();
  });

  test('should return a crypto currency list', () async {
    final result = await repository.fetchListCryptoCurrency();

    expect(result, cryptoCurrencyList);

    verify(() => dataSource.fetchListCryptoCurrency()).called(1);
  });

  test('should throw a error when the method return a exception', () async {
    mockCryptoCurrencyDataSourceError();

    final future = repository.fetchListCryptoCurrency();

    expect(future, throwsA(const TypeMatcher<Exception>()));
  });
}
