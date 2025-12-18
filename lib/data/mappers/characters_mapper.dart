import 'package:flatter_test_app/data/dtos/characters_dto.dart';
import 'package:flatter_test_app/domain/models/card.dart';

const _imagePlaceholder =
    'https://thumbs.dreamstime.com/b/missing-person-poster-16343674.jpg';

extension CharacterDataDtoToModel on CharacterDataDto {
  CardData toDomain() => CardData(
    attributes?.name ?? 'UNKNOWN',
    imageUrl: attributes?.image ?? _imagePlaceholder,
    descriptionText: _makeDescriptionText(attributes?.born, attributes?.died),
  );

  String _makeDescriptionText(String? born, String? died) {
    return born != null && died != null
        ? '$born - $died'
        : born != null
        ? 'born: $born'
        : died != null
        ? 'died: $died'
        : '';
  }
}