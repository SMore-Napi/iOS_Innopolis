//
//  HomeCollectionViewController.swift
//  Habits
//
//  Created by Роман Солдатов on 20.04.2022.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeCollectionViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        userRequestTask = Task {
            if let users = try? await UserRequest().send() {
                self.model.usersByID = users
            }
            self.updateCollectionView()
        
            userRequestTask = nil
        }
        
        habitRequestTask = Task {
            if let habits = try? await HabitRequest().send() {
                self.model.habitsByName = habits
            }
            self.updateCollectionView()
        
            habitRequestTask = nil
        }
    }
    
    // Keep track of async tasks so they can be cancelled when appropriate
    var userRequestTask: Task<Void, Never>? = nil
    var habitRequestTask: Task<Void, Never>? = nil
    var combinedStatisticsRequestTask: Task<Void, Never>? = nil
    deinit {
        userRequestTask?.cancel()
        habitRequestTask?.cancel()
        combinedStatisticsRequestTask?.cancel()
    }
    
    var updateTimer: Timer?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
        update()
    
        updateTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats:
           true) { _ in
            self.update()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    
        updateTimer?.invalidate()
        updateTimer = nil
    }
    
    func update() {
        combinedStatisticsRequestTask?.cancel()
        combinedStatisticsRequestTask = Task {
            if let combinedStatistics = try? await
               CombinedStatisticsRequest().send() {
                self.model.userStatistics = combinedStatistics.userStatistics
                self.model.habitStatistics =
                   combinedStatistics.habitStatistics
            } else {
                self.model.userStatistics = []
                self.model.habitStatistics = []
            }
            self.updateCollectionView()
    
            combinedStatisticsRequestTask = nil
        }
    }
    
    func updateCollectionView() {
        var sectionIDs = [ViewModel.Section]()
        
        let leaderboardItems = model.habitStatistics.filter { statistic in
            return model.favoriteHabits.contains { $0.name ==
               statistic.habit.name }
        }
        .sorted { $0.habit.name < $1.habit.name }
        .reduce(into: [ViewModel.Item]()) { partial, statistic in
            // Rank the user counts from highest to lowest
            let rankedUserCounts = statistic.userCounts.sorted { $0.count >
               $1.count }
            
            let myCountIndex = rankedUserCounts.firstIndex { $0.user.id ==
               self.model.currentUser.id }
    
            // Examine the number of user counts for the statistic:
               // If 0, set the leader label to "Nobody Yet!" and leave the secondary label `nil`
               // If 1, set the leader label to the only user and count
               // Otherwise, do the following:
                   // Set the leader label to the user count at index 0
                   // Check whether the index of the current user's count exists  and is not 0
                       // If true, the user's count and ranking should be displayed in the secondary label
                       // If false, the second-place user count should be displayed
        }

    }
    
    func userRankingString(from userCount: UserCount) -> String {
        var name = userCount.user.name
        if userCount.user.id == self.model.currentUser.id {
            name = "You"
        }
        return "\(name) \(userCount.count)"
    }

    
    typealias DataSourceType =
       UICollectionViewDiffableDataSource<ViewModel.Section,
       ViewModel.Item>
    
    enum ViewModel {
        enum Section: Hashable {
            case leaderboard
            case followedUsers
        }
    
        enum Item: Hashable {
            case leaderboardHabit(name: String, leadingUserRanking:
               String?,
               secondaryUserRanking: String?)
            case followedUser(_ user: User, message: String)
    
            func hash(into hasher: inout Hasher) {
                switch self {
                case .leaderboardHabit(let name, _, _):
                    hasher.combine(name)
                case .followedUser(let User, _):
                    hasher.combine(User)
                }
            }
    
            static func ==(_ lhs: Item, _ rhs: Item) -> Bool {
                switch (lhs, rhs) {
                    case (.leaderboardHabit(let lName, _, _),
                        .leaderboardHabit(let rName, _, _)):
                        return lName == rName
                    case (.followedUser(let lUser, _),
                        .followedUser(let rUser, _)):
                        return lUser == rUser
                    default:
                        return false
                    }
            }
        }
    }
    
    struct Model {
        var usersByID = [String: User]()
        var habitsByName = [String: Habit]()
        var habitStatistics = [HabitStatistics]()
        var userStatistics = [UserStatistics]()
    
        var currentUser: User {
            return Settings.shared.currentUser
        }
    
        var users: [User] {
            return Array(usersByID.values)
        }
    
        var habits: [Habit] {
            return Array(habitsByName.values)
        }
        
        var followedUsers: [User] {
            return Array(usersByID.filter {Settings.shared.followedUserIDs.contains($0.key)}.values)
        }
    
        var favoriteHabits: [Habit] {
            return Settings.shared.favoriteHabits
        }
    
        var nonFavoriteHabits: [Habit] {
            return habits.filter { !favoriteHabits.contains($0) }
        }
    }
    
    var model = Model()
    var dataSource: DataSourceType!
}
