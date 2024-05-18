//
//  VDKComboBox.swift
//  StoreEase
//
//  Created by Alizaenal Abidin on 18/05/24.
//

import Foundation
import SwiftUI

struct VDKComboBox: NSViewRepresentable {
    var itemProducts: [Product]
    
    @Binding var text: String
    
    var onSelect: (Product) -> Void
    
    func getProductNames(from items: [Product]) -> [String] {
        return items.map { $0.name }
    }
    
    func findProduct(byName name: String) -> Product? {
            return itemProducts.first { $0.name == name }
    }
    
    func filteredProductNames(from items: [Product]) -> [String] {
        if text.isEmpty {
            return items.map { $0.name }
        }
        return items.map { $0.name }.filter { $0.lowercased().contains(text.lowercased()) }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeNSView(context: Context) -> NSComboBox {
        let comboBox = NSComboBox()
        comboBox.usesDataSource = false
        comboBox.completes = false
        comboBox.delegate = context.coordinator
        comboBox.intercellSpacing = NSSize(width: 0.0, height: 10.0) // Matches the look and feel of Big Sur onwards.
        comboBox.target = context.coordinator
        comboBox.action = #selector(Coordinator.comboBoxDidChange(_:))
        return comboBox
    }
    
    func updateNSView(_ nsView: NSComboBox, context: Context) {
        nsView.removeAllItems()
        nsView.addItems(withObjectValues: filteredProductNames(from: itemProducts))

        context.coordinator.ignoreSelectionChanges = true
        nsView.stringValue = text
        nsView.selectItem(withObjectValue: text)
        context.coordinator.ignoreSelectionChanges = false
    }
    
    class Coordinator: NSObject, NSComboBoxDelegate {
        var parent: VDKComboBox
        var ignoreSelectionChanges: Bool = false
        
        init(_ parent: VDKComboBox) {
            self.parent = parent
        }
        
        func comboBoxSelectionDidChange(_ notification: Notification) { // called 2 times every option selected
            if !ignoreSelectionChanges,
               let box: NSComboBox = notification.object as? NSComboBox,
               let newStringValue: String = box.objectValueOfSelectedItem as? String,
               let selectedItem = parent.findProduct(byName: newStringValue) {
                if parent.text != newStringValue { // Check to ensure we don't process the same selection twice
                    print("\(parent.text) - \(newStringValue)" )
                        parent.text = newStringValue
                        parent.onSelect(selectedItem)
                }
            }
        }
        
        @objc func comboBoxDidChange(_ sender: NSComboBox) {
            parent.text = sender.stringValue
        }
        
        func controlTextDidChange(_ obj: Notification) {
            if let textField = obj.object as? NSTextField {
                parent.text = textField.stringValue
            }
        }
    }
}
