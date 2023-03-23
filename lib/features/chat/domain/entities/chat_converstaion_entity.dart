

import 'package:equatable/equatable.dart';
import 'package:flutter_web_chat_gpt/features/chat/domain/entities/chat_conversation_data_entity.dart';

class ChatConversationEntity extends Equatable{
  final String? id;
  final List<ChatConversationDataEntity>? choices;

  ChatConversationEntity({this.choices, this.id});

  @override
  // TODO: implement props
  List<Object?> get props => [id,choices];
}