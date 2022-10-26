//
//  DatePickerButton.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import SwiftUI

struct DatePickerButtonModel {
    var title: String
    var date:  Date
    
    static let example: DatePickerButtonModel =
        .init(title: "Departure", date: .now)
}

final class DatePickerStateModel: ObservableObject {
    @Published var model: DatePickerButtonModel
    @Published var showsPicker: Bool
    
    init(model: DatePickerButtonModel) {
        self.model       = model
        self.showsPicker = false
    }
}

//MARK: - View
struct DatePickerButton: View {
    
    @ObservedObject var stateModel: DatePickerStateModel
    
    var body: some View {
        ZStack {
            VStack(spacing: 18) {
                HStack {
                    Text(stateModel.model.title)
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.init(uiColor: Constants.Color.lightGrey.uiColor))
                    
                    Spacer()
                }
                .padding(.leading, 24)
                
                Button {
                    withAnimation {
                        stateModel.showsPicker.toggle()
                    }
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(.init(uiColor: Constants.Color.red.uiColor))
                            .frame(height: 50)
                            .padding([.leading, .trailing], 24)
                            .shadow(radius: 9)
                        
                        Text(stateModel.model.date.formatted(date: .numeric, time: .omitted))
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

//MARK: - Previews
struct DatePickerButton_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerButton(stateModel: .init(model: .example))
    }
}
