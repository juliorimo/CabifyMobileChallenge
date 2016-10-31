// NSLocalizedString(key, comment: "")
func NSLocalizedString(_ key: String) -> String {
    return NSLocalizedString(key, tableName: nil, bundle: Bundle.main, value: "", comment: "")
}

// Logging only in DEBUG
#if DEBUG
    func DLog(_ message: String = "", filename: String = #file, function: String = #function, line: Int = #line) {
        NSLog("[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(message)")
    }
#else
    func DLog(_ message: String = "", filename: String = #file, function: String = #function, line: Int = #line) {
    }
#endif
// Logging Always
func ALog(_ message: String = "", filename: String = #file, function: String = #function, line: Int = #line) {
    NSLog("[\((filename as NSString).lastPathComponent):\(line)] \(function) - \(message)")
}
