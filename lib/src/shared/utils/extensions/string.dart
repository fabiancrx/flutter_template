
extension StringX on String {
  bool get isNotNullOrEmpty => this != null && isNotEmpty;

  bool get isNullOrEmpty => this == null || isEmpty;
}
