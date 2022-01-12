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
    
    // MARK: - Computed Property(LinkedList의 상태)
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
    var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1 // head만 있으면 node.next가 없기 때문에, while문이 안돌고 1 return
        
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    // MARK: - Method
    func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last { // last가 nil이면 아예 list에 node가 없는 상황.
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    func findNode(at index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { // 노드가 가지고 있는 Index를 벗어날 경우 크래쉬 발생
                    break
                }
            }
            
            return node!
        }
    }
}
