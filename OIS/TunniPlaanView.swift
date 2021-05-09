//
//  TunniPlaanView.swift
//  OIS
//
//  Created by Vladislav on 12.04.2021.
//

import SwiftUI
import SwiftSoup

struct TunniPlaan: Identifiable {
    var id = UUID()
    var name: String
    var teacher: String
    var time: String
    var place: String
    //var nameCode: String
    var groups: String
}

struct TunniPlaanRow: View {
    
    let darkRedColor = Color(red: 0.72, green: 0.07, blue: 0.20)

    let lightGreyColor = Color(red: 0.58, green: 0.59, blue: 0.69)
    
    var course: TunniPlaan
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(course.name)
                Text(course.teacher).font(.subheadline).foregroundColor(lightGreyColor)
                Text(course.groups).font(.subheadline).foregroundColor(lightGreyColor)
            }
            Spacer()
            VStack{
                Text(course.time).font(.headline).foregroundColor(darkRedColor)
                Text(course.place)
            }
        }
    }
}


struct TunniPlaanView: View {
    /*@State var password: String
    @State var username: String*/
    @Binding var tunnid: [String]
    @Binding var ryhmad: [String]
    @Binding var klass: [String]
    @Binding var oppejoud: [String]
    @Binding var ainekood: [String]
    @Binding var kellAine: [String]
    
    /*var tunnid: [String] = []
    var ryhmad: [String] = []
    var klass: [String] = []
    var oppejoud: [String] = []
    var ainekood: [String] = []
    var kellAine: [String] = []*/
    
    

    
    func latestValue() -> [TunniPlaan]{
        /*var latestgrades: [Course] = [Course(name: tunnid[0], teacher: oppejoud[0], grade: "B")]*/
        var latestgrades: [TunniPlaan] = []
        var i = 0
        for _ in tunnid{
            latestgrades.append(TunniPlaan(name: tunnid[i], teacher: oppejoud[i], time: kellAine[i], place: klass[i], groups: ryhmad[i]))
            i += 1
        }
        
        return latestgrades
    }
    
    //var i: int;
    var body: some View {
        if(!tunnid.isEmpty){
            List {
                Section(header: TunniplaanHeader(), footer: TunniplaanFooter()) {
                    ForEach(latestValue()) { course in
                        TunniPlaanRow(course: course)
                    }
                }
            }.listStyle(GroupedListStyle())
        } else {
            Text("Tunnid puuduvad")
        }
        /*Button(action: {ExperimentFunc().testFunc()}, label: {
            Text("Test")
        })*/
    }
}

struct TunniplaanHeader: View {
    var body: some View {
        HStack {
            //Image(systemName: "star")
            Text("Täna on ")
        }
    }
}

struct TunniplaanFooter: View {
    var body: some View {
        Text("")
    }
}

/*struct TunniPlaanView_Previews: PreviewProvider {
    @State var testtest: [String] = []
    static var previews: some View {
        TunniPlaanView(/*tunnid: $testtest, ryhmad: $testtest, klass: $testtest, oppejoud: $testtest, ainekood: $testtest, kellAine: $testtest*/)
    }
}*/
