import Foundation

// MARK: - The Green Roof Initiative

// The Green Roof Initiative is a campaign to bring green, living roofs to cities and towns to provide natural places for people to enjoy while providing a more healthy, and sustainable living environment.

class GreenRoofInitiative {
    
    // MARK: - Properties
    
    var cities: [String] // Stores a list of cities involved in the initiative
    var greenRoofsCount: Int // Stores the current number of green roofs
    var greenRoofsTarget: Int // Stores the target goal for green roofs
    var fundsRaised: Float // Stores the amount of money raised
    var sponsorships: [String] // Stores a list of sponsors
    
    // MARK: - Initialization
    
    init() {
        cities = []
        greenRoofsCount = 0
        greenRoofsTarget = 0
        fundsRaised = 0
        sponsorships = []
    }
    
    // MARK: - Cities
    
    func addCity(city: String) {
        cities.append(city)
    }
    
    func removeCity(city: String) {
        if let index = cities.index(of: city) {
            cities.remove(at: index)
        }
    }
    
    // MARK: - Green Roofs
    
    func updateGreenRoofsCount(count: Int) {
        greenRoofsCount = count
    }
    
    func setGreenRoofTarget(target: Int) {
        greenRoofsTarget = target
    }
    
    func calculateCurrentProgress() -> Float {
        return Float(greenRoofsCount) / Float(greenRoofsTarget)
    }
    
    // MARK: - Fundraising
    
    func updateFundsRaised(amount: Float) {
        fundsRaised += amount
    }
    
    func addSponsorship(sponsor: String) {
        sponsorships.append(sponsor)
    }
    
    func removeSponsorship(sponsor: String) {
        if let index = sponsorships.index(of: sponsor) {
            sponsorships.remove(at: index)
        }
    }
    
    // MARK: - Completion
    
    func checkCompletion() -> Bool {
        return greenRoofsCount >= greenRoofsTarget
    }
}