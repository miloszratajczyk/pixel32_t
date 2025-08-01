import 'dart:async';

class RedrawScheduler {
  /// Throttle redraw requests
  RedrawScheduler({
    required this.onRedraw,
    this.frameDuration = const Duration(milliseconds: 16),
  });

  final void Function() onRedraw;
  final Duration frameDuration;

  bool _needsRedraw = false;
  bool _running = false;
  Timer? _timer;

  void requestRedraw() {
    _needsRedraw = true;

    if (!_running) {
      onRedraw();
      _startLoop();
    }
  }

  void _startLoop() {
    _running = true;
    _timer = Timer.periodic(frameDuration, (_) {
      if (_needsRedraw) {
        _needsRedraw = false;
        onRedraw();
      } else {
        _stop();
      }
    });
  }

  void _stop() {
    _timer?.cancel();
    _timer = null;
    _running = false;
  }

  void dispose() {
    _stop();
  }
}
