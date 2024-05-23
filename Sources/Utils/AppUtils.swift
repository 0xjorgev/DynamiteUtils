//
//  File.swift
//  
//
//  Created by Jorge Mendoza on 19/5/24.
//

import Foundation
public class AppUtils {
    public  static func JSONBody<T:Codable>(model: T, log:Bool) -> Data? {
        guard let jsonData = try? JSONEncoder().encode(model), let stringData = String(data: jsonData, encoding: .utf8) else {
            return nil
        }
        
        if log {
            print("OUTPUT: \(stringData)")
        }
        return jsonData
    }
    
    public static func JSONFile<T:Codable>(model:T.Type, filename:String) -> T? {
        guard let url = Bundle.main.url(forResource: filename, withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let mock = try? JSONDecoder().decode(model.self, from: data)
        else { return nil }
        
        return mock
        
    }
    
    public static func fetchValueFromBundle(with key:String) -> String {
        (Bundle.main.infoDictionary?[key] as? String)?.replacingOccurrences(of: "\\", with: "") ?? ""
    }
    
    public init(){
        
    }
}
