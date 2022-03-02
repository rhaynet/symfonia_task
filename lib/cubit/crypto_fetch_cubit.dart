import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';
import 'package:symfonia_test/data/models/crypto.dart';
import 'package:symfonia_test/data/models/failure.dart';
import 'package:symfonia_test/data/repositories/api_repository.dart';
import 'package:symfonia_test/cubit/crypto_fetch_state.dart';

class CryptoFetchCubit extends Cubit<CryptoFetchState>{

  final ApiRepository apiRepository;

  CryptoFetchCubit({required this.apiRepository}) : super(CryptoFetchInitial());


  Future<void> fetchCryptoApi() async {
    emit(CryptoFetchLoading());
    try{
      final List<Crypto>? cryptoList = await apiRepository.getCryptoList();
      emit(CryptoFetchLoaded(cryptoList: cryptoList ?? []));
    }on Failure catch(err){
      emit(CryptoFetchError(failure: err));
    }
    catch(err){
      print('Error: $err');
    }
  }
}