part of 'staffpanel_bloc.dart';

abstract class StaffpanelEvent extends Equatable {
  const StaffpanelEvent();

  @override
  List<Object> get props => [];
}

class PanelVisibilitySwitchedEvent extends StaffpanelEvent {}
