import 'dart:ui';

enum SupportedBlendModes {
  clear('Clear', BlendMode.clear),
  src('Source', BlendMode.src),
  dst('Destination', BlendMode.dst),
  srcOver('Source Over', BlendMode.srcOver),
  dstOver('Destination Over', BlendMode.dstOver),
  srcIn('Source In', BlendMode.srcIn),
  dstIn('Destination In', BlendMode.dstIn),
  srcOut('Source Out', BlendMode.srcOut),
  dstOut('Destination Out', BlendMode.dstOut),
  srcATop('Source Atop', BlendMode.srcATop),
  dstATop('Destination Atop', BlendMode.dstATop),
  xor('XOR', BlendMode.xor),
  plus('Plus', BlendMode.plus),
  modulate('Modulate', BlendMode.modulate),
  screen('Screen', BlendMode.screen),
  overlay('Overlay', BlendMode.overlay),
  darken('Darken', BlendMode.darken),
  lighten('Lighten', BlendMode.lighten),
  colorDodge('Color Dodge', BlendMode.colorDodge),
  colorBurn('Color Burn', BlendMode.colorBurn),
  hardLight('Hard Light', BlendMode.hardLight),
  softLight('Soft Light', BlendMode.softLight),
  difference('Difference', BlendMode.difference),
  exclusion('Exclusion', BlendMode.exclusion),
  multiply('Multiply', BlendMode.multiply),
  hue('Hue', BlendMode.hue),
  saturation('Saturation', BlendMode.saturation),
  color('Color', BlendMode.color),
  luminosity('Luminosity', BlendMode.luminosity);

  const SupportedBlendModes(this.label, this.mode);
  final String label;
  final BlendMode mode;
}
