//
//  CoinListViewControllerTests.swift
//  DigitalCoinTests
//
//  Created by Fabricio Rodrigo Baixo on 1/28/21.
//

    import XCTest
    @testable import DigitalCoin

    class CoinListViewControllerTests: XCTestCase {

        override func setUpWithError() throws {
            super.setUp()
        }

        override func tearDownWithError() throws {
            super.tearDown()
        }
        
        func testInicializacaoDaClasse() {
            let view = CoinsListViewController()
            let tabela = view.coinstableView
            let principal = view.principalViewModel
            let viewModel = CoinsListViewModel()
            
            XCTAssertNotNil(tabela)
            
        }

        func testData() {
            // Cenario
            let date = Date()
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM"
            // Acao
            let month = formatter.string(from: date)
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)
            let year = calendar.component(.year, from: date)
            // Validacao
            XCTAssertEqual(29, day)
            XCTAssertEqual("January", month)
            XCTAssertEqual(2021, year)
        }

    }
