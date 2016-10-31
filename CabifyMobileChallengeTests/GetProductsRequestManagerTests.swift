class GetProductsRequestManagerTests: XCTestCase {

    var sut: GetProductsRequestManager!
    
    override func setUp() {
        super.setUp()
        
        sut = GetProductsRequestManager()
    }
    
    func test_init() {
        // Arrange
        
        // Act
        
        // Assert
        XCTAssertTrue(sut.request is GetProductsRequest)
    }
    
    func test_processResponse_ok() {
        // Arrange
        
        // Act
        let response = sut.processResponse(200, response: nil, error: nil) as! GetProductsRequestManagerResponse
        
        // Assert
        XCTAssertEqual(GetProductsRequestManagerStatus.ok, response.statusCode)
        XCTAssertNil(response.products)
    }
    
    func test_processResponse_ok_withData() {
        // Arrange
        let jsonString = "{\"products\": [{\"code\": \"code\", \"name\": \"name\", \"price\": 10}]}"
        let json = JSON.parse(jsonString)
        
        // Act
        let response = sut.processResponse(200, response: json, error: nil) as! GetProductsRequestManagerResponse
        
        // Assert
        XCTAssertEqual(GetProductsRequestManagerStatus.ok, response.statusCode)
        XCTAssertEqual(1, response.products?.count)
    }
    
    func test_processResponse_unexpectedError() {
        
        // Arrange
        
        // Act
        let response = sut.processResponse(500, response: nil, error: nil) as! GetProductsRequestManagerResponse
        
        // Act
        XCTAssertEqual(GetProductsRequestManagerStatus.unexpectedError, response.statusCode)
        XCTAssertNil(response.products)
    }
    
    func test_processResponse_otherError() {
        
        // Arrange
        
        // Act
        let response = sut.processResponse(0, response: nil, error: nil) as! GetProductsRequestManagerResponse
        
        // Act
        XCTAssertEqual(GetProductsRequestManagerStatus.unexpectedError, response.statusCode)
        XCTAssertNil(response.products)
    }
}
