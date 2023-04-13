import 'package:clean_arch_web_socket_app/data/data_source/crypto_currency_data_source.dart';
import 'package:clean_arch_web_socket_app/domain/entities/crypto_currency_entity.dart';
import 'package:clean_arch_web_socket_app/domain/repositories/crypto_currency_repository.dart';

class CryptoCurrencyRepositoryImplementation
    implements CryptoCurrencyRepository {
  final CryptoCurrencyDataSource dataSource;

  CryptoCurrencyRepositoryImplementation(this.dataSource);

  @override
  Future<List<CryptoCurrencyEntity>> fetchListCryptoCurrency() async =>
      await dataSource.fetchListCryptoCurrency();
}
