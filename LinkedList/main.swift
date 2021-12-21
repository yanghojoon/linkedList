//
//  main.swift
//  LinkedList
//
//  Created by 양호준 on 2021/12/20.
//

import Foundation

// Node는 next의 주소값이 필요하기 때문에 구조체가 아닌 클래스로 구현
class Node<Type> {
    var data: Type
    var next: Node?
    
    init(data: Type) {
        self.data = data
    }
}

struct LinkedList<Type> {
    var head: Node<Type>?
    var tail: Node<Type>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    mutating func enqueue(_ data: Type) {
        let node = Node(data: data)
        
        if let nextNode = tail {
            nextNode.next = node
            tail = nextNode.next
        } else {
            head = node
            tail = node
        }
    }
    
    mutating func dequeue() -> Type? {
        let firstData = head?.data
        head = head?.next
        
        return firstData
    }
    
    func peek() -> Type? {
        return head?.data
    }
    
    mutating func clear() {
        head = nil
        tail = nil
    }
}
