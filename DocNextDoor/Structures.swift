//
//  Structures.swift
//  DocNextDoor
//
//  Created by Apprenant 11 on 17/06/2022.
//

import Foundation

struct ColoredIcons {
    let nameIcon : String

    let nameIconColored : String

    var isColored : Bool //si True alors = icon coloré, si False alors = icon grisé
}

struct Contact {
    var name  : String

    var mail : String

    var phone : String?
}

struct Speciality {
    let nameCategory: String

    let subCategory: [String]
}

struct Advertisement {
    var title : String

    var town : String

    var zipCode : Int

    var description : String

    var benefits : String?

    var contact : String

    var icons : [String]? //nom image : logo école, vie culturelle…

    var transport : [ColoredIcons]? //avec [Bool = True]

    var zone : [ColoredIcons]? //avec [Bool =  True]

    var pict : [String] //tableau de noms image de l'annonce

    var speciality : String //Speciality.nameCategory ou Speciality.subCategory[n]
    
    var patientsList : Bool //si True alors cede la patientèle
    
    var accomodationProvided : Bool //si True alors logement compris
    
    //?? coordonnees GPS pour MapKit ??
}

struct ProfilUser {
    let isDoc : Bool //gérer le double profil commune/docteur ??

    let name : String

    var pp : String //nom image de profil

    var speciality : String?

    var description : String

    var contact : Contact

    var adsPublished : [Advertisement]?
    
    var cv : String? //nom du fichier ?? a voir au niveau implementation

    var allowContact : Bool?

    var allowNotif : Bool
        
        var adsApplied : [Advertisement]?
        
        var adsFav : [Advertisement]?
}
