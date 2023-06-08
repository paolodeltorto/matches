import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:matches/errors/network_error.dart';
import 'package:matches/services/network/dto/match_dto.dart';

import 'file:///Users/paolo/OneDrive/Desktop/matches/sports_apikey.dart';
import 'package:matches/services/network/dto/matches_response.dart';

class MatchesService {
  static const _fixturesEndpoint = 'fixtures';
  static const _xApiSportsKeyHeader = 'x-apisports-key';
  final String baseUrl;

  MatchesService(this.baseUrl);

  Future<List<MatchDTO>> matches(String date) async {
    final response = await http.get(
      Uri.https(baseUrl, _fixturesEndpoint, {
        'date': date,
      }),
      headers: <String, String>{
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
        _xApiSportsKeyHeader: sportsApiKey,
      },
    );

    if (response.statusCode < 200 || response.statusCode > 299) {
      throw NetworkError(
        statusCode: response.statusCode,
        reasonPhrase: response.reasonPhrase,
      );
    }

    final decodedResponse = jsonDecode(response.body) as Map<String, dynamic>;
    return MatchesResponse.fromJson(decodedResponse).response;
  }
}
