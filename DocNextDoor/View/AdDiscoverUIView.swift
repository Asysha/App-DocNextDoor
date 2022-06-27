//
//  AdDiscoverUIView.swift
//  DocNextDoor
//
//  Created by Apprenant 91 on 17/06/2022.
//

import SwiftUI

struct AdDiscoverUIView: View {
    var ads : [Advertisement]
    
    var body: some View {
        
        ZStack {//background color
            Color("BackG").ignoresSafeArea()
            // ScrollView {
            NavigationView {
                VStack {//full view vstck
                    HStack (spacing: 25){//Hstack header
                        Text("Annonces à la une")
                            .bold()
                            .font(.title2)
                        Spacer().frame(width : 5)
                        
                        HStack{
                            NavigationLink(destination:CreationAdUIView()) {
                                Image(systemName: "pencil.circle")
                                    .resizable()
                                    .renderingMode(.template)
                                    .formatIcon()
                                
                            }.navigationBarTitleDisplayMode(.inline)
                                .buttonStyle(PlainButtonStyle())
                        }
                    }//fin Hstack header
                    addBlueLine()
                    
                    HStack {
                        
                        NavigationLink(destination:DetailedAdUIView(ad: ads[0])) {
                            VStack {
                                Text(ads[0].title)
                                    .padding(.horizontal)
                                    .formatLargeText()
                                    .foregroundColor(.black)
                                Image(ads[0].pict[0]).resizable().formatMediumImage()
                            }
                        }.navigationBarTitleDisplayMode(.inline)
                        
                    }.background(.white)
                    
                    List(ads) { ad in
                        NavigationLink(destination:DetailedAdUIView(ad: ad)) {
                            HStack{
                                AdView(ad: ad)
                            }
                        }.navigationBarTitleDisplayMode(.inline)
                    }
                }//end full view vstck
                .navigationBarHidden(true)
            }// nav link
            
            //}
        }
    }
}



// A view that shows the data for one Ad.
struct AdView: View {
    var ad: Advertisement
    
    var body: some View {
        
        /*VStack{
         HStack {
         VStack{
         Text(ad.title).padding(.horizontal).formatText()
         Image(ad.pict[0]).resizable().formatSmallImage()
         }
         
         Spacer()
         VStack {
         Text(ad.title).padding(.horizontal).formatText()
         Image(ad.pict[0]).resizable().formatSmallImage()
         }
         }
         HStack {
         Rectangle()
         .fill(Color.white)
         }
         
         
         }*/
        //HStack (spacing: 0) {
        
        VStack {
            Text(ad.title).padding(.horizontal).formatText()
            Image(ad.pict[0]).resizable().formatSmallImage()
            
        }
        Divider()
        
        
    }
    
    
}





struct AdDiscoverUIView_Previews: PreviewProvider {
    static var previews: some View {
        AdDiscoverUIView(ads: ads)
    }
}
