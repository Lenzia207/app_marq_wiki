import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatRepository extends HookWidget {
  ChatRepository({super.key});

  final TextEditingController controller = useTextEditingController();
  final ValueNotifier<String> answer = useState('');
  final ValueNotifier<List<String>> sources = useState([]);
  final ValueNotifier<bool> isLoading = useState(false);
  final ValueNotifier<String> errorMessage = useState('');

  // Function to make the POST request
  Future<void> makePostRequest() async {
    if (controller.text.isEmpty) {
      errorMessage.value = 'Please enter a question.';
      return;
    }

    isLoading.value = true;
    errorMessage.value = '';
    answer.value = '';
    sources.value = [];

    final url = Uri.parse('http://localhost:8000/submit_input');

    // The data input to send
    Map<String, String> data = {'query_text': controller.text};

    // Encode the data to JSON
    String body = json.encode(data);

    try {
      final http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );

      debugPrint('LEZY Response status code: ${response.statusCode}');

      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = json.decode(response.body);
        debugPrint('Decoded response data: $responseData');

        if (responseData.containsKey('response_text')) {
          if (responseData['response_text'] != null &&
              responseData['sources'] != null) {
            answer.value = responseData['response_text'];
            sources.value = List<String>.from(responseData['sources'] ?? []);
          } else {
            errorMessage.value = 'Error: response_text is null';
          }
        } else {
          errorMessage.value =
              'Error: Response does not contain a "response_text" key';
        }
      } else {
        errorMessage.value =
            'Error: Server returned status code ${response.statusCode}';
      }
    } catch (e) {
      errorMessage.value = 'Error: Could not connect to the server.\n$e';
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
