//
//  NumbersTickerView.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import SwiftUI

struct NumbersTickerModel {
    var title:        String
    var buttonSize:   Double = 30
    var cornerRadius: Double = 8
}

final class NumberTickerStateModel: ObservableObject {
    @Published var model: NumbersTickerModel
    @Published var value: Int
    
    init(model: NumbersTickerModel) {
        self.model = model
        self.value = 0
    }
}

//MARK: - View
struct NumbersTickerView: View {
    
    @ObservedObject var stateModel: NumberTickerStateModel
    
    var body: some View {
        
        ZStack {
            VStack {
                HStack {
                    Text(stateModel.model.title)
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundColor(.init(uiColor: Constants.Color.lightGrey.uiColor))
                    Spacer()
                }
                .padding(.leading, 24)
                
                HStack {
                    Button {
                        stateModel.value += 1
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: stateModel.model.cornerRadius)
                                .foregroundColor(.init(uiColor: Constants.Color.background.uiColor))
                            Image(systemName: Constants.Symbol.plus.rawValue)
                                .foregroundColor(.init(uiColor: Constants.Color.red.uiColor))
                        }
                    }
                    .frame(width: stateModel.model.buttonSize, height: stateModel.model.buttonSize)
                    .shadow(color: .black.opacity(0.4), radius: 8)
                    .padding(.leading, 24)
                    
                    Spacer()
                    
                    Text("\(stateModel.value)")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(.init(uiColor: Constants.Color.darkGrey.uiColor))
                    
                    Spacer()
                    
                    Button {
                        if stateModel.value > 0 {
                            stateModel.value -= 1
                        }
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: stateModel.model.cornerRadius)
                                .foregroundColor(.init(uiColor: Constants.Color.background.uiColor))
                            Image(systemName: Constants.Symbol.minus.rawValue)
                                .foregroundColor(.init(uiColor: Constants.Color.red.uiColor))
                        }
                    }
                    .frame(width: stateModel.model.buttonSize, height: stateModel.model.buttonSize)
                    .shadow(color: .black.opacity(0.4), radius: 8)
                    .padding(.trailing, 24)
                }
            }
            
            
        }
    }
}

//MARK: - Previews
struct NumbersTickerView_Previews: PreviewProvider {
    static var previews: some View {
        NumbersTickerView(stateModel: .init(model: .init(title: "Travellers")))
    }
}
