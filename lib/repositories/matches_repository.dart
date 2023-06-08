// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intl/intl.dart';
import 'package:matches/errors/network_error.dart';
import 'package:matches/errors/repository_error.dart';
import 'package:matches/repositories/mapper/match_mapper.dart';
import 'package:matches/services/network/matches_service.dart';
import 'package:matches/models/match.dart';

class MatchesRepository {
  final MatchesService matchesService;
  final MatchMapper matchMapper;

  MatchesRepository({
    required this.matchesService,
    required this.matchMapper,
  });

  Future<List<Match>> matches(DateTime date) async {
    try {
      final response =
          await matchesService.matches(DateFormat('gg-MM-yyyy').format(date));
      return response.map(matchMapper.toModel).toList(growable: false);
    } on NetworkError catch (e) {
      throw RepositoryError(e.reasonPhrase);
    } catch (e) {
      throw RepositoryError();
    }
  }
}
