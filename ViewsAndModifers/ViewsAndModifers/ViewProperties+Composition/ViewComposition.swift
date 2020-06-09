//
//  ViewComposition.swift
//  ViewsAndModifers
//
//  Created by Dylan Perry on 6/8/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct ViewComposition {}

extension ViewComposition {
    struct CapsuleText: View {
        var text: String

        var body: some View {
            Text(text)
                .font(.largeTitle)
                .padding()
                .background(Color.blue)
                .clipShape(Capsule())
        }
    }
}


extension ViewComposition: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First")
                .foregroundColor(.white)
            CapsuleText(text: "Second")
                .foregroundColor(.yellow)
        }
    }
}

struct ViewComposition_Previews: PreviewProvider {
    static var previews: some View {
        ViewComposition()
    }
}
