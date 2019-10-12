//
//  PlaceModel.swift
//  FoursquareClone
//
//  Created by Hamit  Tırpan on 12.10.2019.
//  Copyright © 2019 Hamit  Tırpan. All rights reserved.
//

import Foundation
import UIKit

/* Singleton pattern kullanarak ben bir viewController'dan diğerine verilerimi gönderiyorum. Normalde bunu 3 yolla yapabilirim;
 
    1. PerformSegue ile diğer VC'ye ulaşıp oradaki label'lara ilk VC'mde bulunan textfield alanlarımın .text'lerini atarım.
 
    2. Global Variables tanımlayarak, ilk VC'mde bulunan tüm değişkenleri istediğim VC'den ulaşabilirim. Fakat, bu hiç güvenli olmayan bir yoldur. Özellikle büyük ve birden fazla developer ile çalışılan projelerde bu çok sorun yaratacaktır !
 
    3. Singleton Pattern sayesinde, class içinde yalnızca 1 tane obje olacak. class içinde oluşturduğum sharedInstance sayesinde, kim kullanırsa kullansın istenilen yerden çağrılan bu instance sadece benim objemin değerlerini almak zorunda 
 */


class PlaceModel{
    
    static let sharedInstance = PlaceModel()
    
    var placeName = ""
    var placeType = ""
    var placeDescription = ""
    var placeImage = UIImage()
    
    // Başka hiç bir yerden initilaze işlemi yapılamaz.
    private init(){}
}
