import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'navidrawer_event.dart';

class NavidrawerBloc extends Bloc<NavidrawerEvent, bool> {
  NavidrawerBloc() : super(false) {
    on<NavidrawerSwitchedEvent>((event, emit) => emit(!state));
  }
}
