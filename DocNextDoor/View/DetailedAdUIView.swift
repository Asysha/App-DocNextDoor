//
//  DetailedAdUIView.swift
//  DocNextDoor
//
//  Created by Apprenant 91 on 21/06/2022.
//

import SwiftUI

struct DetailedAdUIView: View {
    var ad: Advertisement
    
    var body: some View {
        
        ZStack {//background color
            Color("BackG").ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {// vstack header
                    
                    AdDetailView(ad: ad)
                }//end vstack header
            }// end ScrollView
        }// end zstack
    }
}

// A view that shows the data for one Ad.
struct AdDetailView: View {
    var ad: Advertisement
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 16) {
            VStack(spacing: 16) {
                Group{
                    Text(ad.speciality).formatTinyOrangeText()
                    Text("\(ad.zipCode)- \(ad.town)").formatTinyGreyText()
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(Color.white , lineWidth: 1)
                            .frame(width: 350, height: 45, alignment: Alignment.top   )
                    Text(ad.title).formatText()
                    }
                    Image(ad.pict[0]).resizable().formatMediumImage()
                }
                Group{
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .stroke(Color.white , lineWidth: 1)
                            .frame(width: 350, height: 100, alignment: Alignment.top   )
                            .shadow(color: .white, radius: 5)
                        VStack{
                            Text("Contact").bold().padding(.horizontal).formatTitle()
                            Text(ad.contact.name).padding(.top, -10.0).formatText()
                            Text(ad.contact.mail).underline().padding(.top, -10.0).formatText()
                        }
                    }
                }
                Group{
                    Text("Description du poste").bold().padding(.horizontal).formatTitle()
                    Text(ad.description)
                        .padding(.horizontal)
                        .formatText()
                }
                Group{
                    Text("Avantages de la ville").bold().padding(.horizontal).formatTitle()
                    HStack(alignment: .center){
                        Image(systemName: "facemask.fill")
                            .resizable()
                            .renderingMode(.template)
                            .formatIcon()
                        Text("La patient??le est c??d??e (?? voir les modalieties ensemble : ) \(ad.patientsList ? "Oui" : "Non")").formatText()
                    }
                    
                    
                    HStack(alignment: .center){
                        Image(systemName: "house.circle")
                            .resizable()
                            .renderingMode(.template)
                            .formatIcon()
                        Text("Logement disponible pour l'installation : \(ad.accomodationProvided ? "Oui" : "Non")").formatText()
                    }
                }
                Group{
                    Button {
                        print("Pressed!")
                    } label: {
                        Text("Postuler")
                            .font(.headline)
                            .foregroundColor(.white)
                            .bold()
                            .frame(width: 150, height: 50)
                            .background(Color("Darkblue"))
                            .cornerRadius(15)
                    }
                }
            }
            
        }
    }
}


struct DetailedAdUIView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedAdUIView(ad:  Advertisement( title: "M??decin g??n??raliste ?? Plumebec (51420)", town: "Plumebec", zipCode: "51420", description: "En Morbihan Sud, la commune de Plumelec se situant ?? 20 min de Vannes,1 heure de Rennes et 1heure30 de Nantes recherche un m??decin g??n??raliste. Cette commune de 2750 habitants concilie tranquillit?? de la campagne, vitalit?? ??conomique et touristique . En effet Plumelec regroupe tous les services n??cessaire pour bien y vivre : nombreux artisans et commerces; nombreuses associations; nombreux ??quipements sportifs et culturels; un nouveau centre de secours comptant 33 pompiers volontaires ainsi qu'un p??le m??dical regroupant plusieurs professionnels de la sant?? : 1 m??decin, un p??dicure podologue, 4 infirmi??res, 3 kin??s et un orthophoniste. Hors p??le m??dical la commune compte ??galement un dentiste, un ost??opathe, un service associatif de soins et de maintien ?? domicile, un service", contact: .init(name:  "Annie lhation", mail: "monmail@gg.com"), pict: ["Plumebec"], speciality: "M??decin g??n??raliste", patientsList: true, accomodationProvided: true))
    }
}
