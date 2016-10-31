class RequestManager: NSObject {
    let request: Request!
    let baseUrl: String = "https://api.myjson.com"
    
    // MARK: - Init
    
    init(request: Request) {
        self.request = request
    }
    
    // MARK: - Must be overwritten
    
    func processResponse(_ statusCode: Int, response: JSON?, error: Error?) -> RequestManagerResponse {
        preconditionFailure("Must Override")
    }
    
    // MARK: - Private methods
    
    fileprivate func composeUrl(_ request: Request) -> String {
        return String(format: "%@%@",baseUrl, request.path)
    }
    
    fileprivate func parseResponse(_ data: Data?) -> JSON? {
        if let data = data {
            let json = JSON(data: data)
            return json
        }
        
        return nil
    }
    
    // MARK: - Public methods
    
    func makeRequest(_ completion: ((_ response: RequestManagerResponse) -> Void)?) {
        DLog("*************** MAKE REQUEST ***************")
        DLog("[base]: \(baseUrl)")
        DLog(request.description)
        
        // Clean cache
        URLCache.shared.removeAllCachedResponses()
        
        Alamofire.request(composeUrl(request), method: request.type, parameters: request.parameters, encoding: request.encoding).response { (dataResponse) in
            
            DLog("*************** RESPONSE ***************")
            
            let status = dataResponse.response?.statusCode ?? 0
            DLog("[status]: \(status)")
            
            if let error = dataResponse.error {
                DLog("[error]: \(error.localizedDescription)")
            
                completion?(self.processResponse(status, response: nil, error: error))
            
            } else {
                
                let json = self.parseResponse(dataResponse.data)
                DLog("[json]: \(json)")
                
                completion?(self.processResponse(status, response: json, error: nil))
            }            
        }
    }
}
