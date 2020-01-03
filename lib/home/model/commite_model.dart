class ListCommitHistoryModel {
  List<CommitHistoryModel> listCommitHistory;

  ListCommitHistoryModel({
    this.listCommitHistory,
  });

  factory ListCommitHistoryModel.fromJson(List<Map<String, dynamic>> json) =>
      ListCommitHistoryModel(
        listCommitHistory: List<CommitHistoryModel>.from(
            (json ?? []).map((x) => CommitHistoryModel.fromJson(x))),
      );
}

class CommitHistoryModel {
  String sha;
  String nodeId;
  Commit commit;
  String url;
  String htmlUrl;
  String commentsUrl;
  dynamic author;
  dynamic committer;
  List<Parent> parents;

  CommitHistoryModel({
    this.sha,
    this.nodeId,
    this.commit,
    this.url,
    this.htmlUrl,
    this.commentsUrl,
    this.author,
    this.committer,
    this.parents,
  });

  factory CommitHistoryModel.fromJson(Map<String, dynamic> json) =>
      CommitHistoryModel(
        sha: json["sha"],
        nodeId: json["node_id"],
        commit: Commit.fromJson(json["commit"]),
        url: json["url"],
        htmlUrl: json["html_url"],
        commentsUrl: json["comments_url"],
        author: json["author"],
        committer: json["committer"],
        parents:
            List<Parent>.from(json["parents"].map((x) => Parent.fromJson(x))),
      );
}

class Commit {
  Author author;
  Author committer;
  String message;
  Tree tree;
  String url;
  int commentCount;
  Verification verification;

  Commit({
    this.author,
    this.committer,
    this.message,
    this.tree,
    this.url,
    this.commentCount,
    this.verification,
  });

  factory Commit.fromJson(Map<String, dynamic> json) => Commit(
        author: Author.fromJson(json["author"]),
        committer: Author.fromJson(json["committer"]),
        message: json["message"],
        tree: Tree.fromJson(json["tree"]),
        url: json["url"],
        commentCount: json["comment_count"],
        verification: Verification.fromJson(json["verification"]),
      );
}

class Author {
  String name;
  String email;
  DateTime date;

  Author({
    this.name,
    this.email,
    this.date,
  });

  factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        email: json["email"],
        date: DateTime.parse(json["date"]),
      );
}

class Tree {
  String sha;
  String url;

  Tree({
    this.sha,
    this.url,
  });

  factory Tree.fromJson(Map<String, dynamic> json) => Tree(
        sha: json["sha"],
        url: json["url"],
      );
}

class Verification {
  bool verified;
  String reason;
  dynamic signature;
  dynamic payload;

  Verification({
    this.verified,
    this.reason,
    this.signature,
    this.payload,
  });

  factory Verification.fromJson(Map<String, dynamic> json) => Verification(
        verified: json["verified"],
        reason: json["reason"],
        signature: json["signature"],
        payload: json["payload"],
      );
}

class Parent {
  String sha;
  String url;
  String htmlUrl;

  Parent({
    this.sha,
    this.url,
    this.htmlUrl,
  });

  factory Parent.fromJson(Map<String, dynamic> json) => Parent(
        sha: json["sha"],
        url: json["url"],
        htmlUrl: json["html_url"],
      );
}
