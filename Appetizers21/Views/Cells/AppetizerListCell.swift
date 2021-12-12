//
//  AppetizerListCell.swift
//  Appetizers21
//
//  Created by Simon Berner on 25.11.21.
//

import SwiftUI

struct AppetizerListCell: View {

    let appetizer: Appetizer

    var body: some View {
        HStack {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .cornerRadius(8)

            // Cons: AsyncImage does not offer any caching for already downloaded images!
            // (for loading a list of hundreds/thousands of Images, this might be not
            // the way to go)
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image
                    .resizable()
                    .modifier(ListCellImageStyle())
            } placeholder: {
                Image("food-placeholder")
                    .resizable()
                    .modifier(ListCellImageStyle())
            }


            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .foregroundColor(.secondary)
                    .fontWeight(.semibold)
            }
            .padding(.leading)
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sampleAppetizer)
    }
}
