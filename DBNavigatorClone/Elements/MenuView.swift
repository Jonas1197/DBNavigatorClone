//
//  MenuView.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 26.10.22.
//

import SwiftUI

struct MenuItem: Identifiable {
    let id:     String
    let title:  String
    let symbol: Constants.Symbol
}

struct MenuModel {
    let items: [MenuItem]
    
    static let examples: [MenuItem] = [
        .init(id: "0", title: "Profile", symbol: .personFill),
        .init(id: "1", title: "Swap ticket", symbol: .arrowsSwap),
        .init(id: "2", title: "Support", symbol: .personsConnected),
        .init(id: "3", title: "General", symbol: .gear)
    ]
}

final class MenuStateModel: ObservableObject {
    @Published var model: MenuModel
    @Published var selectedMenuItem: MenuItem?
    
    init(model: MenuModel, selectedMenuItem: MenuItem? = nil) {
        self.model            = model
        self.selectedMenuItem = selectedMenuItem
    }
}

//MARK: - View
struct MenuView: View {
    
    @ObservedObject var stateModel: MenuStateModel
    
    var body: some View {
        ZStack(alignment: .leading) {
            Color(uiColor: Constants.Color.darkGrey.uiColor)
                .ignoresSafeArea()
            
            ZStack() {
                VStack(alignment: .leading, spacing: 40) {
                    
                    ForEach(stateModel.model.items) { item in
                        Button {
                            stateModel.selectedMenuItem = item
                        } label: {
                            HStack(spacing: 24) {
                                Image(systemName: item.symbol.rawValue)
                                    .frame(width: 20, height: 20)
                                Text(item.title)
                            }
                            .font(.system(size: 18))
                        }
                    }
                    
                    Spacer()
                    
                }
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white.opacity(0.8))
            }
            .padding(.leading, 24)
            .padding(.top, 24)
        }
    }
}

//MARK: - Previews
struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(stateModel: .init(model: .init(items: MenuModel.examples)))
    }
}
