/// For HTML:
/// import 'package:adonis_websok/html.dart';
///
/// For IO (Flutter, Dart, etc.)
import 'package:adonis_websok_null_safety/io.dart';

void main() async {
  // Create a websocket connection and attach a JWT to it.
  // For HTML: IOAdonisWebsok -> HTMLAdonisWebsok
  final socket = IOAdonisWebsok(host: '192.168.0.10', port: 3333);
  // Connect to the socket and await for response from the adonis server.
  await socket.connect();
  // Subscribe to the 'disponible' topic.
  final disponible = await socket.subscribe('boletoCode');
  // Set a callback to execute when a new event comes by.
  disponible.on('message', (data) => print('message: ${data.toString()}'));
  // To stop the listener, just perform disponible.off('message')
  // Emit send a new message to the server, with additional data if needed.
  disponible.emit('message'); // Accepts a data argument as the 2nd parameter.
  // Close the subscription (unsubscribe from the given topic).
  final closed = await disponible.close(); // Unsubscribe.
  // CLoses the socket connection.
  socket.close();
}
