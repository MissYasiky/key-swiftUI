/*
 See LICENSE folder for this sample’s licensing information.
 */

import SwiftUI

@MainActor
class DataStore: ObservableObject {
    @Published var bankcards: [Bankcard] = []
    
    private static func bankcardFileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("key-card.data")
    }
    
    func loadBankcard() async throws {
        let task = Task<[Bankcard], Error> {
            let fileURL = try Self.bankcardFileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let bankcards = try JSONDecoder().decode([Bankcard].self, from: data)
            return bankcards
        }
        let bankcards = try await task.value
        self.bankcards = bankcards
    }
    
    func saveBankcard(bankcards: [Bankcard]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(bankcards)
            let outfile = try Self.bankcardFileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}
