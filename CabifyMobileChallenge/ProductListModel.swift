class ProductListModel: NSObject {
    var product: Product!
    var numberOfItems: NSNumber!
    
    init(product: Product, numberOfItems: NSNumber) {
        self.product = product
        self.numberOfItems = numberOfItems
    }
}
