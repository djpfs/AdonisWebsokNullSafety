/// Copyright (c) 2019 - Èrik Campobadal Forés
/// Updating the code to null security - João Pedro Freire (@djpfs on github)
library adonis_websok.io;

/// Import the IO package.

/// Import the AdonisWebsok class.
import 'package:adonis_websok_null_safety/adonis_websok.dart';
import 'package:websokNullSafety/io.dart';

/// Represents an adonis websocket for IO.
class IOAdonisWebsok extends AdonisWebsok<IOWebsok> {
  /// Creates a new instance of the class.
  IOAdonisWebsok({
    required String host,
    int port = -1,
    bool tls = false,
    String path = 'adonis-ws',
    Map<String, String> query = const <String, String>{},
  }) : super(
          host: host,
          port: port,
          tls: tls,
          path: path,
          query: query,
        );

  /// Sets up the connection using [S].
  IOWebsok connection() => IOWebsok(
        host: this.host,
        port: this.port,
        tls: this.tls,
        path: this.path,
        query: this.fullQuery(),
      );
}
