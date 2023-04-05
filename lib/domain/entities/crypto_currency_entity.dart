import 'package:equatable/equatable.dart';

class CryptoCurrencyEntity extends Equatable {
  final int id;
  final String? imagePath;
  final String name;
  final int sortIndex;
  final int lastTrade;
  final double volume;
  final double change;

  const CryptoCurrencyEntity({
    required this.id,
    this.imagePath,
    required this.name,
    required this.sortIndex,
    required this.lastTrade,
    required this.volume,
    required this.change,
  });

  @override
  List<Object?> get props => [
        id,
        imagePath,
        name,
        sortIndex,
        lastTrade,
        volume,
        change,
      ];
}
