extension NumberExt on num {
  double toPrecision(int n) => double.parse(toStringAsFixed(n));
}
