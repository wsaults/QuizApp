//
//  FlowTest.swift
//  QuizEngineTests
//
//  Created by Will Saults on 11/16/22.
//

import Foundation
import XCTest
@testable import QuizEngine

class FlowTest: XCTestCase {
    
    func test_start_withNoQuestions_doesNotRouteToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: [], router: router)
        
        sut.start()
        
        XCTAssertEqual(router.routedQuestionCount, 0)
    }
    
    func test_start_withOneQuestion_routeToQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestionCount, 1)
    }
    
    func test_start_withOneQuestion_routeToCorrectQuestion() {
        let router = RouterSpy()
        let sut = Flow(questions: ["Q1"], router: router)

        sut.start()

        XCTAssertEqual(router.routedQuestion, "Q1")
    }
    
    class RouterSpy: Router {
        var routedQuestionCount: Int = 0
        var routedQuestion: String?
        
        func routeTo(question: String) {
            routedQuestionCount += 1
            routedQuestion = question
        }
    }
}
