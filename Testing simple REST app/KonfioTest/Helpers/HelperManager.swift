//
//  HelperManager.swift
//  KonfioTest
//
//  Created by Jose Manuel Garcia Chavez on 12/11/21.
//

import Foundation

class HelperManager {
    
    open func saveData(items : [Item]?) {
        let name = String(describing: Item.self);
        guard let data = items else {
            UserDefaults.standard.set("", forKey: name);
            UserDefaults.standard.removeObject(forKey: name)
            UserDefaults.standard.synchronize()
            return;
        }

        do{
            let itemsData = try? JSONEncoder().encode(data)
            UserDefaults.standard.set(itemsData, forKey: name);
            UserDefaults.standard.synchronize()
        }
    }

    open func getData() -> [Item]? {
        let name = String(describing: Item.self);
        guard let data = UserDefaults.standard.value(forKey: name) as? Data else {
            return nil
        }
        do{
            let items = try? JSONDecoder().decode([Item].self, from: data)
            return items
        }
    }
}
