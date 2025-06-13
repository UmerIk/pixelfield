import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:test_task/modules/dashboard/bloc/collection_bloc.dart';
import 'package:test_task/modules/dashboard/bloc/collection_state.dart';


void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const mockJson = '''
  [
    {
      "name":"Amstel",
      "year": 2017,
      "code": 107981,
      "bottlenumber": 41,
      "totalbottles": 435,
      "distillory": "Macallan",
      "region": "Highlands",
      "country": "Ireland",
      "type": "Rye",
      "age statement": "5 years",
      "filled": "2017",
      "bottled": "2022",
      "casknumber": "CASK-39771",
      "abv": "55%",
      "size": "1L",
      "finish": "Sherry Cask",
      "testingnotes": [
        { "title": "Palate", "description": "Sweet and mellow" },
        { "title": "Finish", "description": "Peaty and intense" }
      ],
      "history": [
        { "title": "Back Label", "description": "Classic distillery design" },
        { "title": "Vintage Label", "description": "Classic distillery design" }
      ]
    }
  ]
  ''';

  setUp(() {
    ServicesBinding.instance.defaultBinaryMessenger.setMockMessageHandler(
      'flutter/assets',
          (ByteData? message) async {
        final String assetKey = utf8.decode(message!.buffer.asUint8List());
        if (assetKey == 'assets/json/whiskey_data.json') {
          final Uint8List encoded = Uint8List.fromList(utf8.encode(mockJson));
          return ByteData.view(encoded.buffer);
        }
        return null;
      },
    );
  });

  blocTest<CollectionBloc, CollectionState>(
    'emits loading then loaded state with parsed collection',
    build: () => CollectionBloc(),
    act: (bloc) => bloc.loadCollection(), // manually trigger the event
    wait: const Duration(milliseconds: 100),
    expect: () => [
      const CollectionState(isLoading: true, errorMessage: null),
      isA<CollectionState>()
          .having((s) => s.isLoading, 'isLoading', false)
          .having((s) => s.collection.length, 'collection length', 1)
          .having((s) => s.collection.first.name, 'name', 'Amstel'),
    ],
  );

}

