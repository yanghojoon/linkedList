//
//  LinkedList.swift
//  LinkedList
//
//  Created by 양호준 on 2022/01/12.
//

import Foundation

class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    
    init(value: T) {
        self.value = value
    }
}

class DoublyLinkedList<T> {
    typealias Node = LinkedListNode<T>
    
    private var head: Node?
    var isEmpty: Bool {
        return head == nil
    }
    var first: Node? {
        return head
    }
    // tail을 만들었다면 last는 바로 return tail을 해주면 됨.
    var last: Node? {
        guard var node = head else { return }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last { // last가 nil이면 아예 list에 node가 없는 상황. 
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
}
