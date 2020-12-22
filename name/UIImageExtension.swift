//
//  UIImageExtension.swift
//  ИнвестУчебник
//
//  Created by Павел on 22.12.2020.
//

import UIKit

extension UIImage {

    func downloadedFrom(link: String) {
        guard let url = URL(string: link) else { return }
        contentMode = .scaleAspectFill
        clipsToBounds = true
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() {
                self.image = image
            }
        }.resume()
    }

}

