import 'package:clean_arch_web_socket_app/domain/entities/crypto_currency_entity.dart';

abstract class CryptoCurrencyRepository {
  Future<List<CryptoCurrencyEntity>> fetchListCryptoCurrency();
}
