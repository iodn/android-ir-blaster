import 'dart:async';

import 'package:flutter/services.dart';

enum IrTransmitterType {
  internal,
  usb,
  audio1Led,
  audio2Led,
}

extension IrTransmitterTypeX on IrTransmitterType {
  String get wireValue {
    switch (this) {
      case IrTransmitterType.internal:
        return 'INTERNAL';
      case IrTransmitterType.usb:
        return 'USB';
      case IrTransmitterType.audio1Led:
        return 'AUDIO_1_LED';
      case IrTransmitterType.audio2Led:
        return 'AUDIO_2_LED';
    }
  }

  String get displayName {
    switch (this) {
      case IrTransmitterType.internal:
        return 'Internal';
      case IrTransmitterType.usb:
        return 'USB';
      case IrTransmitterType.audio1Led:
        return 'Audio 1 LED';
      case IrTransmitterType.audio2Led:
        return 'Audio 2 LED';
    }
  }

  static IrTransmitterType fromWire(String? v) {
    switch ((v ?? '').toUpperCase()) {
      case 'USB':
        return IrTransmitterType.usb;
      case 'AUDIO_1_LED':
        return IrTransmitterType.audio1Led;
      case 'AUDIO_2_LED':
        return IrTransmitterType.audio2Led;
      case 'INTERNAL':
      default:
        return IrTransmitterType.internal;
    }
  }
}

class UsbDeviceInfo {
  final int vendorId;
  final int productId;
  final int deviceId;
  final String productName;
  final String deviceName;
  final bool hasPermission;

  const UsbDeviceInfo({
    required this.vendorId,
    required this.productId,
    required this.deviceId,
    required this.productName,
    required this.deviceName,
    required this.hasPermission,
  });

  factory UsbDeviceInfo.fromMap(Map<String, dynamic> m) {
    return UsbDeviceInfo(
      vendorId: (m['vendorId'] as num?)?.toInt() ?? 0,
      productId: (m['productId'] as num?)?.toInt() ?? 0,
      deviceId: (m['deviceId'] as num?)?.toInt() ?? 0,
      productName: (m['productName'] as String?) ?? '',
      deviceName: (m['deviceName'] as String?) ?? '',
      hasPermission: (m['hasPermission'] as bool?) ?? false,
    );
  }
}

class IrTransmitterCapabilities {
  final bool hasInternal;
  final bool hasUsb;
  final bool usbOpened;
  final bool hasAudio;
  final IrTransmitterType currentType;
  final List<UsbDeviceInfo> usbDevices;
  final bool autoSwitchEnabled;

  const IrTransmitterCapabilities({
    required this.hasInternal,
    required this.hasUsb,
    required this.usbOpened,
    required this.hasAudio,
    required this.currentType,
    required this.usbDevices,
    required this.autoSwitchEnabled,
  });

  bool get usbPermissionGranted => usbDevices.any((d) => d.hasPermission);
  bool get usbReady => hasUsb && usbPermissionGranted;

  factory IrTransmitterCapabilities.fromMap(Map<String, dynamic> m) {
    final devicesRaw = (m['usbDevices'] as List?) ?? const [];
    final devices = <UsbDeviceInfo>[];
    for (final item in devicesRaw) {
      if (item is Map) {
        devices.add(UsbDeviceInfo.fromMap(item.cast<String, dynamic>()));
      }
    }
    return IrTransmitterCapabilities(
      hasInternal: (m['hasInternal'] as bool?) ?? false,
      hasUsb: (m['hasUsb'] as bool?) ?? false,
      usbOpened: (m['usbOpened'] as bool?) ?? false,
      hasAudio: (m['hasAudio'] as bool?) ?? true,
      currentType: IrTransmitterTypeX.fromWire(m['currentType'] as String?),
      usbDevices: devices,
      autoSwitchEnabled: (m['autoSwitchEnabled'] as bool?) ?? false,
    );
  }
}

class IrTransmitterPlatform {
  IrTransmitterPlatform._();

  static const MethodChannel _ch = MethodChannel('org.nslabs/irtransmitter');
  static const EventChannel _ev = EventChannel('org.nslabs/irtransmitter_events');

  static Stream<IrTransmitterCapabilities>? _capsEvents;

  static Stream<IrTransmitterCapabilities> capabilitiesEvents() {
    _capsEvents ??= _ev
        .receiveBroadcastStream()
        .map<IrTransmitterCapabilities>((event) {
          if (event is Map) {
            final m = event.map((k, v) => MapEntry(k.toString(), v)).cast<String, dynamic>();
            return IrTransmitterCapabilities.fromMap(m);
          }
          return const IrTransmitterCapabilities(
            hasInternal: false,
            hasUsb: false,
            usbOpened: false,
            hasAudio: true,
            currentType: IrTransmitterType.internal,
            usbDevices: <UsbDeviceInfo>[],
            autoSwitchEnabled: false,
          );
        })
        .handleError((_) {})
        .asBroadcastStream();
    return _capsEvents!;
  }

  static Future<IrTransmitterType> getPreferredType() async {
    final v = await _ch.invokeMethod<String>('getPreferredTransmitterType');
    return IrTransmitterTypeX.fromWire(v);
  }

  static Future<IrTransmitterType> setPreferredType(IrTransmitterType type) async {
    final v = await _ch.invokeMethod<String>(
      'setPreferredTransmitterType',
      <String, dynamic>{'type': type.wireValue},
    );
    return IrTransmitterTypeX.fromWire(v);
  }

  static Future<IrTransmitterType> getActiveType() async {
    final v = await _ch.invokeMethod<String>('getTransmitterType');
    return IrTransmitterTypeX.fromWire(v);
  }

  static Future<IrTransmitterType> setActiveType(IrTransmitterType type) async {
    final v = await _ch.invokeMethod<String>(
      'setTransmitterType',
      <String, dynamic>{'type': type.wireValue},
    );
    return IrTransmitterTypeX.fromWire(v);
  }

  static Future<IrTransmitterCapabilities> getCapabilities() async {
    final raw = await _ch.invokeMethod('getTransmitterCapabilities');
    if (raw is Map) {
      final m = raw.map((k, v) => MapEntry(k.toString(), v));
      return IrTransmitterCapabilities.fromMap(m.cast<String, dynamic>());
    }
    return const IrTransmitterCapabilities(
      hasInternal: false,
      hasUsb: false,
      usbOpened: false,
      hasAudio: true,
      currentType: IrTransmitterType.internal,
      usbDevices: <UsbDeviceInfo>[],
      autoSwitchEnabled: false,
    );
  }

  static Future<bool> usbScanAndRequest() async {
    final v = await _ch.invokeMethod('usbScanAndRequest');
    return v == true;
  }

  static Future<bool> getAutoSwitchEnabled() async {
    final v = await _ch.invokeMethod('getAutoSwitchEnabled');
    return v == true;
  }

  static Future<bool> setAutoSwitchEnabled(bool enabled) async {
    final v = await _ch.invokeMethod('setAutoSwitchEnabled', <String, dynamic>{'enabled': enabled});
    return v == true;
  }

  static Future<bool> getOpenOnUsbAttachEnabled() async {
    final v = await _ch.invokeMethod('getOpenOnUsbAttachEnabled');
    return v == true;
  }

  static Future<bool> setOpenOnUsbAttachEnabled(bool enabled) async {
    final v = await _ch.invokeMethod('setOpenOnUsbAttachEnabled', <String, dynamic>{'enabled': enabled});
    return v == true;
  }
}
