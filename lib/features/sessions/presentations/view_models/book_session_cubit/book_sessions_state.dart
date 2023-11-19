part of 'book_sessions_cubit.dart';

@immutable
abstract class BookSessionsState {}

class BookSessionsInitial extends BookSessionsState {}
class UserBookSessionsLoadingState extends BookSessionsState {}
class UserBookSessionsSuccessState extends BookSessionsState {
  BookModel model;
  UserBookSessionsSuccessState(this.model);
}
class UserBookSessionsErrorState extends BookSessionsState {
  final String errMessage;
  UserBookSessionsErrorState(this.errMessage);
}
