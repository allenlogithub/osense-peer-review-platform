import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:peerrev/data/repo/reviewedScore.dart';

part 'staffpanel_event.dart';
part 'staffpanel_state.dart';

class StaffpanelBloc extends Bloc<StaffpanelEvent, bool> {
  final ReviewedScore reviewedScore;

  StaffpanelBloc({required this.reviewedScore}) : super(false) {
    on<PanelVisibilitySwitchedEvent>((event, emit) {
      emit(!state);
    });
  }
}
