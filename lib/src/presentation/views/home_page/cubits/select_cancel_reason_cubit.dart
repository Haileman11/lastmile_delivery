import 'package:bloc/bloc.dart';

class SelectCancelReasonCubit extends Cubit<String> {
  SelectCancelReasonCubit(this.selectedReason) : super(selectedReason);

  String selectedReason;

  updateSelectedReason(String reason) {
    selectedReason = reason;
    emit(reason);
  }
}
