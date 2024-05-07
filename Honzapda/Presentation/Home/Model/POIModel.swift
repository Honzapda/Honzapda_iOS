//
//  POIModel.swift
//  Honzapda
//
//  Created by 이재용 on 4/10/24.
//

import SwiftUI
import MapKit

class CustomAnnotation: NSObject, MKAnnotation, Identifiable {
    let id = UUID()
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: AnnotationType

    init(coordinate: CLLocationCoordinate2D, title: String, subtitle: String, type: AnnotationType) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.type = type
    }

    enum AnnotationType {
        case user, cafe, selected
    }
}
