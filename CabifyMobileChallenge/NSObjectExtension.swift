//
// https://www.natashatherobot.com/nsstringfromclass-in-swift/
//

extension NSObject{
    public class var nameOfClass: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
    
    public var nameOfClass: String {
        return String(describing: type(of: self)).components(separatedBy: ".").last!
    }
}
