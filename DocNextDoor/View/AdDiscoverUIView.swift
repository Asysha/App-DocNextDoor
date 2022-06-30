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
                            NavigationLink(destination: AdsCreatV2()) {
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
                                AdView(ad: ad)
                            }
                        }.navigationBarTitleDisplayMode(.inline)
                    }
                    .onAppear { UITableView.appearance().isScrollEnabled = false }
                    .onDisappear{ UITableView.appearance().isScrollEnabled = true }
                }//end full view vstck
                .navigationBarHidden(true)
            }// nav link
            
            //}
        }
    }
}

//pour les rounded corners des petits blocks d'annonces
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

// A view that shows the data for one Ad.
struct AdView: View {
    var ad: Advertisement
    
    var body: some View {
        
        /* VStack {
         Text(ad.title).padding(.horizontal).formatText()
         Image(ad.pict[0]).resizable().formatSmallImage()
         
         }.background(Color("BackG"))
         Divider()
         
         VStack {
         Text(ad.title).padding(.horizontal).formatText()
         Image(ad.pict[0]).resizable().formatSmallImage()
         
         }.background(Color("BackG"))*/
        ZStack {
            Image(ad.pict[0]).resizable().frame(width: 180, height: 170).aspectRatio(contentMode: .fit).cornerRadius(20).overlay(
                GeometryReader { geometry in
                    ZStack {
                        Rectangle().frame(width: 200, height: 60, alignment: .topLeading)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                            .foregroundColor(Color(.white))
                        HStack {
                            Text(ad.title).font(.callout).bold().padding(5)
                        }.frame(width: 200, height: 70)
                        
                        Spacer()
                    }
                    .position(x: 100, y: 30)
                }
            )
            
        }
    }
}





struct AdDiscoverUIView_Previews: PreviewProvider {
    static var previews: some View {
        AdDiscoverUIView(ads: ads)
    }
}
