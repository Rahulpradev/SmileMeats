//
//  SMToastView.swift
//  SmileMeats
//
//  Created by RAHUL PRADEV on 29/04/22.
//

import Foundation
import SwiftUI


// ToastModifier which shows snackbar/toast
struct SMToastViewModifier: ViewModifier {
    
    @Binding var isShowing: Bool
    
    var duration: TimeInterval
    
    func body(content: Content) -> some View {
        content
        if isShowing {
            toast
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                        withAnimation {
                            isShowing = false
                        }
                    }
                }
        }
    }
}

private var toast: some View {
    //imagename and text should be given as parameters
    ZStack {
        HStack {
            Image(systemName: "heart.fill")
            Text("Saved successfully")
                .multilineTextAlignment(.leading)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(5)
        .shadow(radius: 5)
    }
    .padding(20)
}

extension View {
    
    //TODO: Acion needs to be added(on tap dismiss)
    func toast(isShowing: Binding<Bool>, duration: TimeInterval = 3, ontap: () -> ()) -> some View {
        modifier(SMToastViewModifier(isShowing: isShowing, duration: duration))
    }
}
