class ProductListViewControllerAccessory: NSObject {
    
    func composeProductList(_ products: [Product]?) -> [ProductListModel] {
        var list:[ProductListModel] = []
        
        if let products = products {
            for product in products {
                let item = ProductListModel(product: product, numberOfItems: 0)
                list.append(item)
            }
        }
                
        return list
    }
    
    func clearNumberOfItems(_ products: [ProductListModel]) {
        for product in products {
            product.numberOfItems = 0
        }
    }
    
    func calculateTotalPrice(_ products: [ProductListModel]) -> Double {
        var total: Double = 0
        for item in products {
            total += Double(item.product.price) * Double(item.numberOfItems)
        }
        return total
    }
}
