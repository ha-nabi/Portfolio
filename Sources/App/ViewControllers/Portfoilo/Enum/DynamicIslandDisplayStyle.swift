enum DynamicIslandDisplayStyle {
    case `default`
    case discord
    case mail
    case appStore
    case github
}

extension DynamicIslandDisplayStyle {
    var link: String {
        switch self {
        case .`default`:
            return "https://kangciu.notion.site/0ca06bc6a7d346e7a661d1309d1659f6?pvs=4"

        case .github:
            return "https://github.com/ha-nabi"
            
        case .discord:
            return "https://discord.com/users/393079949449494538"

        case .mail:
            return "mailto:a2849535@gmail.com"

        case .appStore:
            return "https://apps.apple.com/kr/developer/chiwoo-kang/id1764445162"
        }
    }

    var name: String {
        switch self {
        case .`default`, .appStore:
            return "강치우"

        case .mail, .github, .discord:
            return "hanabi"
        }
    }

    var subName: String {
        switch self {
        case .`default`:
            return "Notion"

        case .github:
            return "Github"

        case .discord:
            return "Discord"

        case .mail:
            return "Mail"

        case .appStore:
            return "AppStore"
        }
    }

    var srcPath: String {
        switch self {
        case .`default`:
            return "images/kangciu.jpeg"

        case .github:
            return "images/dock/github.png"

        case .discord:
            return "images/dock/discord.jpg"

        case .appStore:
            return "images/dock/appstore.png"

        case .mail:
            return "images/dock/mail.png"
        }
    }
}
