import 'package:bloc/bloc.dart';

class DateFilterCubit extends Cubit<Map<String, dynamic>> {
  DateFilterCubit() : super({'value': 'today', 'label': 'Today'});

  Map<String, dynamic> currentValue = {'value': 'today', 'label': 'This Month'};
  final List<Map> items = [
    {'value': 'today', 'label': 'Today'},
    {'value': 'last_month', 'label': 'Last Month'},
    {'value': 'last_week', 'label': 'Last Week'},
  ];

  changeValue(String newValue) {
    currentValue = items
        .firstWhere((element) => element["value"] == newValue)
        .cast<String, dynamic>();
    emit(currentValue);
  }
}
