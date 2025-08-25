extension CapitalizeEachWord on String {
  String toFirstCapitalEachWord() {
    if (isEmpty) return this;

    // space vachu split cheyyuka
    return split(' ')
        .map((word) =>
            word.isEmpty ? '' : word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}
