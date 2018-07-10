// To parse the JSON, add this file to your project and do:
//
//   let jSONData = try? JSONDecoder().decode(JSONData.self, from: jsonData)

import Foundation

class JSONData: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [Result]
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
    
    init(status: String, copyright: String, numResults: Int, results: [Result]) {
        self.status = status
        self.copyright = copyright
        self.numResults = numResults
        self.results = results
    }
}

class Result: Codable {
    let url, adxKeywords: String
    let column: String?
    let section, byline: String
    let type: ResultType
    let title, abstract, publishedDate: String
    let source: Source
    let id, assetID, views: Int
    let desFacet, orgFacet, perFacet, geoFacet: Facet
    let media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case url
        case adxKeywords = "adx_keywords"
        case column, section, byline, type, title, abstract
        case publishedDate = "published_date"
        case source, id
        case assetID = "asset_id"
        case views
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
    }
    
    init(url: String, adxKeywords: String, column: String?, section: String, byline: String, type: ResultType, title: String, abstract: String, publishedDate: String, source: Source, id: Int, assetID: Int, views: Int, desFacet: Facet, orgFacet: Facet, perFacet: Facet, geoFacet: Facet, media: [Media]) {
        self.url = url
        self.adxKeywords = adxKeywords
        self.column = column
        self.section = section
        self.byline = byline
        self.type = type
        self.title = title
        self.abstract = abstract
        self.publishedDate = publishedDate
        self.source = source
        self.id = id
        self.assetID = assetID
        self.views = views
        self.desFacet = desFacet
        self.orgFacet = orgFacet
        self.perFacet = perFacet
        self.geoFacet = geoFacet
        self.media = media
    }
}

enum Facet: Codable {
    case string(String)
    case stringArray([String])
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([String].self) {
            self = .stringArray(x)
            return
        }
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        throw DecodingError.typeMismatch(Facet.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for Facet"))
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .stringArray(let x):
            try container.encode(x)
        }
    }
}

class Media: Codable {
    let type: MediaType
    let subtype: Subtype
    let caption, copyright: String?
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadatum]
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
    
    init(type: MediaType, subtype: Subtype, caption: String?, copyright: String?, approvedForSyndication: Int, mediaMetadata: [MediaMetadatum]) {
        self.type = type
        self.subtype = subtype
        self.caption = caption
        self.copyright = copyright
        self.approvedForSyndication = approvedForSyndication
        self.mediaMetadata = mediaMetadata
    }
}

class MediaMetadatum: Codable {
    let url: String
    let format: Format
    let height, width: Int
    
    init(url: String, format: Format, height: Int, width: Int) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }
}

enum Format: String, Codable {
    case jumbo = "Jumbo"
    case large = "Large"
    case largeThumbnail = "Large Thumbnail"
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case normal = "Normal"
    case square320 = "square320"
    case square640 = "square640"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
}

enum Subtype: String, Codable {
    case photo = "photo"
}

enum MediaType: String, Codable {
    case image = "image"
}

enum Source: String, Codable {
    case theNewYorkTimes = "The New York Times"
}

enum ResultType: String, Codable {
    case article = "Article"
    case interactive = "Interactive"
}

