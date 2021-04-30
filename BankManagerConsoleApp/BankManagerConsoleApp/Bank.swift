//
//  Bank.swift
//  BankManagerConsoleApp
//
//  Created by 배은서 on 2021/04/29.
//

import Foundation
final class Bank {
    private var clients: [Client] = []
    private var tellers: Teller = Teller(number: 1)
    private var totalTaskTime: Double = 0
    
    private func createClient() {
        for number in 1...Int.random(in: 10...30) {
            clients.append(Client(waitingNumber: number, taskTime: 0.7))
        }
    }
    
    private func selectMenu() -> MenuSelection? {
        print("""
        1 : 은행 개점
        2 : 종료
        입력 :
        """, terminator: " ")
        
        guard let menuNumber = readLine() else { return nil }
        
        return MenuSelection(rawValue: menuNumber)
    }
    
    private func open() {
        createClient()
        totalTaskTime = tellers.handleTask(clients)
    }
    
    private func close() {
        print("업무가 마감되었습니다. 오늘 업무를 처리한 고객은 총 \(clients.count)명이며, 총 업무시간은 \(String(format: "%.2f", totalTaskTime))초입니다.")
        
        clients.removeAll()
    }
    
    func operate() {
        var menuNumber: MenuSelection?
        
        while true {
            menuNumber = selectMenu()
            
            switch menuNumber {
            case .start:
                open()
                close()
            case .end:
                return
            default:
                print("잘못된 입력입니다.")
                continue
            }
        }
    }
}

enum MenuSelection: String {
    case start = "1"
    case end = "2"
}
