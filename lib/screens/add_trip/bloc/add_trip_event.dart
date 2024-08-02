part of 'add_trip_bloc.dart';

sealed class AddTripEvent extends Equatable {
  const AddTripEvent();
}

class ChangeTripNameEvent extends AddTripEvent {
  const ChangeTripNameEvent({required this.tripName});

  final String tripName;

  @override
  List<Object?> get props => [tripName];
}
