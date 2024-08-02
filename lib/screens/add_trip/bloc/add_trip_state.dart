part of 'add_trip_bloc.dart';

class AddTripState extends Equatable {
  const AddTripState({
    this.tripName,
    this.isLoading = false,
    this.error,
  });

  final String? tripName;
  final String? error;
  final bool isLoading;

  AddTripState copyWith({
    String? tripName,
    String? error,
    bool? isLoading,
  }) {
    return AddTripState(
      tripName: tripName ?? this.tripName,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [tripName, error, isLoading];
}
