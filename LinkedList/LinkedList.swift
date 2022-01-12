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
