import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:symfonia_test/constants.dart';
import 'package:symfonia_test/cubit/crypto_fetch_cubit.dart';
import 'package:symfonia_test/cubit/crypto_fetch_state.dart';
import 'package:symfonia_test/presentation/widgets/crypto_tile.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        elevation: 0.0,
        title: const Text(
          'History',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: const [
                  Icon(
                    Icons.sort,
                    color: Colors.black,
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    'Sort/Filter',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: BlocBuilder<CryptoFetchCubit, CryptoFetchState>(
          builder: (context, state) {
            if (state is CryptoFetchLoading) {
              return const CircularProgressIndicator();
            } else if (state is CryptoFetchError) {
              return Center(
                child: Text(state.failure.message),
              );
            } else if (state is CryptoFetchLoaded) {
              final cryptoList = state.cryptoList;
              return cryptoList.isEmpty ? const Center(child: Text('No any posts'),) :
              ListView.builder(
                shrinkWrap: true,
                itemCount: cryptoList.length,
                itemBuilder: (context, index){
                  final crypto = cryptoList[index];
                  return CryptoTile(data: crypto);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
