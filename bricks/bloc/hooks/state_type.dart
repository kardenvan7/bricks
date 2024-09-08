enum StateType {
  sealed,
  freezed;

  factory StateType.fromString(String value) => StateType.values.byName(value);
}
