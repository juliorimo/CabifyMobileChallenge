enum GetProductsRequestManagerStatus: Int {
    case ok // 200
    case unexpectedError //500
}

class GetProductsRequestManagerResponse: RequestManagerResponse {
    var statusCode: GetProductsRequestManagerStatus
    var products: [Product]?
    
    init(statusCode: GetProductsRequestManagerStatus, products: [Product]?) {
        self.statusCode = statusCode
        self.products = products
    }
}

class GetProductsRequestManager: RequestManager {
    init() {
        let request = GetProductsRequest()
        super.init(request: request)
    }
    
    override func processResponse(_ statusCode: Int, response: JSON?, error: Error?) -> RequestManagerResponse {
     
        // Status code 
        var requestManagerStatus: GetProductsRequestManagerStatus!
        switch statusCode {
        case 200: requestManagerStatus = .ok
        case 500: requestManagerStatus = .unexpectedError
        default: requestManagerStatus = .unexpectedError
        }
        
        // Response
        var products: [Product]?
        if let response = response {
            if let productList = response["products"].array, productList.count > 0 {
                products = []
                for item in productList {
                    if let product = Product(json: item) {
                        products?.append(product)
                    }
                }
            }
        }
            
        return GetProductsRequestManagerResponse(statusCode: requestManagerStatus, products: products)
    }
}
