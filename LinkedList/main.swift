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

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(data)"
        }
        
        return "\(data) ->" + String(describing: next) + " "
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
        if isEmpty == true {
            return nil
        }
        
        let data = head?.data
        head = head?.next
        
        return data
    }
    
    func peek() -> Type? {
        if isEmpty == true {
            return nil
        }
        
        let data = head?.data
        
        return data
    }
    
    mutating func clear() {
        while tail?.next != nil {
            head = nil
            head = head?.next
        }
    }
}
