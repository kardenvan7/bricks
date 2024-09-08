enum BlocInjectionType {
  provider,
  constructor;

  factory BlocInjectionType.fromString(String value) =>
      BlocInjectionType.values.byName(value);
}
