part of 'staffpanel_bloc.dart';

abstract class StaffpanelState extends Equatable {
  const StaffpanelState();

  @override
  List<Object> get props => [];
}

class StaffpanelInitial extends StaffpanelState {}

class PanelVisibilitySwitchedState extends StaffpanelState {}
