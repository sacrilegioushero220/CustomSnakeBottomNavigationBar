class VideoModel {
  String? id;
  String? category;
  String? subCategory;
  String? videoTitle;
  String? postedBy;
  String? videoDescription;
  String? videos;
  String? videoImage;
  String? videoId;
  String? homeDisplay;
  String? priority;
  String? status;
  String? categoryName;

  VideoModel({
    this.id,
    this.category,
    this.subCategory,
    this.videoTitle,
    this.postedBy,
    this.videoDescription,
    this.videos,
    this.videoImage,
    this.videoId,
    this.homeDisplay,
    this.priority,
    this.status,
    this.categoryName,
  });

  VideoModel copyWith({
    String? id,
    String? category,
    String? subCategory,
    String? videoTitle,
    String? postedBy,
    String? videoDescription,
    String? videos,
    String? videoImage,
    String? videoId,
    String? homeDisplay,
    String? priority,
    String? status,
    String? categoryName,
  }) =>
      VideoModel(
        id: id ?? this.id,
        category: category ?? this.category,
        subCategory: subCategory ?? this.subCategory,
        videoTitle: videoTitle ?? this.videoTitle,
        postedBy: postedBy ?? this.postedBy,
        videoDescription: videoDescription ?? this.videoDescription,
        videos: videos ?? this.videos,
        videoImage: videoImage ?? this.videoImage,
        videoId: videoId ?? this.videoId,
        homeDisplay: homeDisplay ?? this.homeDisplay,
        priority: priority ?? this.priority,
        status: status ?? this.status,
        categoryName: categoryName ?? this.categoryName,
      );
}
