//
//  StringExtensions.swift
//  Brewcipe
//
//  Created by Matías  Gil Echavarría on 13/06/22.
//

import UIKit

extension String {
    var imagefromURL: UIImage? {
        if let url = url(from: self),
           let data = data(from: url)
        {
            return image(from: data)
        }
        
        return nil
    }
    
    // MARK: - Private
    
    private func url(from stringURL: String) -> URL? {
        URL(string: stringURL)
    }
    
    private func data(from url: URL) -> Data? {
        try? Data(contentsOf: url)
    }
    
    private func image(from data: Data) -> UIImage? {
        UIImage(data: data)
    }
}
