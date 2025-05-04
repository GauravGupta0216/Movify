//
//  HeaderView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct HeaderView: View {
    let header: String

    var body: some View {
        Text(header)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(.black)
            .padding(.top)
    }
}
