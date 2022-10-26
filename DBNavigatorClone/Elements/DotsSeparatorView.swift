//
//  DotsSeparatorView.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import SwiftUI

struct DotsSeparatorModel {
    let numberOfDots: Int
}

final class DotsSeparatorStateModel: ObservableObject {
    var model: DotsSeparatorModel
    
    init(model: DotsSeparatorModel) {
        self.model = model
    }
}

//MARK: - View
struct DotsSeparatorView: View {
    
    @ObservedObject var stateModel: DotsSeparatorStateModel
    
    var body: some View {
        HStack {
            ForEach(0 ..< stateModel.model.numberOfDots) { _ in
                Circle()
                    .frame(height: 6)
                    .foregroundColor(.init(uiColor: Constants.Color.lightGrey.uiColor.withAlphaComponent(0.3)))
            }
        }
    }
}

//MARK: - Previews
struct DotsSeparatorView_Previews: PreviewProvider {
    static var previews: some View {
        DotsSeparatorView(stateModel: .init(model: .init(numberOfDots: 12)))
    }
}
