import 'package:flutter/material.dart';

Color makePastelTone(Color color,
    {double saturationFactor = 0.5, double brightnessFactor = 1.1}) {
  HSVColor hsvColor = HSVColor.fromColor(color);
  // 채도를 감소시켜 파스텔 톤을 생성합니다.
  double saturation = hsvColor.saturation * saturationFactor;
  // 명도를 증가시켜 밝기를 추가합니다. 1.0이 최대값이므로 최대값을 넘지 않도록 조정합니다.
  double brightness = (hsvColor.value * brightnessFactor).clamp(0.1, 0.5);
  // 조정된 채도와 명도로 새 HSVColor 객체를 생성합니다.
  HSVColor newHsvColor =
      hsvColor.withSaturation(saturation).withValue(brightness);
  // 새로운 Color 객체로 변환합니다.
  return newHsvColor.toColor();
}
