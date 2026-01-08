//
//  ProvisioningAlgorithm.swift
//  nRFMeshProvision
//
//  Created by Mostafa Berg on 20/12/2017.
//

import Foundation

// ProvisioningAlgorithm represents the raw bitmask from device capabilities
// Bit 0 (0x0001): FIPS P-256 with CMAC-AES128 (Mesh 1.0)
// Bit 1 (0x0002): FIPS P-256 with HMAC-SHA256 (Mesh 1.1)
public struct ProvisioningAlgorithm: OptionSet {
    public let rawValue: UInt16

    public init(rawValue: UInt16) {
        self.rawValue = rawValue
    }

    public static let none = ProvisioningAlgorithm(rawValue: 0x0000)
    public static let fipsp256EllipticCurve = ProvisioningAlgorithm(rawValue: 0x0001)  // Mesh 1.0
    public static let fipsp256HMACSHA256 = ProvisioningAlgorithm(rawValue: 0x0002)     // Mesh 1.1

    // Check if Mesh 1.0 algorithm is supported (preferred for compatibility)
    public var supportsMesh10Algorithm: Bool {
        return self.contains(.fipsp256EllipticCurve)
    }

    // Check if Mesh 1.1 algorithm is supported
    public var supportsMesh11Algorithm: Bool {
        return self.contains(.fipsp256HMACSHA256)
    }
}
