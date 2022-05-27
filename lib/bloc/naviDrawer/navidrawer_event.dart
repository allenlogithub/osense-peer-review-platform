part of 'navidrawer_bloc.dart';

abstract class NavidrawerEvent extends Equatable {
  const NavidrawerEvent();

  @override
  List<Object> get props => [];
}

class NavidrawerSwitchedEvent extends NavidrawerEvent {}
