import cmosquitto

public class SMosquitto {
  private let handle: OpaquePointer
  public static func initialize() {
    mosquitto_lib_init();
  }

  public static func cleanup() {
    mosquitto_lib_cleanup();
  }

  public static func version() -> SMosquittoVersion {
    return SMosquittoVersion()
  }

  public init(id: String? = nil, cleanSession: Bool = true) {
    self.handle = mosquitto_new(id, cleanSession, nil)
  }

  public func reinitialise(id: String? = nil, cleanSession: Bool = true) throws {
    try mosquitto_reinitialise(handle, id, cleanSession, nil).failable()
  }

  deinit {
    mosquitto_destroy(handle)
  }
}
