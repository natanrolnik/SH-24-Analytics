// Autogenerated in SwiftHeroes 24 🐥😎
// Don't you dare to touch this file!

import Foundation

/// Started watching a talk video
struct StartedPlaybackEvent {
    let name = "StartedPlayback"
    
    let talkId: String

    var data: [String: String] {
        "talkId": talkId,
    }
}

/// Stopped watching a talk video
struct StoppedPlaybackEvent {
    let name = "StoppedPlayback"
    
    let talkId: String
    let duration: String

    var data: [String: String] {
        "talkId": talkId,
        "duration": duration,
    }
}

/// User reached the checkout page
struct ReachedCheckoutEvent {
    let name = "ReachedCheckout"
    
    let productIds: String

    var data: [String: String] {
        "productIds": productIds,
    }
}

/// User purchased tickets, yay!
struct PurchasedTicketsEvent {
    let name = "PurchasedTickets"
    
    let totalAmount: String

    var data: [String: String] {
        "totalAmount": totalAmount,
    }
}


