import 'package:adonis_websok_null_safety/io.dart';
import 'package:test/test.dart';

void main() {
  test('Websocket test', () async {
    // Create a websocket connection and attach a JWT to it.
    final socket = IOAdonisWebsok(host: '192.168.0.10', port: 3333);
    // Connect to the socket and await for response from the adonis server.
    await socket.connect();
    expect(socket.isActive, true);
    // Subscribe to the 'disponible' topic.
    final disponible = await socket.subscribe('boletoCode');
    // Set a callback to execute when a new event comes by.
    disponible.on('message', (data) => print('message: ${data.toString()}'));
    // To stop the listener, just perform disponible.off('message')
    // Emit send a new message to the server, with additional data if needed.
    disponible.emit('message'); // Accepts a data argument as the 2nd parameter.
    // Close the subscription (unsubscribe from the given topic).
    final closed = await disponible.close(); // Unsubscribe.
    expect(closed, true);
    expect(disponible.isActive, false);
    // CLoses the socket connection.
    socket.close();
    expect(socket.isActive, false);
  });
}
