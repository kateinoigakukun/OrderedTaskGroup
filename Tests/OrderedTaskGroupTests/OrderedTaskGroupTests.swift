import OrderedTaskGroup
import XCTest

@available(macOS 12.0, iOS 15.0, watchOS 8.0, tvOS 15.0, *)
final class OrderedTaskGroupTests: XCTestCase {
  func testExample() async throws {
    let sources = Array(0..<10)
    let items = try await withOrderedTaskGroup(of: Int.self) { group -> [Int] in
      for i in sources {
        group.addTask {
          try await Task.sleep(nanoseconds: UInt64(10 - i) * 10_000_000)
          return i
        }
      }
      var items = [Int]()
      while let result = try await group.next() {
        items.append(result)
      }
      return items
    }
    XCTAssertEqual(items, sources)
  }
}
