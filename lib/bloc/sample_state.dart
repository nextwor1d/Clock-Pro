part of 'sample_bloc.dart';

abstract class SampleState extends Equatable {
  const SampleState();

  @override
  List<Object> get props => [];
}

class SampleInitial extends SampleState {}

class SampleLoaded extends SampleState {
  //
}
