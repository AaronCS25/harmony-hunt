class QueryTrackResponse {
  final String trackId;
  final double score;

  QueryTrackResponse({required this.trackId, required this.score});

  factory QueryTrackResponse.fromJson(List<dynamic> json) {
    return QueryTrackResponse(
      trackId: json[0],
      score: json[1],
    );
  }
}
