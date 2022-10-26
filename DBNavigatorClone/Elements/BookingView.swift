//
//  BookingView.swift
//  DBNavigatorClone
//
//  Created by Jonas Gamburg on 24.10.22.
//

import SwiftUI

struct BookingView: View {
    
    @Binding var optionsButtonSelected: (Bool, GeneralButtonModel)
    
    @ObservedObject private var fromStateModel: CustomTextFieldStateModel     = .init(model: .init(title: "From", placeholder: "Tap to enter...", text: ""))
    @ObservedObject private var toStateModel:   CustomTextFieldStateModel     = .init(model: .init(title: "To", placeholder: "Tap to enter...", text: ""))
    @ObservedObject private var departureModel: DatePickerStateModel          = .init(model: .init(title: "Departure", date: .now))
    @ObservedObject private var returnModel:    DatePickerStateModel          = .init(model: .init(title: "Return",    date: .now))
    @ObservedObject private var travellersTickerModel: NumberTickerStateModel = .init(model: .init(title: "Travellers"))
    @ObservedObject private var childrenTickerModel:   NumberTickerStateModel = .init(model: .init(title: "Children"))
    
    @State private var departureDate: Date = .now
    @State private var returnDate:    Date = .now
    
    var body: some View {
        ZStack {
            Color.white
            
            //MARK: Ticker options
            VStack(alignment: .leading, spacing: 40) {
                OptionsBar(stateModel: .init(model: .init(
                    buttons: [
                        .oneWay, .roundTrip, .multiple
                    ])), buttonSelected: $optionsButtonSelected)
                
                //MARK: TextFields
                VStack(spacing: 24) {
                    CustomTextField(stateModel: fromStateModel)
                    
                    CustomTextField(stateModel: toStateModel)
                }
                .padding([.leading, .trailing], 24)
                
                
                //MARK: Date pickers
                HStack {
                    DatePickerButton(stateModel: departureModel)
                    
                    DotsSeparatorView(stateModel: .init(model:.init(numberOfDots: 6)))
                        .padding(.top, 38)
                    
                    DatePickerButton(stateModel: returnModel)
                }
                
                //MARK: Number of travellers
                HStack {
                    NumbersTickerView(stateModel: travellersTickerModel)
                    NumbersTickerView(stateModel: childrenTickerModel)
                }
                
                Spacer()
                
                //MARK: Search button
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 100)
                            .foregroundColor(.init(uiColor: Constants.Color.red.uiColor))
                            .shadow(radius: 12)
                        
                        HStack {
                            Image(systemName: Constants.Symbol.magnifyingGlass.rawValue)
                            Text("Search")
                        }
                        .foregroundColor(.white)
                        .font(.system(size: 22, weight: .semibold))
                    }
                }
                .frame(height: 60)
                .padding([.leading, .trailing], 32)
            }
            .padding([.top, .bottom])
            
            VStack {
                if departureModel.showsPicker {
                    DatePicker("", selection: $departureDate)
                } else if returnModel.showsPicker {
                    DatePicker("", selection: $returnDate)
                }
            }
            .opacity(departureModel.showsPicker || returnModel.showsPicker ? 1 : 0)
            
        }
        .cornerRadius(24)
        .onChange(of: departureDate, perform: { newValue in
            departureModel.model.date = newValue
        })
        .onChange(of: returnDate, perform: { newValue in
            returnModel.model.date = newValue
        })
        .onTapGesture {
            UIApplication.shared.endEditing()
            withAnimation {
                departureModel.showsPicker = false
                returnModel.showsPicker    = false
            }
        }
    }
    
    private func departureBinding() -> Bool {
        if departureModel.showsPicker {
            return true
        } else if returnModel.showsPicker {
            return false
        }
        
        return false
    }
    
}

//MARK: - Previews
struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(optionsButtonSelected: .constant((false, .multiple)))
    }
}
