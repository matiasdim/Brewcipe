//
//  DictionaryExtensions.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 13/06/22.
//

extension Dictionary where Key == Double, Value == String {
    func keyAndValueConcatenated() -> String? {
        guard let key = self.first?.key, let value = self[key] else { return nil }
        return "\(String(key)) \(value)"
    }
}
