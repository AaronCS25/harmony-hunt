import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/infraestructure/models/models.dart';

class OwnTrackMapper {
  static OwnTrack queryTrackToOwnTrack(QueryTrackResponse queryTrack) =>
      OwnTrack(
        trackId: queryTrack.trackId,
        albumTrackId: queryTrack.trackAlbumId,
        lyrics: queryTrack.lyrics,
      );
}
