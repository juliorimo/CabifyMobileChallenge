class Request: NSObject {
    let path: String!
    let parameters: [String: Any]
    let type: Alamofire.HTTPMethod
    let encoding: Alamofire.ParameterEncoding
    
    init(type: Alamofire.HTTPMethod = .get, path: String, withParameters: [String: Any] = [:], encoding: Alamofire.ParameterEncoding = JSONEncoding.default) {
        self.type = type
        self.path = path
        self.parameters = withParameters
        self.encoding = encoding
    }
    
    func processResponse(_ data: Data) -> [String: Any]? {
        return nil
    }
    
    override var description: String {
        return "[type]: \(type)\n[path]: \(path)\n[parameters]: \(parameters)\n[encoding]: \(encoding)"
    }
}
