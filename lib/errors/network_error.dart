// ignore_for_file: public_member_api_docs, sort_constructors_first
class NetworkError extends Error {
  final int statusCode;
  final String? reasonPhrase;

  NetworkError({
    required this.statusCode,
    this.reasonPhrase,
  });
}
