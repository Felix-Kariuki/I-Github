//
//  DecodJson.swift
//  IGithub
//
//  Created by Felix kariuki on 25/04/2024.
//

import Foundation

/**
 * `decodeJson` JSon decoder function that return 's generic data of type `T`
 *  - Parameters:
 *      - filename -  the `JSON` file to decode
 *      - responseType -  The return type data decoded version
 */
func decodeJson<T: Decodable>(filename name: String, responseType: T.Type) -> T? {
    if let url = Bundle.main.url(forResource: name, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            return try decoder.decode(responseType, from: data)
        }
        catch {
            print("Error decoding data: \(error.localizedDescription)")
            return nil
        }
    }
    return nil
}


/// A generic class that Converts the Json file to a  Codable

struct StaticJSONMapper {
    
    /// a function that takes in the generic parameter and converts to a Codable struct to be used
    ///  - Parameters :
    ///    - T : The generic class
    ///    - type : the type of the generic class T
    ///  - Returns : returns a generic class of type T
    static func decode<T:Decodable>(file:String,type:T.Type) throws -> T{
        guard let path = Bundle.main.path(forResource: file, ofType: "json"),
              let data = FileManager.default.contents(atPath: path) else {
            throw MappingError.failedToGetContents
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return try decoder.decode(T.self,from: data)
        
    }
    
   
}

extension StaticJSONMapper{
    enum MappingError: Error {
        case failedToGetContents
    }
}

