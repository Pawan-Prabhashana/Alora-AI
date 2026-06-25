/// Centralized identity + sender compatibility for the Alora AI assistant.
///
/// The assistant was previously branded with a different name, and older chat
/// messages persisted in Firestore may still carry legacy sender tags. To keep
/// that stored history rendering correctly while moving new messages to the
/// "Alora" identity, all sender reads/writes go through the helpers below
/// instead of comparing raw strings in each screen.

/// User-facing display name for the AI assistant.
const String kAssistantDisplayName = 'Alora';

/// User-facing display name for the human user in chat.
const String kUserDisplayName = 'You';

/// Sender tag written to NEW assistant chat messages.
const String kAssistantSender = 'Alora';

/// Sender tag written to NEW user chat messages.
///
/// Kept as the historical value `'I'` for backward compatibility: existing
/// stored chat documents already use `'I'` for the user, and the chat history
/// renderer aligns user messages by comparing against this value.
const String kUserSender = 'I';

/// Assistant sender tags that may appear in stored chat history. Includes the
/// current value plus every legacy value used before the Alora rebrand, so old
/// Firestore conversations still render as assistant messages.
const List<String> _assistantSenderTags = <String>[
  kAssistantSender, // 'Alora'
  'ATTI',
  'Atti',
  'Ati',
  'ati',
  '아띠',
];

/// Returns true if [sender] denotes the AI assistant, accepting both the
/// current `'Alora'` value and any legacy value found in older chat documents.
bool isAssistantSender(String? sender) {
  if (sender == null) return false;
  final value = sender.trim().toLowerCase();
  return _assistantSenderTags.any((tag) => tag.toLowerCase() == value);
}

/// Maps any assistant sender (current or legacy) to the canonical
/// [kAssistantSender]. Non-assistant senders are returned unchanged so the
/// user tag (`'I'`) and any future values are preserved.
String normalizeAssistantSender(String sender) =>
    isAssistantSender(sender) ? kAssistantSender : sender;
