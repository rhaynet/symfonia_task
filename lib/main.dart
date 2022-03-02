import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symfonia_test/cubit/crypto_fetch_cubit.dart';
import 'package:symfonia_test/data/repositories/api_repository.dart';
import 'package:symfonia_test/data/services/api_service.dart';
import 'package:symfonia_test/presentation/screens/home_screen.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  MyApp({Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CryptoFetchCubit>(
          create: (context) => CryptoFetchCubit(
            apiRepository: ApiRepository(apiService: apiService),
          )..fetchCryptoApi(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Symfonia test',
        home: HomeScreen(),
      ),
    );
  }
}
