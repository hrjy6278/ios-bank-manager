//
//  BankManagerConsoleApp - main.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import Foundation

var numberOfTellr: UInt = 1
var isRepeat = true

enum InputErrorType: Error {
    case unknown
}

private func showBankOption() {
    print("""
            1 : 은행개점
            2 : 종료
            입력 :
            """, terminator: " ")
}

private func getInputByUser() throws -> String {
    guard let userInputText = readLine() else {
        throw InputErrorType.unknown
    }
    return userInputText
}

private func selectOfResult() {
    let inputExceptionMessage = "잘못된 입력입니다. 1과 2번중에 선택하여 입력해주세요."
    
    do {
        let userText = try getInputByUser()
        
        switch userText {
        case "1":
            let bankManager = BankManager(numberOfTeller: numberOfTellr)
            bankManager.processOfTellerTask()
        case "2":
            isRepeat = false
        default:
            print(inputExceptionMessage)
        }
    } catch {
        print(error)
    }
}

func start() {
    while isRepeat {
        showBankOption()
        selectOfResult()
    }
}

start()
