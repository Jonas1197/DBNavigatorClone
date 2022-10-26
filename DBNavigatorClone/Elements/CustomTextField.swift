//
//  CustomTextField.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import SwiftUI

struct CustomTextFieldModel {
    var title:       String
    var placeholder: String
    var text:        String
    
    static let example: CustomTextFieldModel =
        .init(title: "From", placeholder: "Tap to enter...", text: "")
}

final class CustomTextFieldStateModel: ObservableObject {
    @Published var model: CustomTextFieldModel
    
    init(model: CustomTextFieldModel) {
        self.model = model
    }
}

//MARK: - Views
struct CustomTextField: View {
    @ObservedObject var stateModel: CustomTextFieldStateModel
    
    var body: some View {
        
        VStack(spacing: 8) {
            
            //MARK: Title
            HStack {
                Text(stateModel.model.title)
                    .font(.system(size: 12, weight: .medium))
                    .foregroundColor(.init(uiColor: Constants.Color.lightGrey.uiColor))
                Spacer()
            }
            .padding(.leading, 24)
            
            //MARK: Placeholder
            ZStack {
                HStack {
                    Text(stateModel.model.placeholder)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.init(uiColor: Constants.Color.darkGrey.uiColor))
                        .opacity(stateModel.model.text.isEmpty ? 1 : 0)
                    Spacer()
                }
                .padding(.leading, 24)
                
                //MARK: TextField
                TextField("", text: $stateModel.model.text)
                    .foregroundColor(.init(uiColor: Constants.Color.darkGrey.uiColor))
                    .opacity(stateModel.model.text.isEmpty ? 0.1 : 1)
                    .font(.system(size: 24, weight: .semibold))
                    .padding([.leading, .trailing], 24)
            }
           
            //MARK: Bottom line
            RoundedRectangle(cornerRadius: 24)
                .foregroundColor(.init(uiColor: Constants.Color.lightGrey.uiColor).opacity(0.3))
                .frame(height: 1)
                .padding([.leading, .trailing], 24)
        }
    }
}

//MARK: - Previews
struct CustomTextField_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextField(stateModel: .init(model: .example))
    }
}
