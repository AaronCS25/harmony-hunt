import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/infraestructure/models/models.dart';

class OwnTrackMapper {
  static OwnTrack queryTrackToOwnTrack(QueryTrackResponse queryTrack) =>
      OwnTrack(
        track_id: queryTrack.trackId,
        album_track_id: queryTrack.trackAlbumId,
        lyrics: queryTrack.lyrics,
      );
}
