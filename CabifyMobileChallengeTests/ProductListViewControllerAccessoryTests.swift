class ProductListViewControllerAccessoryTests: XCTestCase {
    
    var sut: ProductListViewControllerAccessory!
    
    override func setUp() {
        super.setUp()
        
        sut = ProductListViewControllerAccessory()
    }
    
    func test_composeProductList_nil() {
        // Arrange
        
        // Act
        let result = sut.composeProductList(nil)
        
        // Assert
        XCTAssertNotNil(result)
        XCTAssertEqual(0, result.count)
    }
    
    func test_composeProductList() {
        // Arrange
        let product = Product(code: "code", name: "name", price: 123)
        let products: [Product] = [product]
        
        // Act
        let result = sut.composeProductList(products)
        
        // Assert
        XCTAssertNotNil(result)
        XCTAssertEqual(1, result.count)
        XCTAssertEqual("code", result[0].product.code)
        XCTAssertEqual("name", result[0].product.name)
        XCTAssertEqual(123, result[0].product.price)
        XCTAssertEqual(0, result[0].numberOfItems)
    }
    
    func test_clearNumberOfItems() {
        // Arrange
        let product = Product(code: "code", name: "name", price: 123)
        let productList = [ProductListModel(product: product, numberOfItems: 10)]
        
        // Act
        sut.clearNumberOfItems(productList)
        
        // Assert
        XCTAssertEqual(0, productList[0].numberOfItems)
    }
    
    func test_calculateTotalPrice() {
        // Arrange
        let product1 = Product(code: "code", name: "name", price: 10)
        let product2 = Product(code: "code", name: "name", price: 20)
        let productList = [ProductListModel(product: product1, numberOfItems: 1), ProductListModel(product: product2, numberOfItems: 1)]
        
        // Act
        let result = sut.calculateTotalPrice(productList)
        
        // Assert
        XCTAssertEqual(30, result)
    }
}
