import XCTest

import LintingTests

var tests = [XCTestCaseEntry]()
tests += LintingTests.allTests()
XCTMain(tests)
