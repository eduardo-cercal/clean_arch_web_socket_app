import 'package:clean_arch_web_socket_app/data/models/crypto_currency_model.dart';

abstract class CryptoCurrencyDataSource {
  Stream<List<CryptoCurrencyModel>> fetchListCryptoCurrency();
}
