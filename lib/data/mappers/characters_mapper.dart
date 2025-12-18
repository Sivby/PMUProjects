import 'package:flatter_test_app/data/dtos/characters_dto.dart';
import 'package:flatter_test_app/domain/models/card.dart';
import 'package:flatter_test_app/domain/models/home.dart';

const _imagePlaceholder =
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-vhbgwbZT_5KkQS5-eD_21HzhgIiTDt80Jw&s';

extension CharactersDtoToModel on CharactersDto {
  HomeData toDomain() => HomeData(
    data: data?.map((e) => e.toDomain()).toList(),
    nextPage: meta?.pagination?.next,
  );
}

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