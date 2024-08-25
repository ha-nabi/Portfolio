import Foundation

struct Project: Equatable, Hashable {
    let id: String
    let name: String
    let fullName: String?
    let links: [RelatedLink]
    let bannerURL: String
    let role: String
    let period: String
    let team: RelatedLink?
    let projectInfo: ProjectInfo

    init(
        id: String,
        name: String,
        fullName: String? = nil,
        links: [RelatedLink],
        bannerURL: String,
        role: String,
        period: String,
        team: RelatedLink? = nil,
        projectInfo: ProjectInfo
    ) {
        self.id = id
        self.name = name
        self.fullName = fullName
        self.links = links
        self.bannerURL = bannerURL
        self.role = role
        self.period = period
        self.team = team
        self.projectInfo = projectInfo
    }
}

extension Project {
    static let liveValue: [Project] = [
        MoodList,
    ]
}

private let MoodList = Project(
    id: "MoodList",
    name: "무드리스트",
    fullName: "오늘 하루, 당신의 무드는 어땠나요?",
    links: [
        RelatedLink(name: "Github", url: "https://github.com/ha-nabi/MoodList")
    ],
    bannerURL: "images/app/moodlistprofile.png",
    role: "iOS Developer",
    period: "2024.07 ~",
    projectInfo: ProjectInfo(
        summary: "하루 동안 느낀 다양한 감정을 기록하고 관리할 수 있는 감정 기록 서비스",
        experiences: [
            "SwiftData를 사용해 데이터를 관리하여 앱 종료 후에도 데이터 유지",
            "Dictionary의 grouping 기능과 DateFormatter를 활용해 감정 기록 데이터를 날짜별로 그룹화하고, 사용자가 선택한 월에 따라 필터링 기능 구현",
            "다양한 애니메이션, 뷰 전환, 제스처 등을 활용해 사용자 경험 향상 (Namespace, Glassmorphism, ScrollViewReader)",
            "Color와 ImageResource 같은 SwiftUI 특화 객체를 안전하게 저장하고 복원하기 위한 커스텀 로직 구현"
        ],
        stack: [
            "SwiftUI",
            "MVVM",
            "SwiftData"
        ],
        team: "개인 프로젝트"
    )
)
