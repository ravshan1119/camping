import 'package:bloc/bloc.dart';
import 'package:camping/data/models/notifications_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  NotificationsBloc() : super(const NotificationsState()) {
    on<GetNotificationsEvent>(_getNotifications);
  }
  Stream collectionStream =
      FirebaseFirestore.instance.collection('notifications').snapshots();

  _getNotifications(
      GetNotificationsEvent event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(isLoading: true));
    List<NotificationsModel> notifications = [];
    collectionStream.listen((event) {
      for (var element in event.docs) {
        notifications.add(NotificationsModel.fromJson(element.data()));
      }
    });
    emit(state.copyWith(isLoading: false, notifications: notifications));
  }
}
