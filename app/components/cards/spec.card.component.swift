//
//  spec.card.component.swift
//  pokeday
//
//  Created by Ktchoumh on 6/29/23.
//

import SwiftUI;

enum SpecType {
	case WEIGHT
	case SIZE
	case CATEGORY
	case SKILLS
	
	
}

struct SpecCardComponent: View {
	
	@State var data: String = "";
	
  var body: some View {
	  
	VStack(spacing: 4) {
	  HStack(spacing: 6) {
		HStack(spacing: 0) {
			Text("W");
		}
		.padding(2.50)
		  Text("Weight")
		  .font(Font.custom("Poppins", size: 12).weight(.medium))
		  .tracking(0.60)
		  .foregroundColor(Color(red: 0, green: 0, blue: 0).opacity(0.60))
		  Spacer();
	  }.frame(width: 154)
	  VStack(spacing: 8) {
		Text("6,9 kg")
		  .font(Font.custom("Poppins", size: 18).weight(.medium))
		  .foregroundColor(Color(red: 0, green: 0, blue: 0).opacity(0.90))
	  }
	  .padding(8)
	  .frame(height: 43)
	  .cornerRadius(15)
	  .overlay(
		RoundedRectangle(cornerRadius: 15)
		  .inset(by: 0.50)
		  .stroke(
			Color(red: 0, green: 0, blue: 0).opacity(0.10), lineWidth: 0.50
		  ).frame(width: 154, height: 43)
	  )
	}.frame(width: 154, height: 63);
  }
}

struct spec_card_component_Previews: PreviewProvider {
    static var previews: some View {
        SpecCardComponent()
    }
}
