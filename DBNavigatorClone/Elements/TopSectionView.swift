//
//  TopSectionView.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import SwiftUI

struct TopSectionModel {
    var title:        String
    var buttonSymbol: Constants.Symbol
    var logoImage:    Constants.Media
    
    static let homescreen: TopSectionModel =
        .init(title: "Book your next trip", buttonSymbol: .gear, logoImage: .dbahnLogo)
}

final class TopSectionStateModel: ObservableObject {
    @Published var model: TopSectionModel
    @Published var settingsButtonTapped: Bool
    
    init(model: TopSectionModel) {
        self.model                = model
        self.settingsButtonTapped = false
    }
}


//MARK: - View
struct TopSectionView: View {
    
    @ObservedObject var stateModel: TopSectionStateModel
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 32)
                .foregroundColor(Color(uiColor: Constants.Color.darkGrey.uiColor))
                .offset(y: -30)
            
            VStack {
                HStack {
                    Text(stateModel.model.title)
                        .frame(width: UIScreen.main.bounds.size.width / 2)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .font(.system(size: 28, weight: .semibold))
                    
                    HStack(spacing: 16) {
                        Spacer()
                        Image(systemName: stateModel.model.buttonSymbol.rawValue)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .onTapGesture {
                                stateModel.settingsButtonTapped.toggle()
                            }
                        
                        Image(stateModel.model.logoImage.rawValue)
                            .resizable()
                            .frame(width: 60, height: 40)
                    }
                    .padding(.bottom, 35)
                    .padding(.trailing, 24)
                    
                    Spacer()
                }
                .padding(.top, 70)
                .padding(.leading, 24)
            
                Spacer()
            }
        }
    }
}

//MARK: - Previews
struct TopSectionView_Previews: PreviewProvider {
    static var previews: some View {
        TopSectionView(stateModel: .init(model: .homescreen))
    }
}
