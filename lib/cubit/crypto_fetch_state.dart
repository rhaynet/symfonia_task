
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:symfonia_test/data/models/crypto.dart';
import 'package:symfonia_test/data/models/failure.dart';

// part 'crypto_fetch_state.dart';

abstract class CryptoFetchState extends Equatable{
  const CryptoFetchState();
  @override
  List<Object> get props => [];
}

class CryptoFetchInitial extends CryptoFetchState{}

class CryptoFetchLoading extends CryptoFetchState{}

class CryptoFetchLoaded extends CryptoFetchState{
  final List<Crypto> cryptoList;
  const CryptoFetchLoaded({required this.cryptoList});

  @override
  List<Object> get props => [cryptoList];
}

class CryptoFetchError extends CryptoFetchState{
  final Failure failure;
  const CryptoFetchError({required this.failure});

  @override
  List<Object> get props => [failure];

}