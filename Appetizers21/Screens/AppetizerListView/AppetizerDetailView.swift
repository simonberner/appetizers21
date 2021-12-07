//
//  AppetizerDetailView.swift
//  Appetizers21
//
//  Created by Simon Berner on 30.11.21.
//

import SwiftUI

struct AppetizerDetailView: View {

    // access the injected environment var
    @EnvironmentObject var order: Order

    let appetizer: Appetizer
    @Binding var isShowingDetail: Bool

    var body: some View {
        VStack {

            // 1st major element
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)

            // 2nd major element
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)

                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()

                HStack(spacing: 40) {
                    NutritionInfoView(name: "Calories", value: appetizer.calories)
                    NutritionInfoView(name: "Carbs", value: appetizer.carbs)
                    NutritionInfoView(name: "Protein", value: appetizer.protein)
                }

                Spacer()

                // 3rd major element
                OrderButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order", action: {
                    order.add(appetizer)
                    isShowingDetail = false
                })
                    .padding()
            }
        }
        .frame(width: 280, height: 520)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(DismissButton(isShowingDetail: $isShowingDetail), alignment: .topTrailing)
    }
}

struct NutritionInfoView: View {

    let name: String
    let value: Int

    var body: some View {
        VStack(spacing: 5) {
            Text(name)
                .bold()
                .font(.caption)
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {

    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer,
                            isShowingDetail: .constant(true))
    }
}
