class GetProductsRequestTests: XCTestCase {

    func test_init() {
        // Arrange
        
        // Act
        let sut = GetProductsRequest()
        
        // Assert
        XCTAssertNotNil(sut)
        XCTAssertEqual(.get, sut.type)
        XCTAssertEqual("/bins/4bwec/", sut.path)
    }
}
