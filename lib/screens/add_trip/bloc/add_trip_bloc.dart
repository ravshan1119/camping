import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_trip_event.dart';
part 'add_trip_state.dart';

class AddTripBloc extends Bloc<AddTripEvent, AddTripState> {
  AddTripBloc() : super(const AddTripState()) {
    on<ChangeTripNameEvent>(_changeTripName);
  }

  void _changeTripName(ChangeTripNameEvent event, Emitter<AddTripState> emit) {
    emit(state.copyWith(tripName: event.tripName));
  }
}
