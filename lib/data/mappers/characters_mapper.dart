import 'package:flatter_test_app/data/dtos/characters_dto.dart';
import 'package:flatter_test_app/domain/models/card.dart';

const _imagePlaceholder =
    'https://upload.wikimedia.org/wikipedia/en/archive/b/b1/20210811082420%21Portrait_placeholder.png';

extension CharacterDataDtoToModel on CharacterDataDto {
  CardData toDomain() => CardData(
    attributes?.name ?? 'UNKNOWN',
    imageUrl: attributes?.image ?? _imagePlaceholder,
    descriptionText: '${attributes?.born} - ${attributes?.died}',
  );
}