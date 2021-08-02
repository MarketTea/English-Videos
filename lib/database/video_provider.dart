import 'package:english_videos/const/const.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class VideoDTO {
  String description;
  int isFavorite;
  String length;
  int level;
  String note;
  String notiDescription;
  String notiTitle;
  String playlistId;
  String thumbUrl;
  String time;
  String title;
  int trueSubs;
  String videoId;
  String viewCount;
  String partCompleted;

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnDescription: description,
      columnIsFavorite: isFavorite,
      columnLength: length,
      columnLevel: level,
      columnNote: note,
      columnNotiDescription: notiDescription,
      columnNotiTitle: notiTitle,
      columnPlayListId: playlistId,
      columnThumbUrl: thumbUrl,
      columnTime: time,
      columnTitle: title,
      columnTrueSubs: trueSubs,
      columnVideoId: videoId,
      columnViewCount: viewCount,
      columnPartCompleted: partCompleted
    };
    return map;
  }

  VideoDTO(
      {this.description,
      this.isFavorite,
      this.length,
      this.level,
      this.note,
      this.notiDescription,
      this.notiTitle,
      this.playlistId,
      this.thumbUrl,
      this.time,
      this.title,
      this.trueSubs,
      this.videoId,
      this.viewCount,
      this.partCompleted});

  VideoDTO.fromMap(Map<String, dynamic> map) {
    description = map[columnDescription];
    isFavorite = map[columnIsFavorite];
    length = map[columnLength];
    level = map[columnLevel];
    note = map[columnNote];
    notiDescription = map[columnNotiDescription];
    notiTitle = map[columnNotiTitle];
    playlistId = map[columnPlayListId];
    thumbUrl = map[columnThumbUrl];
    time = map[columnTime];
    title = map[columnTitle];
    trueSubs = map[columnTrueSubs];
    videoId = map[columnVideoId];
    viewCount = map[columnViewCount];
    partCompleted = map[columnPartCompleted];
  }
}

class VideoProvider {
  Future<List<VideoDTO>> getVideos(Database database) async {
    var maps = await database.query(tableVideo, columns: [
      columnDescription,
      columnIsFavorite,
      columnLength,
      columnLevel,
      columnNote,
      columnNotiDescription,
      columnNotiTitle,
      columnPlayListId,
      columnThumbUrl,
      columnTime,
      columnTitle,
      columnTrueSubs,
      columnVideoId,
      columnViewCount,
      columnPartCompleted,
    ]);
    if (maps.length > 0) return maps.map((e) => VideoDTO.fromMap(e)).toList();
    return null;
  }
}

class VideoList extends StateNotifier<List<VideoDTO>> {
  VideoList(List<VideoDTO> state) : super(state ?? []);

  void addAll(List<VideoDTO> videoDTO) {
    state.addAll(videoDTO);
  }

  void add(VideoDTO videoDTO) {
    state = [
      ...state,
      videoDTO,
    ];
  }
}
