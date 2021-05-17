part of 'painting_bloc.dart';

@immutable
abstract class PaintingState {
  PaintingState([List props = const []]);
}

class PaintingsLoading extends PaintingState {}

class PaintingsLoaded extends PaintingState {
  final List<Painting> paintings;

  PaintingsLoaded(this.paintings) : super([paintings]);
}
