import Foundation

public extension String {
    
    static func generateRanomUsername(from fullname: String) -> String {
        let seperated = fullname.components(separatedBy: " ")
        guard seperated.count > 0 else {
            return fullname
        }
                
        let randomInt = Int.random(in: 100001...999999)
        let firstName = seperated[0].lowercased()
        let random = "\(randomInt)"

        return "\(firstName)_\(random)"
    }
}
