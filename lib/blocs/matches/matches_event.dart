// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'matches_bloc.dart';

abstract class MatchesEvent extends Equatable {
  const MatchesEvent();
}

class FetchMatchesEvent extends MatchesEvent {
  final DateTime date;

  const FetchMatchesEvent(this.date);

  @override
  List<Object?> get props => [date];
}
