//
//  RatingView.swift
//  Bookworm
//
//  Created by Dylan Perry on 8/9/20.
//

import SwiftUI

struct RatingView {
    @Binding var rating: Int

    var label = ""

    var maximumRating = 5

    var offImage: Image?
    var onImage = Image(systemName: "star.fill")

    var offColor = Color.gray
    var onColor = Color.yellow
}

extension RatingView {
    func image(for number: Int) -> Image {
        if number > rating {
            return offImage ?? onImage
        } else {
            return onImage
        }
    }
}

extension RatingView: View {
    var body: some View {
        HStack {
            if label.isEmpty == false {
                Text(label)
            }

            ForEach(1..<maximumRating + 1) { number in
                self.image(for: number)
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }    }
}

//struct RatingView_Previews: PreviewProvider {
//    static var previews: some View {
//        RatingView()
//    }
//}
