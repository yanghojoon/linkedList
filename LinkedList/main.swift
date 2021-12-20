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
    
    init(data: Type, next: Node? = nil) {
        self.data = data
        self.next = next
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
}
