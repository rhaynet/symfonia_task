class Crypto {
  final String name;
  final String symbol;
  final String image;
  final double currentPrice;
  final double marketCapChangePercentage24h;
  final String lastUpdated;

  Crypto({
    required this.name,
    required this.symbol,
    required this.image,
    required this.currentPrice,
    required this.marketCapChangePercentage24h,
    required this.lastUpdated,
  });

  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      name: json['name'],
      symbol: json['symbol'],
      image: json['image'],
      currentPrice: json['current_price'].toDouble(),
      marketCapChangePercentage24h: json['market_cap_change_percentage_24h'].toDouble(),
      lastUpdated: json['last_updated'],
    );
  }
}
