part of 'notifications_bloc.dart';

class NotificationsState extends Equatable {
  const NotificationsState({
    this.isLoading = false,
    this.error,
    this.notifications,
  });

  final bool isLoading;
  final String? error;
  final List<NotificationsModel>? notifications;

  NotificationsState copyWith({
    bool? isLoading,
    String? error,
    List<NotificationsModel>? notifications,
  }) {
    return NotificationsState(
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        error,
        notifications,
      ];
}
