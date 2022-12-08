enum OrderCategory {
  multipleToSingle,
  singleToMultiple,
  singleToSingle;

  String toMap() => name;
  static OrderCategory fromMap(String json) => values.byName(json);
}

enum OrderStatus {
  unassigned,
  assigned,
  pickedUp,
  delivered,
  transferred,
  returned,
  closed,
  inprogress,
  failed,
  cancelled;

  String toMap() => name;
  static OrderStatus fromMap(String json) => values.byName(json);
}

enum OrderType {
  ondemand,
  scheduled;

  String toMap() => name;
  static OrderType fromMap(String json) => values.byName(json);
}

enum TaskStatus {
  pending,
  inprogress,
  cancelled,
  done;

  String toMap() => name;
  static TaskStatus fromMap(String json) => values.byName(json);
}

enum TaskType {
  pickup,
  dropoff;

  String toMap() => name;
  static TaskType fromMap(String json) => values.byName(json);
}

enum TransactionType {
  withdrawal,
  deposit,
  earned;

  String toMap() => name;
  static TransactionType fromMap(String json) => values.byName(json);
}
