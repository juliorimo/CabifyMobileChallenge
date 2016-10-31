class Product: NSObject {
    var code: String!
    var name: String!
    var price: NSNumber!
    
    init(code: String, name: String, price: NSNumber) {
        self.code = code
        self.name = name
        self.price = price
    }
    
    required init?(json: JSON) {
        guard
            let code = json["code"].string,
            let name = json["name"].string,
            let price = json["price"].number
            else {
                self.code = ""
                self.name = ""
                self.price = 0
                super.init()
                return nil
        }
        self.code = code
        self.name = name
        self.price = price
        super.init()
    }
}
