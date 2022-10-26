//
//  GeneralButton.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import SwiftUI

struct GeneralButtonModel: Identifiable {
    var id:               String { label }
    var symbol:           Constants.Symbol
    var label:            String
    var backgroundColor:  Constants.Color
    var highlightedColor: Constants.Color
    
    static let roundTrip: GeneralButtonModel =
        .init(symbol:           .arrowsLeftRight,
              label:            "Round trip",
              backgroundColor:  .background,
              highlightedColor: .red)
    
    static let oneWay: GeneralButtonModel =
        .init(symbol:           .arrowForward,
              label:            "One-way",
              backgroundColor: .background,
              highlightedColor: .red)
    
    static let multiple: GeneralButtonModel =
        .init(symbol:           .arrowsSwap,
              label:            "Multiple",
              backgroundColor:  .background,
              highlightedColor: .red)
}

final class GeneralButtonStateModel: ObservableObject {
    var model: GeneralButtonModel
    
    init(model: GeneralButtonModel) {
        self.model = model
    }
}

//MARK: - View
struct GeneralButton: View {
    
    @ObservedObject var stateModel: GeneralButtonStateModel
    @Binding        var tapped:     (Bool, GeneralButtonModel)
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 100)
                .foregroundColor(Color(uiColor: (tapped.0 ? stateModel.model.highlightedColor : stateModel.model.backgroundColor).uiColor))
            
            HStack(spacing: 14) {
                Image(systemName: stateModel.model.symbol.rawValue)
                Text(stateModel.model.label)
            }
            .padding(8)
            .font(.system(size: 12))
            .foregroundColor(tapped.0 ? .white : Color(uiColor: stateModel.model.highlightedColor.uiColor))
        }
        .shadow(color: .black.opacity(0.2), radius: 9, x: 0, y: 3)
        .onTapGesture {
            withAnimation(.easeOut(duration: 0.2)) {
                tapped.0.toggle()
            }
            
            tapped.1 = stateModel.model
        }
    }
}

//MARK: - Previews
struct GeneralButton_Previews: PreviewProvider {
    static var previews: some View {
        GeneralButton(stateModel: .init(model: .roundTrip), tapped: .constant((false, .oneWay)))
    }
}
