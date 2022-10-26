//
//  ContentView.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import SwiftUI


//MARK: - View
struct ContentView: View {
    @ObservedObject var topSectionModel: TopSectionStateModel = .init(model: .homescreen)
    @ObservedObject var menuStateModel:  MenuStateModel       = .init(model: .init(items: MenuModel.examples))
    
    @State private var optionsButtonSelected: (Bool, GeneralButtonModel) = (false, .multiple)
    @State private var showMenu: Bool = false
    
    
    var body: some View {
        ZStack {
            
            //MARK: MenuView
            MenuView(stateModel: menuStateModel)
                .padding(.top)
            
            
            //MARK: Booking View
            ZStack {
                Color(uiColor: Constants.Color.background.uiColor)
                    .ignoresSafeArea()
                
                VStack(spacing: -70) {
                    TopSectionView(stateModel: topSectionModel)
                        .ignoresSafeArea()
                        .frame(height: UIScreen.main.bounds.size.height / 4)
                    
                    BookingView(optionsButtonSelected: $optionsButtonSelected)
                        .padding(.bottom, 100)
                        .padding([.leading, .trailing], 16)
                        
                 Spacer()
                }
            }
            .offset(x: showMenu ? 250 : 0)
            .animation(.spring(response: 0.3, dampingFraction: 1, blendDuration: 0.3), value: showMenu)
            .onChange(of: topSectionModel.settingsButtonTapped) { newValue in
                showMenu.toggle()
            }
            .onTapGesture {
                if showMenu { showMenu = false }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

//MARK: - Previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
