# adonis_websok_null_safety

A high level adonisjs websockets implementation for dart, flutter and web. (Null safety)

Original project [AdonisWebsok](https://github.com/ConsoleTVs/AdonisWebsok)
I only updated some files for null safety

# how to use

## Package.yaml

```yaml
publish_to: none

dependencies:
  adonis_websok_null_safety:
    git:
      url: https://github.com/djpfs/AdonisWebsokNullSafety.git
```

## Import

```dart
import 'package:adonis_websok_null_safety/adonis_websok.dart';
```

## Getting Started

```dart
/// For HTML:
/// import 'package:adonis_websok_null_safety/html.dart';
///
/// For IO (Flutter, Dart, etc.)
import 'package:adonis_websok_null_safety/io.dart';

void main() async {
  // Create a websocket connection and attach a JWT to it.
  // For HTML: IOAdonisWebsok -> HTMLAdonisWebsok
  final socket = IOAdonisWebsok(host: '192.168.0.100', port: 3333)
    ..withJwtToken('XXXXXXX');
  // Connect to the socket and await for response from the adonis server.
  await socket.connect();
  // Subscribe to the 'disponible' topic.
  final disponible = await socket.subscribe('disponible');
  // Set a callback to execute when a new event comes by.
  disponible.on('canvi', (data) => print('canvi: ${data.toString()}'));
  // To stop the listener, just perform disponible.off('canvi')
  // Emit send a new message to the server, with additional data if needed.
  disponible.emit('canvi'); // Accepts a data argument as the 2nd parameter.
  // Close the subscription (unsubscribe from the given topic).
  final closed = await disponible.close(); // Unsubscribe.
  // CLoses the socket connection.
  socket.close();
}
```
