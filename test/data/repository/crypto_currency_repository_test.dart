import 'package:clean_arch_web_socket_app/domain/repositories/crypto_currency_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CryptoCurrencyDataSource dataSource;
  late CryptoCurrencyRepository repository;

  setUp(() {
    dataSource = MockCryptoCurrencyDataSource();
    repository = CryptoCurrencyRepositoryImplementation(dataSource);
  });

  test('should ', () async {

    final result = await ;

    expect(result, );
  });
}