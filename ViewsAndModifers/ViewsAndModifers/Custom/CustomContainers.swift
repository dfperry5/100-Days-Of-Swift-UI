//
//  CustomContainers.swift
//  ViewsAndModifers
//
//  Created by Dylan Perry on 6/8/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct CustomContainers {
    
}

/*
 The first line – struct GridStack<Content: View>: View – uses a more advanced feature of Swift called generics, which in this case means “you can provide any kind of content you like, but whatever it is it must conform to the View protocol.” After the colon we repeat View again to say that GridStack itself also conforms to the View protocol.

 Take particular note of the let content line – that defines a closure that must be able to accept two integers and return some sort of content we can show.

 We need to complete the body property with something that combines multiple vertical and horizontal stacks to create as many cells as was requested. We don’t need to say what’s in each cell, because we can get that by calling our content closure with the appropriate row and column.
 */
extension CustomContainers {
    struct GridStack<Content: View>: View {
        let rows: Int
        let columns: Int
        let content: (Int, Int) -> Content
//To use this, we need to create a custom initializer for our GridStack struct, so we can mark the content closure as using SwiftUI’s view builders system:
        
//That is mostly just copying the parameters directly into the struct’s properties, but notice the @ViewBuilder attribute is there. You’ll also see the @escaping attribute, which allows us to store closures away to be used later on.
        
        init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
            self.rows = rows
            self.columns = columns
            self.content = content
        }
        
        
        var body: some View {
            VStack {
                ForEach(0..<rows, id: \.self) { row in
                    HStack {
                        ForEach(0..<self.columns, id: \.self) { column in
                            self.content(row, column)
                        }
                    }
                }
            }
        }
    }
}

extension CustomContainers: View {
    var body: some View {
        GridStack(rows: 4, columns: 4) { row, col in
            Image(systemName: "\(row * 4 + col).circle")
            Text("R\(row) C\(col)")
        }
    }
}

struct CustomContainers_Previews: PreviewProvider {
    static var previews: some View {
        CustomContainers()
    }
}
