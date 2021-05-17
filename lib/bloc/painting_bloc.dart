import 'dart:async';

import 'package:inventory/data/painting_dao.dart';

import '../data/painting.dart';

import 'package:equatable/equatable.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'painting_event.dart';
part 'painting_state.dart';

class PaintingBloc extends Bloc<PaintingEvent, PaintingState> {
  PaintingBloc() : super(PaintingsLoading());

  PaintingDao _paintingDao = PaintingDao();

  @override
  PaintingState get initalState => PaintingsLoading();

  @override
  Stream<PaintingState> mapEventToState(
    PaintingEvent event,
  ) async* {
    if (event is LoadPaintings) {
      yield PaintingsLoading();
      yield* _reloadPaintings();
    } else if (event is AddPainting) {
      // Loading indicator shouldn't be displayed while adding/updating/deleting
      // a single Fruit from the database - we aren't yielding FruitsLoading().
      await _paintingDao.insert(event.newPainting);
      yield* _reloadPaintings();
    } else if (event is UpdatePainting) {
      // Keeping the ID of the Fruit the same
      await _paintingDao.update(event.updatedPainting);
      yield* _reloadPaintings();
    } else if (event is DeletePainting) {
      await _paintingDao.delete(event.painting);
      yield* _reloadPaintings();
    }
  }

  Stream<PaintingState> _reloadPaintings() async* {
    final paintings = await _paintingDao.getAllSortedByTitle();
    // Yielding a state bundled with the Fruits from the database.
    yield PaintingsLoaded(paintings);
  }
}
