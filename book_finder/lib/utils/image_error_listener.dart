import 'package:logger/logger.dart';

final _log = Logger();

void imageErrorListener(Object error) =>
    _log.e('Failed to load image', error: error);
