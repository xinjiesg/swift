// Fake Foundation module for testing bridging.

@exported import ObjectiveC
@exported import Foundation // clang module

@asmname("swift_StringToNSString")
func _convertStringToNSString(string: String) -> NSString

@asmname("swift_NSStringToString")
func _convertNSStringToString(nsstring: NSString) -> String

// NSArray bridging entry points
func _convertNSArrayToArray<T>(nsarr: NSArray) -> [T] {
  return [T]()
}

func _convertArrayToNSArray<T>(arr: [T]) -> NSArray {
  return NSArray()
}

// NSDictionary bridging entry points
func _convertDictionaryToNSDictionary<Key, Value>(
    d: Dictionary<Key, Value>
) -> NSDictionary {
  return NSDictionary()
}

func _convertNSDictionaryToDictionary<K: NSObject, V: AnyObject>(
       d: NSDictionary
     ) -> Dictionary<K, V> {
  return Dictionary<K, V>()
}

// NSSet bridging entry points
func _convertSetToNSSet<T: Hashable>(s: _Set<T>) -> NSSet {
  return NSSet()
}

func _convertNSSetToSet<T: NSObject>(s: NSSet) -> _Set<T> {
  return _Set<T>()
}

extension String : _ObjectiveCBridgeable {
  public static func _isBridgedToObjectiveC() -> Bool {
    return true
  }
  
  public static func _getObjectiveCType() -> Any.Type {
    return NSString.self
  }
  public func _bridgeToObjectiveC() -> NSString {
    return NSString()
  }
  public static func _forceBridgeFromObjectiveC(
    x: NSString,
    inout result: String?
  ) {
  }
  public static func _conditionallyBridgeFromObjectiveC(
    x: NSString,
    inout result: String?
  ) -> Bool {
    return true
  }
}

extension Int : _ObjectiveCBridgeable {
  public static func _isBridgedToObjectiveC() -> Bool {
    return true
  }
  
  public static func _getObjectiveCType() -> Any.Type {
    return NSNumber.self
  }
  public func _bridgeToObjectiveC() -> NSNumber {
    return NSNumber()
  }
  public static func _forceBridgeFromObjectiveC(
    x: NSNumber,
    inout result: Int?
  ) {
  }
  public static func _conditionallyBridgeFromObjectiveC(
    x: NSNumber,
    inout result: Int?
  ) -> Bool {
    return true
  }
}

extension Array : _ObjectiveCBridgeable {
  public static func _getObjectiveCType() -> Any.Type {
    return NSArray.self
  }
  public func _bridgeToObjectiveC() -> NSArray {
    return NSArray()
  }
  public static func _forceBridgeFromObjectiveC(
    x: NSArray,
    inout result: Array?
  ) {
  }
  public static func _conditionallyBridgeFromObjectiveC(
    x: NSArray,
    inout result: Array?
  ) -> Bool {
    return nil
  }
  public static func _isBridgedToObjectiveC() -> Bool {
    return Swift._isBridgedToObjectiveC(T.self)
  }
}

extension Dictionary : _ObjectiveCBridgeable {
  public static func _getObjectiveCType() -> Any.Type {
    return NSDictionary.self
  }
  public func _bridgeToObjectiveC() -> NSDictionary {
    return NSDictionary()
  }
  public static func _forceBridgeFromObjectiveC(
    x: NSDictionary,
  inout result: Dictionary?
  ) {
  }
  public static func _conditionallyBridgeFromObjectiveC(
    x: NSDictionary,
    inout result: Dictionary?
  ) -> Bool {
    return true
  }
  public static func _isBridgedToObjectiveC() -> Bool {
    return Swift._isBridgedToObjectiveC(T.self)
  }
}

extension NSObject : Hashable {
  public var hashValue: Int { return 0 }
}

public func == (x: NSObject, y: NSObject) -> Bool { return true }
