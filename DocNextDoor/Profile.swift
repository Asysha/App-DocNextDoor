//
//  Profile.swift
//  DocNextDoor
//
//  Created by Apprenant 11 on 22/06/2022.
//

import SwiftUI

struct Profile: View {
    @State var profilUser : ProfilUser
    var body: some View {
        ZStack { //background
            Color("BackG").ignoresSafeArea()
            VStack {
                HStack {
                    Spacer()
                    NavigationLink(destination: Settings()){ //add param profilUser
                        Image(systemName: "gearshape").foregroundColor(Color("Darkblue")).font(.system(size: 30))
                    }//fin navigation view
                }.frame(width: 380)//fin Hstack param
                HStack {
                    Image(profilUser.pp).resizable().overlay(Circle().stroke(Color("Darkblue"), lineWidth: 7)).clipShape(Circle())
                        .foregroundColor(Color("Lightblue")).frame(width: 100, height: 100).padding(3)
                    VStack {
                        Text(profilUser.name).font(.title2).bold().padding(1)
                        Text(profilUser.speciality ?? "").font(.callout).italic().bold()
                            .foregroundColor(Color("Darkblue")).padding(1)
                    }.padding(20)
                }//fin Hstack PP et nom
                Rectangle().frame(width: 400, height: 3, alignment: .center).foregroundColor(Color("Lightblue")).padding(25)
                VStack {
                    Text("Coordonnées").font(.body).bold().frame(
                        maxWidth: .infinity,
                        alignment: .leading).padding(1)
                    Text(profilUser.contact.mail).font(.footnote).italic().underline().frame(
                        maxWidth: .infinity,
                        alignment: .leading).padding(1)
                    Text(profilUser.contact.phone ?? "").font(.footnote).frame(
                        maxWidth: .infinity,
                        alignment: .leading).padding(1)
                    Text("Biographie").font(.body).bold().frame(
                        maxWidth: .infinity,
                        alignment: .leading).padding(1)
                    Text(profilUser.description).font(.footnote).frame(
                        maxWidth: .infinity,
                        alignment: .leading).padding(1)
                }.frame(width: 350)//Fin Vstcak coord + biographie
                Spacer()
            }//fin VSTACK full view
        }//fin ZStack background
    }//fin body
}//fin Profile view

struct Profile_Previews: PreviewProvider {
    static var previews: some View {
        Profile(profilUser: .init(isDoc: true, name: "Annie Hilation", pp: "Female3", speciality: "Médecin généraliste", description: "Ecole de médecine de Marseille", contact: .init(name:  "Annie lhation", mail: "monmail@gg.com", phone: "06 66 66 66 66"), allowNotif: true, adsApplied: [], adsFav: [Advertisement.init( title: "Médecin à Plumebec", town: "Plumebec", zipCode: "51420", description: "En Morbihan Sud, la commune de Plumelec se situant à 20 min de Vannes,1 heure de Rennes et 1heure30 de Nantes recherche un médecin généraliste. Cette commune de 2750 habitants concilie tranquillité de la campagne, vitalité économique et touristique . En effet Plumelec regroupe tous les services nécessaire pour bien y vivre : nombreux artisans et commerces; nombreuses associations; nombreux équipements sportifs et culturels; un nouveau centre de secours comptant 33 pompiers volontaires ainsi qu'un pôle médical regroupant plusieurs professionnels de la santé : 1 médecin, un pédicure podologue, 4 infirmières, 3 kinés et un orthophoniste. Hors pôle médical la commune compte également un dentiste, un ostéopathe, un service associatif de soins et de maintien à domicile, un service", contact: .init(name: "Mairie de PLUMELEC", mail: ""), pict: [""], speciality: "Médecin généraliste", patientsList: true, accomodationProvided: true), Advertisement.init( title: "Médecin à Tours", town: "Tours", zipCode: "XXXXX", description: "En Morbihan Sud, la commune de Plumelec se situant à 20 min de Vannes,1 heure de Rennes et 1heure30 de Nantes recherche un médecin généraliste. Cette commune de 2750 habitants concilie tranquillité de la campagne, vitalité économique et touristique . En effet Plumelec regroupe tous les services nécessaire pour bien y vivre : nombreux artisans et commerces; nombreuses associations; nombreux équipements sportifs et culturels; un nouveau centre de secours comptant 33 pompiers volontaires ainsi qu'un pôle médical regroupant plusieurs professionnels de la santé : 1 médecin, un pédicure podologue, 4 infirmières, 3 kinés et un orthophoniste. Hors pôle médical la commune compte également un dentiste, un ostéopathe, un service associatif de soins et de maintien à domicile, un service", contact: .init(name: "Mairie de PLUMELEC", mail: ""), pict: [""], speciality: "Médecin généraliste", patientsList: true, accomodationProvided: true)])).previewDevice(PreviewDevice(rawValue: "iPhone 13"))
    }
}
