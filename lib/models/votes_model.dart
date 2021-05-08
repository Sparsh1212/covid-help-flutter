class Votes {
  final int upvotes;
  final int downvotes;

  Votes({this.upvotes, this.downvotes});

  factory Votes.fromJSON(dynamic json) {
    return Votes(
      upvotes: json['upvoteCount'],
      downvotes: json['downvoteCount']
    );
  }
}
