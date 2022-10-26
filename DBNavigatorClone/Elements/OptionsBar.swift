//
//  OptionsBar.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import SwiftUI

struct OptionsBarModel {
    var buttons: [GeneralButtonModel]
    
    static let examples: OptionsBarModel = .init(buttons: [
        .roundTrip, .roundTrip, .roundTrip
    ])
}

final class OptionsBarStateModel: ObservableObject {
    var model: OptionsBarModel
    
    init(model: OptionsBarModel) {
        self.model = model
    }
}

struct OptionsBar: View {
    
    @ObservedObject var stateModel: OptionsBarStateModel
    @Binding        var buttonSelected: (Bool, GeneralButtonModel)
    
    var body: some View {
        ZStack {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -24) {
                    ForEach(stateModel.model.buttons) { generalButtonModel in
                        GeneralButton(stateModel: .init(model: generalButtonModel), tapped: $buttonSelected)
                            .frame(width: 130, height: 40)
                    }
                    .padding(24)
                    .frame(height: 80)
                }
            }
        }
    }
}

struct OptionsBar_Previews: PreviewProvider {
    static var previews: some View {
        OptionsBar(stateModel: .init(model: .examples), buttonSelected: .constant((false, .oneWay)))
    }
}
