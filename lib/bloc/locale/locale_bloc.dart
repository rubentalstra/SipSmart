import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'locale_event.dart';
import 'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(LocaleState(locale: const Locale('en'))) {
    on<LocaleChanged>((event, emit) {
      emit(LocaleState(locale: event.locale));
    });
  }
}
