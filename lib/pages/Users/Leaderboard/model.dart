class User {
  final int position;
  final String username;
  final int score;

  const User({
    required this.position,
    required this.username,
    required this.score,
  });

  User copy({
    int? position,
    String? username,
    int? score,
  }) =>
      User(
        position: position ?? this.position,
        username: username ?? this.username,
        score: score ?? this.score,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          position == other.position &&
          username == other.username &&
          score == other.score;

  @override
  int get hashCode => position.hashCode ^ username.hashCode ^ score.hashCode;
}
