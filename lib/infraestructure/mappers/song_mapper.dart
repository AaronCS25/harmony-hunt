import 'package:ir2/domain/entities/entities.dart';
import 'package:ir2/infraestructure/models/models.dart';

class SongMapper {
  static Song spotifyTrackToEntity(TrackByIdResponse track) => Song(
        id: track.id,
        title: track.name,
        artistName: track.artists.first.name,
        urlArtistPageSpotify: track.externalUrls.spotify,
        albumName: track.album.name,
        albumType: track.album.albumType,
        urlAlbumSpotify: track.album.externalUrls.spotify,
        releaseDate: track.album.releaseDate.toString(), // TODO: FIX IT
        songDuration: track.durationMs,
        trackNumberOnTheAlbum: track.trackNumber,
        popularity: track.popularity,
        urlToSongSpotify: track.externalUrls.spotify,
        urlCover:
            track.album.images.isNotEmpty ? track.album.images.first.url : '',
      );
}
