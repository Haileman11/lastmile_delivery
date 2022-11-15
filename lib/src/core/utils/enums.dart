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
