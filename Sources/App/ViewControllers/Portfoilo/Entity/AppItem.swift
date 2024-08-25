import Web

struct AppItem: Equatable, Hashable {
    let id: String
    let name: String
    let imgPath: String
}

let appItems: [AppItem] = [
    .init(id: "Portfolio", name: "Portfolio", imgPath: "https://avatars.githubusercontent.com/u/112779139?v=4"),
    .init(id: "MoodList", name: "무드리스트", imgPath: "images/app/moodlistprofile.png"),
    .init(id: "Svanguard", name: "서든뱅가드", imgPath: "images/app/Svanguard.png"),
    .init(id: "PADO", name: "PADO", imgPath: "images/app/padoprofile.png"),
    .init(id: "CYC", name: "CYC", imgPath: "images/app/cycprofile.png")
]

