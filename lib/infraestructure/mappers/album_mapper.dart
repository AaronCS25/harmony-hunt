import 'package:ir2/infraestructure/models/models.dart';
import 'package:ir2/domain/entities/entities.dart';

class AlbumMapper {
  static Album spotifyAlbumToEntity(AlbumByIdResponse album) => Album(
        title: album.name,
        albumType: album.albumType,
        artistName: album.artists.first.name,
        urlAlbumSpotify: album.externalUrls.spotify,
        generes: album.genres.cast<String>(),
        urlCover: album.images.first.url,
        releaseDate: album.releaseDate.toString(),
        numberOfTracks: album.totalTracks,
        popularity: album.popularity,
      );
}
