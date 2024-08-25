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
        Portfolio,
        MoodList,
        Svanguard,
        PADO,
        CYC
    ]
}

private let Portfolio = Project(
    id: "Portfolio",
    name: "Portfoilo Website",
    links: [
        RelatedLink(name: "Github", url: "https://github.com/ha-nabi/Portfolio"),
        RelatedLink(name: "WebSite", url: "")
        
    ],
    bannerURL: "images/kangciucircle.png",
    role: "Web(iOS) Developer",
    period: "2024.08 ~ 릴리즈",
    projectInfo: ProjectInfo(
        summary: "",
        experiences: [
            "SwifWeb을 사용하여 Swift코드만 작성해 웹페이지를 구축",
            "wasm에 대한 미약한 학습",
            "css에 대한 간접적인 학습"
        ],
        stack: [
            "SwifWeb",
            "SwiftWasm",
            "JavaScriptKit"
        ],
        team: "개인 프로젝트"
    )
)


private let MoodList = Project(
    id: "MoodList",
    name: "무드리스트",
    fullName: "오늘 하루, 당신의 무드는 어땠나요?",
    links: [
        RelatedLink(name: "Github", url: "https://github.com/ha-nabi/MoodList")
    ],
    bannerURL: "images/app/moodlistprofile.png",
    role: "iOS Developer",
    period: "2024.08 ~",
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

private let Svanguard = Project(
    id: "Svanguard",
    name: "서든뱅가드",
    fullName: "Sudden Vanguard",
    links: [
        RelatedLink(name: "Github", url: "https://github.com/Svanguard/SuddenVanguard")
    ],
    bannerURL: "images/app/Svanguard.png",
    role: "iOS Developer, iOS Leader",
    period: "2024.07 ~",
    projectInfo: ProjectInfo(
        summary: "서든어택 FPS 온라인 게임에서 불법 프로그램 사용자를 1차적으로 조회할 수 있는 검색 서비스",
        experiences: [
            "백엔드와 협업하여 서든어택 비공식 API를 활용한 유저 조회 기능 구현 및 특정 유저의 게임 내 기록과 활동 이력 실시간 검색 기능 개발",
            "Combine 프레임워크의 debounce 연산자를 활용한 디바운싱을 적용해 유저 닉네임 입력 시 과도한 API 호출 방지",
            "Tuist 도입으로 프로젝트의 각 기능을 독립적인 모듈로 분리하고 기존 빌드 시간 약 30% 개선",
            "SafariServices를 활용한 앱 내 웹 콘텐츠 표시 웹 뷰 구현",
            "MessageUI 프레임워크를 사용하여, 앱 내 메일 발송 기능 및 메일 템플릿 구현"
        ],
        stack: [
            "SwiftUI",
            "MVVM",
            "Tuist",
            "Combine"
        ],
        team: "iOS 2인, BackEnd 1인"
    )
)

private let PADO = Project(
    id: "PADO",
    name: "PADO",
    fullName: "PADO - 파도",
    links: [
        RelatedLink(name: "Github", url: "https://github.com/4T2F/PADO")
    ],
    bannerURL: "images/app/padoprofile.png",
    role: "iOS Developer, iOS Leader",
    period: "2024.01 ~ 2024.02 (8주)",
    projectInfo: ProjectInfo(
        summary: "사용자와의 일상을 공유하고, 추억 사진을 통해 서로의 피드를 꾸며주고 소통하는 소셜 미디어 서비스",
        experiences: [
            "Firebase Authentication을 통해 사용자 전화번호 인증 및 Firestore에 저장하는 기능 구현",
            "회원가입 시 전화번호와 아이디 중복 검사 로직 구현",
            "사용자 게시글을 Firebase Firestore에 저장하고 실시간으로 피드에 반영하는 기능 구현",
            "Namespace와 matchedGeometryEffect를 활용한 자연스러운 프로필 이미지 확대/축소 애니메이션 구현",
            "로그인, 회원가입, 메인 피드, 프로필, 팔로워 리스트, 스플래시 뷰 등 주요 화면의 대부분을 설계 및 구현"
        ],
        stack: [
            "SwiftUI",
            "MVVM",
            "Firebase"
        ],
        team: "iOS 5인"
    )
)

private let CYC = Project(
    id: "CYC",
    name: "CYC",
    fullName: "CheckYourCommit",
    links: [
        RelatedLink(name: "Github", url: "https://github.com/4T2F/CYC")
    ],
    bannerURL: "images/app/cycprofile.png",
    role: "iOS Developer, iOS Leader",
    period: "2023.12 ~ 2024.01 (4주)",
    projectInfo: ProjectInfo(
        summary: "1일 1커밋을 독려하기 위해 깃허브 API를 활용한 커밋 잔디 기록 확인 및 커밋 알림 서비스",
        experiences: [
            "Alamofire를 활용하여 깃허브 API와 연동한 소셜 로그인 기능을 구현",
            "깃허브 계정으로 로그인 시 해당 사용자의 커밋 기록을 가져와 앱에서 시각적으로 표시하는 기능 구현",
            "사용자 경험 향상을 위해 다크모드/라이트모드를 선택하여 AppStorage에 선택한 모드를 저장할 수 있는 기능 구현"
        ],
        stack: [
            "SwiftUI",
            "MVVM",
            "SwiftData",
            "Alamofire"
        ],
        team: "iOS 4인"
    )
)
