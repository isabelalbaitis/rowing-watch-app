//
//  LeaderboardType.swift
//  FitDataProtocol
//
//  Created by Kevin Hoogheem on 9/8/18.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// FIT Leaderboard Type
public enum LeaderboardType: UInt8 {
    /// Overall
    case overall            = 0
    /// Personal Best
    case personalBest       = 1
    /// Connections
    case connections        = 2
    /// Group
    case group              = 3
    /// Challenger
    case challenger         = 4
    /// King of the Mountain (KOM)
    case kom                = 5
    /// Queen of the Mountain (QOM)
    case qom                = 6
    /// Personal Record (PR)
    case personalRecord     = 7
    /// Goal
    case goal               = 8
    /// Rival
    case rival              = 9
    /// Club Leader
    case clubLeader         = 10

    /// Invalid
    case invalid            = 255
}

// MARK: - FitFieldCodeable
extension LeaderboardType: FitFieldCodeable {
    
    /// Encode Into Data
    /// - Parameter base: BaseTypeData
    public func encode(base: BaseTypeData) -> Data? {
        Data(from: self.rawValue.littleEndian)
    }
    
    /// Decode FIT Field
    ///
    /// - Parameters:
    ///   - type: Type of Field
    ///   - data: Data to Decode
    ///   - base: BaseTypeData
    ///   - arch: Endian
    /// - Returns: Decoded Value
    public static func decode<T>(type: T.Type, data: Data, base: BaseTypeData, arch: Endian) -> T? {
        if let value = base.type.decode(type: UInt8.self, data: data, resolution: base.resolution, arch: arch) {
            return LeaderboardType(rawValue: value) as? T
        }
        
        return nil
    }
}
