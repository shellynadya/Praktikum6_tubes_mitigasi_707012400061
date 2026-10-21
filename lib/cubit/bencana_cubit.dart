
import 'package:flutter_bloc/flutter_bloc.dart';

class BencanaCubit extends Cubit<Set<String>> {
  BencanaCubit() : super(<String>{});

  void tambahPantauan(String namaBencana) {
    emit({...state, namaBencana});
  }

  void hapusPantauan(String namaBencana) {
    final daftarBaru = Set<String>.from(state);
    daftarBaru.remove(namaBencana);
    emit(daftarBaru);
  }

  bool sedangDipantau(String namaBencana) {
    return state.contains(namaBencana);
  }

  int get totalPantauan => state.length;
}
