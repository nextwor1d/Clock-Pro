import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'sample_event.dart';
part 'sample_state.dart';

class SampleBloc extends Bloc<SampleEvent, SampleState> {
  SampleBloc() : super(SampleInitial()) {
    on<LoadSample>((event, emit) {
      emit(SampleLoaded());
    });
  }
}
