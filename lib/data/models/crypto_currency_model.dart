import 'package:clean_arch_web_socket_app/domain/entities/crypto_currency_entity.dart';

class CryptoCurrencyModel extends CryptoCurrencyEntity {
  const CryptoCurrencyModel({
    required super.id,
    required super.name,
    super.imagePath,
    required super.sortIndex,
    required super.lastTrade,
    required super.volume,
    required super.change,
  });
}
