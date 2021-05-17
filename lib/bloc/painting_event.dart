part of 'painting_bloc.dart';

@immutable
abstract class PaintingEvent {
  PaintingEvent([List props = const []]);
}

class LoadPaintings extends PaintingEvent {}

class AddPainting extends PaintingEvent {
  final Painting newPainting;

  AddPainting(this.newPainting) : super([newPainting]);
}

class UpdatePainting extends PaintingEvent {
  final Painting updatedPainting;

  UpdatePainting(this.updatedPainting) : super([updatedPainting]);
}

class DeletePainting extends PaintingEvent {
  final Painting painting;

  DeletePainting(this.painting) : super([painting]);
}
