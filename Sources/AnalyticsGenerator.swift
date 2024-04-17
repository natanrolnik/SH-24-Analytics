// The Swift Programming Language
// https://docs.swift.org/swift-book
// 
// Swift Argument Parser
// https://swiftpackageindex.com/apple/swift-argument-parser/documentation

import ArgumentParser
import Foundation
import MarkCodable
import Stencil

@main
struct AnalyticsGenerator: ParsableCommand {
    @Option(name: .shortAndLong)
    var input: String

    @Option(name: .shortAndLong)
    var output: String = "GeneratedEvents.swift"

    mutating func run() throws {
        let events = try loadEvents()
        let generatedCode = try generate(using: events)

        // Write the output file to disk
        let outputPath = FileManager.default.currentDirectoryPath + "/" + output
        try generatedCode.write(
            to: URL(fileURLWithPath: outputPath),
            atomically: true,
            encoding: .utf8
        )
    }

    func loadEvents() throws -> [AnalyticEvent] {
        // Get the table file path based on the given input
        let inputPath = FileManager.default.currentDirectoryPath + "/" + input
        let eventsTable = try URL(fileURLWithPath: inputPath).loadString()

        // Decode the table into an array of AnalyticEvent
        return try MarkDecoder().decode([AnalyticEvent].self, from: eventsTable)
    }

    func generate(using events: [AnalyticEvent]) throws -> String {
        // Locate the template file
        guard let templateURL = Bundle.module
            .url(forResource: "EventsTemplate", withExtension: ".stencil") else {
            fatalError("Template file not found")
        }

        // Use Stencil to generate
        return try Environment().renderTemplate(
            string: templateURL.loadString(),
            context: ["events": events]
        )
    }
}

