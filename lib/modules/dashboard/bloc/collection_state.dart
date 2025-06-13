import 'package:equatable/equatable.dart';
import 'package:test_task/models/collection_model.dart';

class CollectionState extends Equatable {
  final List<CollectionModel> collection;
  final bool isLoading;
  final String? errorMessage;
  final bool networkEnabled;
  const CollectionState({
    this.collection = const [],
    this.isLoading = false,
    this.errorMessage,
    this.networkEnabled = true,
  });

  CollectionState copyWith({
    List<CollectionModel>? collection,
    bool? isLoading,
    String? errorMessage,
    bool? networkEnabled,
  }) {
    return CollectionState(
      collection: collection ?? this.collection,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      networkEnabled: networkEnabled ?? this.networkEnabled,
    );
  }

  @override
  List<Object?> get props => [collection, isLoading, errorMessage, networkEnabled];
}