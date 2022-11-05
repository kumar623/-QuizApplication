//
//  ProgressBar.swift
//  QuizApi
//
//  Created by Krishna on 03/11/22.
//

import SwiftUI

struct ProgressBar: View {
    var parts : CGFloat
    var screenWidth = 350.0
    
//    var  progress : CGFloat{
//        return ((parts*(screenWidth/10))/screenWidth)*100
//    }
    var body: some View {
        ZStack(alignment: .leading){
            
            Rectangle()
                .frame(maxWidth: screenWidth,maxHeight: 4)
                .foregroundColor(Color(hue: 1.0, saturation: 0.016, brightness: 0.744))
                .cornerRadius(20)
            
            
            
            Rectangle()
                .frame(maxWidth:parts,maxHeight: 4)
                .foregroundColor(Color.black)
                .cornerRadius(20)
            
            
        }
    
        
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(parts : 398)
           
       
           
    }
}
