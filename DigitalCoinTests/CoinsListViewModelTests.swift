//
//  CoinsListViewModelTests.swift
//  DigitalCoinTests
//
//  Created by Fabricio Rodrigo Baixo on 1/28/21.
//

import XCTest
@testable import DigitalCoin

class CoinsListViewModelTests: XCTestCase {
    private var mockCoinService:MockCoinService!
    private var list:CoinsListViewModel!
    override func setUp() {
        super.setUp()
        mockCoinService = MockCoinService()
//        sut = StorageManager(container: mockCoinService)
        list = CoinsListViewModel(client: mockCoinService)
    }
    override func tearDown() {
        list = nil
        mockCoinService = nil
        super.tearDown()
    }
    func testInjecaoDeDependenciaComportamentoDaViewModel() {
        list.loadCoin()
        XCTAssert(mockCoinService!.isFetchCoinsCalled)
    }
    func testRetornoDeErro() {
        list.loadCoin()
        XCTAssertEqual(400, mockCoinService.isError)
    }
    
}
