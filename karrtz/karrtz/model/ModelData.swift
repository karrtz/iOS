//
//  ModelData.swift
//  karrtz
//
//  Created by Alex Jenke on 20.06.22.
//

import Foundation

//var packs: [Pack] = load("PacksData.json") //funktioniert weil Pack decodable ist.
func getPacks() -> [Pack] {
    guard let data = (UserDefaults.standard.string(forKey: "packs")?.data(using: .utf8))
    else {
        return []
    }
    let packs : [Pack] = load();
    packs.forEach({
        $0.name = $0.name.replacingOccurrences(of: "bananaBread", with: "\n")
        $0.cards.forEach({
            $0.text = $0.text.replacingOccurrences(of: "bananaBread", with: "\n")
        })})
    return packs
}

private func load<T: Decodable>() -> T {
    
    
    print(UserDefaults.standard.string(forKey: "packs")!)
    
    let data: Data = (UserDefaults.standard.string(forKey: "packs")?.data(using: .utf8))!
    
    
    //UserDefaults.standard.set(nil, forKey: "packs")
    /*guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Could not find \(filename) in main bundle")
    }
    do {
        data = try (UserDefaults.standard.string(forKey: "packs")?.data(using: .utf8))!// ?? Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename) from main bundle: \n\(error)")
    }
    */
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse as \(T.self):\n\(error)")
    }
}

func save(pack: Pack) {
    var packsArray = getPacks()
    packsArray.sort()
    packsArray.removeAll(where: {$0.id == pack.id})
    packsArray.append(pack)
    packsArray.sort()
    packsArray.forEach({$0.cards.sort()})
    save("PacksData.json", packs: packsArray)
}

func save(packs : Array<Pack>) {
    save("PacksData.json", packs: packs)
}

func save(_ filename: String, packs : Array<Pack>) {
    /*guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Could not find \(filename) in main bundle")
    }*/
    var jsonString : String = "[\n"
    
    for pack in packs {
        jsonString += "\t{\n"
        jsonString += "\t\t \"name\": \"\(pack.name.replacingOccurrences(of: "\n", with: "bananaBread"))\",\n"
        //jsonString += "\t\t \"text\": \"\(pack.text)\",\n"
        jsonString += "\t\t \"id\": \(pack.id),\n"
        jsonString += "\t\t \"cards\": [\n"
        for card in pack.cards {
            jsonString += "\t\t\t{\n"
            jsonString += "\t\t\t \"id\": \(card.id),\n"
            jsonString += "\t\t\t \"text\": \"\(card.text.replacingOccurrences(of: "\n", with: "bananaBread"))\",\n"
            jsonString += "\t\t\t \"type\": \"\(card.type.rawValue)\"\n"
            jsonString += "\t\t\t},\n"
        }
        jsonString.remove(at: jsonString.lastIndex(of: ",")!)
        jsonString += "\t\t]\n"
        jsonString += "\t},\n"
    }
    jsonString.remove(at: jsonString.lastIndex(of: ",")!)
    jsonString += "]"
    //print(jsonString)
    
    UserDefaults.standard.set(jsonString, forKey: "packs")
    
    /*
    if let jasonData = jsonString.data(using: .utf8) {
        do {
            try jasonData.write(to: file)
        } catch {
            fatalError("Could not write to file \(filename)\n\(error).")
        }
    }*/
        
}
