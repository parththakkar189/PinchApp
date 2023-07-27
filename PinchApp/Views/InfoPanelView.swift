//
//  InfoPanelView.swift
//  PinchApp
//
//  Created by Parth Thakkar on 2023-06-17.
//

import SwiftUI

struct InfoPanelView: View {
    var scale: CGFloat
    var offSet: CGSize
    @State private var isInfoPanelVisible: Bool = false
    
    var body: some View {
        HStack {
            //MARK: HOTSPOT
            Image(systemName: "circle.circle")
                .symbolRenderingMode(.hierarchical)
                .resizable()
                .frame(width: 30.0,height: 30.0)
                .onLongPressGesture(minimumDuration: 1) {
                    withAnimation(.easeOut) {
                        isInfoPanelVisible.toggle()
                    }
                    
                }
            Spacer()
            //MARK: INFOPANEL
            HStack(spacing: 2) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                    Text("\(scale)")
                Spacer()
                Image(systemName: "arrow.left.and.right")
                Text("\(offSet.width)")
                Spacer()
                Image(systemName: "arrow.up.and.down")
                Text("\(offSet.height)")
            }
            .font(.footnote)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(8)
            .frame(maxWidth: 420)
            .opacity(isInfoPanelVisible ? 1 : 0)
            Spacer()
        }
    }
}

struct InfoPanelView_Previews: PreviewProvider {
    static var previews: some View {
        InfoPanelView(scale: 1, offSet: .zero)
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
