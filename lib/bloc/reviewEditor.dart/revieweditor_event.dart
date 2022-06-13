part of 'revieweditor_bloc.dart';

abstract class RevieweditorEvent extends Equatable {
  const RevieweditorEvent();

  @override
  List<Object> get props => [];
}

class RevieweditorVisibilitySwitchedEvent extends RevieweditorEvent {}
