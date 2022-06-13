import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'revieweditor_event.dart';
part 'revieweditor_state.dart';

class RevieweditorBloc extends Bloc<RevieweditorEvent, bool> {
  RevieweditorBloc() : super(false) {
    on<RevieweditorVisibilitySwitchedEvent>((event, emit) {
      emit(!state);
    });
  }
}
