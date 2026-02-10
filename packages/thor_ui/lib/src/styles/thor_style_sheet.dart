import 'package:thor/thor.dart';

class ThorStyleSheet extends StyleSheets {
  ThorStyleSheet()
    : super({
        '.row': 'display: flex; flex-direction: row; align-items: center',
        '.column': 'display: flex; flex-direction: column; align-items: center',
        '.center':
            'display: flex; justify-content: center; align-items: center',
        '.expanded': 'display: flex; flex-direction: column; min-width: 0',
        '.constrained-box':
            'display: flex; flex-direction: column; width: 100%',
        '.cross-axis-start': 'align-items: flex-start',
        '.cross-axis-center': 'align-items: center',
        '.cross-axis-end': 'align-items: flex-end',
        '.main-axis-start': 'justify-content: flex-start',
        '.main-axis-center': 'justify-content: center',
        '.main-axis-end': 'justify-content: flex-end',
        '.main-axis-space-between': 'justify-content: space-between',
        '.main-axis-space-around': 'justify-content: space-around',
        '.main-axis-space-evenly': 'justify-content: space-evenly',
        '.main-axis-size-max': 'align-self: stretch',
        '.main-axis-size-min': 'align-self: auto',
      });
}
