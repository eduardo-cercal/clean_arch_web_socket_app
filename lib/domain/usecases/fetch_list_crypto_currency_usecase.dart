import 'package:clean_arch_web_socket_app/domain/entities/crypto_currency_entity.dart';
import 'package:clean_arch_web_socket_app/domain/repositories/crypto_currency_repository.dart';

class FetchListCryptoCurrencyUseCase {
  final CryptoCurrencyRepository repository;

  FetchListCryptoCurrencyUseCase(this.repository);

  Future<List<CryptoCurrencyEntity>> call() async =>
      repository.fetchListCryptoCurrency();
}
