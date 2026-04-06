import 'dart:async';

import 'package:flutter/services.dart';

enum IrTransmitterType {
  internal,
  usb,
  audio1Led,
  audio2Led,
}

enum UsbConnectionStatus {
  noDevice,
  permissionRequired,
  permissionDenied,
  permissionGranted,
  openFailed,
  ready,
}

extension UsbConnectionStatusX on UsbConnectionStatus {
  static UsbConnectionStatus fromWire(String? value) {
    switch ((value ?? '').toUpperCase()) {
      case 'PERMISSION_REQUIRED':
        return UsbConnectionStatus.permissionRequired;
      case 'PERMISSION_DENIED':
        return UsbConnectionStatus.permissionDenied;
      case 'PERMISSION_GRANTED':
        return UsbConnectionStatus.permissionGranted;
      case 'OPEN_FAILED':
        return UsbConnectionStatus.openFailed;
      case 'READY':
        return UsbConnectionStatus.ready;
      case 'NO_DEVICE':
      default:
        return UsbConnectionStatus.noDevice;
    }
  }
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
  final UsbConnectionStatus usbStatus;
  final String? usbStatusMessage;
  final bool hasAudio;
  final IrTransmitterType currentType;
  final List<UsbDeviceInfo> usbDevices;
  final bool autoSwitchEnabled;

  const IrTransmitterCapabilities({
    required this.hasInternal,
    required this.hasUsb,
    required this.usbOpened,
    required this.usbStatus,
    required this.usbStatusMessage,
    required this.hasAudio,
    required this.currentType,
    required this.usbDevices,
    required this.autoSwitchEnabled,
  });

  bool get usbPermissionGranted => usbDevices.any((d) => d.hasPermission);
  bool get usbReady => hasUsb && usbOpened;

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
      usbStatus: UsbConnectionStatusX.fromWire(m['usbStatus'] as String?),
      usbStatusMessage: m['usbStatusMessage'] as String?,
      hasAudio: (m['hasAudio'] as bool?) ?? true,
      currentType: IrTransmitterTypeX.fromWire(m['currentType'] as String?),
      usbDevices: devices,
      autoSwitchEnabled: (m['autoSwitchEnabled'] as bool?) ?? false,
    );
  }
}

class LearnedUsbSignal {
  final String family;
  final List<int> rawPatternUs;
  final String opaqueFrameBase64;
  final int opaqueMeta;
  final int quality;
  final int frequencyHz;

  const LearnedUsbSignal({
    required this.family,
    required this.rawPatternUs,
    required this.opaqueFrameBase64,
    required this.opaqueMeta,
    required this.quality,
    required this.frequencyHz,
  });

  factory LearnedUsbSignal.fromMap(Map<String, dynamic> m) {
    final raw = (m['rawPatternUs'] as List?) ?? const [];
    return LearnedUsbSignal(
      family: (m['family'] as String? ?? '').trim(),
      rawPatternUs: raw.map((e) => (e as num).toInt()).toList(growable: false),
      opaqueFrameBase64: (m['opaqueFrameBase64'] as String? ?? '').trim(),
      opaqueMeta: (m['opaqueMeta'] as num?)?.toInt() ?? 0,
      quality: (m['quality'] as num?)?.toInt() ?? -1,
      frequencyHz: (m['frequencyHz'] as num?)?.toInt() ?? 38000,
    );
  }

  String get rawPreview => rawPatternUs.join(' ');
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
            usbStatus: UsbConnectionStatus.noDevice,
            usbStatusMessage: null,
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
      usbStatus: UsbConnectionStatus.noDevice,
      usbStatusMessage: null,
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

  static Future<LearnedUsbSignal?> learnUsbSignal({int timeoutMs = 30000}) async {
    final raw = await _ch.invokeMethod(
      'learnUsbSignal',
      <String, dynamic>{'timeoutMs': timeoutMs},
    );
    if (raw == null) return null;
    if (raw is Map) {
      final m = raw.map((k, v) => MapEntry(k.toString(), v)).cast<String, dynamic>();
      return LearnedUsbSignal.fromMap(m);
    }
    throw PlatformException(
      code: 'BAD_LEARNED_SIGNAL',
      message: 'Unexpected learned USB signal payload',
    );
  }

  static Future<bool> cancelUsbLearning() async {
    final raw = await _ch.invokeMethod('cancelUsbLearning');
    return raw == true;
  }

  static Future<bool> replayLearnedUsbSignal({
    required String family,
    required String opaqueFrameBase64,
  }) async {
    final raw = await _ch.invokeMethod(
      'replayLearnedUsbSignal',
      <String, dynamic>{
        'family': family,
        'opaqueFrameBase64': opaqueFrameBase64,
      },
    );
    return raw == true;
  }
}
