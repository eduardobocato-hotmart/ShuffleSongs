//
//  MusicInfoItem.swift
//  ShuffleSongs
//
//  Created by Eduardo Sanches Bocato on 27/09/19.
//  Copyright © 2019 Bocato. All rights reserved.
//

import Foundation

struct MusicInfoItem {
    let artworkURL: String?
    let trackName: String?
    let artistName: String
    let primaryGenreName: String
}
extension MusicInfoItem: Equatable {
    static func == (lhs: MusicInfoItem, rhs: MusicInfoItem) -> Bool {
        return lhs.artworkURL == rhs.artworkURL
            && lhs.trackName == rhs.trackName
            && lhs.artistName == rhs.artistName
            && lhs.primaryGenreName == rhs.primaryGenreName
    }
}
