//
//  TimerView.swift
//  HIITFit
//
//  Created by Nate Flanagan on 2/26/22.
//  Copyright © 2022 Ray Wenderlich. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @State private var timeRemaining = 3
    @Binding var timerDone: Bool
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        Text("\(timeRemaining)")
                .font(.system(size: 90, design: .rounded))
                .padding()
                .onReceive(timer) { _ in
                    if self.timeRemaining > 0 {
                        self.timeRemaining -= 1
                    } else {
                        timerDone = true
                    }
                }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timerDone: .constant(false))
                .previewLayout(.sizeThatFits)
    }
}
