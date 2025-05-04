//
//  LoadingView.swift
//  Movify
//
//  Created by Gaurav Kumar on 04/05/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .tint(Color.black)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
