import 'dart:async';

import 'package:clean_arch_web_socket_app/domain/entities/crypto_currency_entity.dart';
import 'package:clean_arch_web_socket_app/domain/repositories/crypto_currency_repository.dart';

class FetchListCryptoCurrencyUseCase {
  final CryptoCurrencyRepository repository;

  FetchListCryptoCurrencyUseCase(this.repository);

  Future<Stream<List<CryptoCurrencyEntity>>> call() async {
    final StreamController<List<CryptoCurrencyEntity>> controller =
        StreamController<List<CryptoCurrencyEntity>>();
    try {
      final List<CryptoCurrencyEntity> _ =
          await repository.fetchListCryptoCurrency();
      controller.close();
    } catch (e) {
      controller.addError(e);
    }

    return controller.stream;
  }
}
