extension Firstlettercaptial on String {
  String tofirstcaptial() {
    if (isEmpty) return this;
    return split('')
        .map(
          (word) =>
              word.isEmpty
                  ? ""
                  : word[0].toUpperCase() + word.substring(1).toLowerCase(),
        )
        .join("");
  }
}
