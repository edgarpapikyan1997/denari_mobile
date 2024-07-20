import 'package:talker/talker.dart';

final Talker logger = Talker();

setupLogger(bool enable) {
  logger.settings = TalkerSettings(enabled: enable);
}
