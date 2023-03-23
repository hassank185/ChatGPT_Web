


import 'dart:convert';


import 'package:flutter_web_chat_gpt/core/custom_exception.dart';
import 'package:flutter_web_chat_gpt/core/open_ai_data.dart';
import 'package:flutter_web_chat_gpt/features/chat/data/models/chat_conversation_model.dart';
import 'package:flutter_web_chat_gpt/features/chat/data/remote_data_source/chat_remote_data_source.dart';
import 'package:flutter_web_chat_gpt/features/chat/domain/entities/chat_conversation_entity.dart';
import 'package:flutter_web_chat_gpt/features/global/provider/provider.dart';
import 'package:http/http.dart' as http;

class ChatRemoteDataSourceImpl implements ChatRemoteDataSource{
  final http.Client httpClient;

  ChatRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<ChatConversationEntity> chatConversation(String prompt, Function(bool isReqComplete) onCompleteReqProcessing) async{
    final String _endPoint = "completions";

    onCompleteReqProcessing(true);

    final queryPrompt = prompt;

    final rowBodyEncodedParams = json.encode({
      "model": kOpenAIModel,
      "prompt": queryPrompt,
      "temperature": 0.9,
      "max_tokens": 1200,
      "top_p": 1,
      "frequency_penalty": 0.0,
      "presence_penalty": 0.6,
      "stop": ["Human:", "AI:"]
    });

    final response = await httpClient.post(
        Uri.parse(
          endPoint(
            _endPoint,
          ),
        ),
        body: rowBodyEncodedParams,
        headers: headerBearerOption(OPEN_AI_KEY));


    if (response.statusCode == 200){
      onCompleteReqProcessing(false);
      return ChatConversationModel.fromJson(json.decode(response.body));
    }else{
      onCompleteReqProcessing(false);
      throw ChatGPTServerException(message: json.decode(response.body)['error']['message']);
    }

  }


}