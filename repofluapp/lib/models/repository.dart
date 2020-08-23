class RepositoryModel {
  RepositoryModel({
    this.id,
    this.name,
    this.description,
    this.createdAt,
    this.language,
    this.stargazersCount,
    this.isFavorite = false,
  });

  final int id;
  final String name;
  final String description;
  final String createdAt;
  final String language;
  final int stargazersCount;
  bool isFavorite;

  static List<RepositoryModel> convertJsonList(dynamic values) {
    var list = List<RepositoryModel>();
    var repositoryModel;
    for (var item in values) {
      repositoryModel = RepositoryModel(
          id: item['id'],
          name: item['name'],
          description: item['description'],
          createdAt: item['created_at'],
          language: item['language'],
          stargazersCount: item['stargazers_count']);
      list.add(repositoryModel);
    }
    return list;
  }
}
