import Web

final class PortfoiloViewController: ViewController {
    private var value: JSValue?
    @State var dateString = "00:00"
    @State var isCollapsed = false
    @State var dynamicIslandDisplay = DynamicIslandDisplayStyle.default
    @State var isFocusedPhone = false

    @DOM override var body: DOM.Content {
        Div {
            Div {
                self.introduceView()

                ForEach(Project.liveValue) { project in
                    self.projectView(project: project)
                }

                self.footerView()
            }
            .class([.Portfoilo.aboutContainer])

            Div {
                Div {
                    Div {
                        Div {
                            self.statusBar()

                            self.appContainer()

                            self.dockBar()
                        }
                        .class([.Portfoilo.deviceScreen])

                        Div().class([.Portfoilo.iPhoneCamera])

                        Div().class([.Portfoilo.iPhoneButton])

                        Div().class([.Portfoilo.iPhonePower])
                    }
                    .class(.Portfoilo.iPhone14Pro)
                }
                .class([.Portfoilo.deviceFrame, .Portfoilo.phone, .Portfoilo.device])
                .onClick {
                    self.isFocusedPhone = !self.isFocusedPhone
                }
            }
            .class([.Portfoilo.phoneContainer])
        }
        .class([.Portfoilo.rootContainer])
        Head {
            Link()
                .href("//spoqa.github.io/spoqa-han-sans/css/SpoqaHanSansNeo.css")
                .rel(.stylesheet)
                .type("text/css")
        }

        PortfoiloStyle()
        DynamicIslandStyle()
        IPhoneStyle()
        DockStyle()
        dynamicIslandActive().disabled($isCollapsed.map { !$0 })
        dynamicIslandInActive().disabled($isCollapsed)
        phoneFocusToggleStyleSheet()
    }

    override func buildUI() {
        super.buildUI()
        title = "hanabi's Portfoilo"
        metaDescription = "An iOS Developer chiwoo's Portfoilo Website"
        self.value = JSObject.global.setInterval.function!(JSClosure({ _ in
            let date = JSDate()
            let hour = String(format: "%02d", date.hours)
            let min = String(format: "%02d", date.minutes)
            self.dateString = "\(hour):\(min)"
            return .undefined
        }), 1000)
    }

    @DOM
    func introduceView() -> DOM.Content {
        Header {
            H1("안녕하세요, 저는 강치우입니다.")
                .color(.white)

            P("""
머물러 있지 않고 성장하는 iOS 개발자가 되고싶습니다.
빠르게 변화하고 새롭게 나오는 기술을  배워나가는 것을 좋아하며
그만큼 성장하는 것에 희열을 느낍니다.

긍정적인 에너지로 무엇이든 즐깁니다.
저의 이러한 에너지가 다른 사람들에게도 영향을 주는 것을 좋아합니다.🤩

""")
            .color(.init(.init("#A6A6A6")))
            .fontSize(.length(18.px))
            .lineHeight(1.45)
            .marginRight(20.px)
        }
        .display(.flex)
        .flexDirection(.column)
        .marginTop(5.percent)
    }

    @DOM
    func statusBar() -> DOM.Content {
        Div {
            P(self.$dateString)
                .color(.white)
                .fontSize(.large)
                .fontWeight(.init("500"))
                .textAlign(.right)
                .marginLeft(20.px)

            Div {
                Div {
                    Div {
                        Div {
                            Div {
                                Img()
                                    .srcSet(self.$dynamicIslandDisplay.map { $0.srcPath })
                                    .class([.Portfoilo.profileImage])
                            }
                            .class([.Portfoilo.dynamicIslandProfile])

                            Div {
                                P(self.$dynamicIslandDisplay.map { $0.subName })
                                    .fontSize(0.875.rem)
                                    .margin(all: 0)
                                    .color(.init(.init("#A6A6A6")))

                                H2(self.$dynamicIslandDisplay.map { $0.name })
                                    .marginTop(0)
                                    .color(.white)
                                    .whiteSpace(.nowrap)
                            }
                            .class([.Portfoilo.dynamicIslandName])

                            Div {
                                Img()
                                    .srcSet("images/phone.down.fill.svg")
                                    .filter(.init("invert(99%) sepia(5%) saturate(21%) hue-rotate(205deg) brightness(103%) contrast(105%)"))
                                    .verticalAlign(.middle)
                                    .custom("margin", "auto")
                            }
                            .background(.init("#FF3B30"))
                            .class([.Portfoilo.dynamicIslandIcon])

                            Div {
                                Img()
                                    .srcSet("images/phone.fill.svg")
                                    .filter(.init("invert(99%) sepia(5%) saturate(21%) hue-rotate(205deg) brightness(103%) contrast(105%)"))
                                    .verticalAlign(.middle)
                                    .custom("margin", "auto")
                            }
                            .background(.init("#34C759"))
                            .class([.Portfoilo.dynamicIslandIcon])
                            .pointerEvents(.auto)
                            .onClick {
                                JSObject.global.window.open.function!(self.dynamicIslandDisplay.link)
                            }
                        }
                        .class([.Portfoilo.dynamicIslandContent])
                    }
                    .onClick {
                        self.dynamicIslandDisplay = .default
                        self.isCollapsed = !self.isCollapsed
                        $1.stopPropagation()
                    }
                    .class([.Portfoilo.dynamicIsland])
                }
                .class([.Portfoilo.dynamicIslandHidden])
            }
            .class([.Portfoilo.dynamicIslandContainer])

            Div {
                Div {
                    Img()
                        .srcSet("images/statusBar/cellularbars.svg")
                        .filter(.init("invert(99%) sepia(5%) saturate(21%) hue-rotate(205deg) brightness(103%) contrast(105%)"))
                        .width(28.px)
                        .height(24.px)

                    Img()
                        .srcSet("images/statusBar/wifi.svg")
                        .filter(.init("invert(99%) sepia(5%) saturate(21%) hue-rotate(205deg) brightness(103%) contrast(105%)"))
                        .width(24.px)
                        .height(24.px)
                        .padding(v: 0, h: 8.px)

                    Img()
                        .srcSet("images/statusBar/battery.75.svg")
                        .filter(.init("invert(99%) sepia(5%) saturate(21%) hue-rotate(205deg) brightness(103%) contrast(105%)"))
                        .width(32.px)
                        .height(32.px)
                }
                .display(.flex)
                .alignItems(.center)
                .height(16.px)
                .transform(.scale(0.8, 0.8))
                .transformOrigin(.init("right center"))
            }
            .marginRight(-5.75.px)
            .custom("width", "fit-content")
            .display(.flex)
        }
        .class([.Portfoilo.statusBar])
        .zIndex(1)
    }

    @DOM
    func appContainer() -> DOM.Content {
        Div {
            Div {
                ForEach(appItems) { app in
                    Div {
                        Div {
                            Div()
                                .class([.Portfoilo.appIconImage])
                                .backgroundImage(app.imgPath)
                        }
                        .class([.Portfoilo.appIcon])
                        
                        Span(app.name)
                            .marginTop(6.848.px)
                            .fontSize(11.128.px)
                    }
                    .class([.Portfoilo.appItemContainer])
                    .onClick {
                        _ = JSObject.global.document.getElementById("\(app.id)").scrollIntoView()
                    }
                }
            }
            .class([.Portfoilo.appContainer])
        }
        .class([.Portfoilo.appWrapper])
    }

    @DOM
    func dockBar() -> DOM.Content {
        Div {
            Div {
                Div()
                    .width(8.px)
                    .height(8.px)
                    .borderRadius(all: 50.percent)
                    .backgroundColor(.init(.init("#ffffff80")))
            }
            .display(.flex)
            .alignItems(.center)
            .marginTop(45.px)
            .marginBottom(30.px)

            Div {
                Div().class([.Portfoilo.dockBlur])
                
                ForEach(dockItems) { dock in
                    Div {
                        Div()
                            .class([.Portfoilo.dockItemImage])
                            .backgroundImage(dock.imgPath)
                            .onClick {
                                $1.stopPropagation()
                                self.dynamicIslandDisplay = dock.dynamicIslandDisplay
                                self.isCollapsed = !self.isCollapsed
                            }
                    }
                    .class([.Portfoilo.dockItem])
                }
            }
            .class([.Portfoilo.dockContainer])
        }
        .class([.Portfoilo.dockBar])
    }

    @DOM
    func projectView(project: Project) -> DOM.Content {
        Hr()
            .margin(v: 5.percent, h: 0)

        Div {
            Div {
                Img()
                    .src(project.bannerURL)
                    .class([.Portfoilo.projectBanner])

                Div {
                    H1(project.name)
                        .color(.white)

                    if let fullName = project.fullName {
                        P("\(fullName)")
                            .color(.init(.init("#A6A6A6")))
                            .fontStyle(.italic)
                    }

                    Div {
                        ForEach(project.links) { index, link in
                            A(link.name)
                                .color(.Portfoilo.gray)
                                .href(link.url)
                                .target(.blank)
                            
                            if index != project.links.count - 1 {
                                Div()
                                    .class([.Portfoilo.textDivider])
                            }
                        }
                    }
                    .class([.Portfoilo.projectTitle])
                }
                .align(.left)
                .lineHeight(.length(5.px))
                .paddingLeft(30.px)
            }
            .class([.Portfoilo.projectHeader])
            .marginBottom(30.px)

            ProjectInfoView(project: project)
        }
        .id(Id(stringLiteral: project.id))
        .paddingTop(30.px)
    }

    @DOM
    func footerView() -> DOM.Content {
        Footer {
            P("Copyright © hanabi 2024")
                .margin(v: 10.px, h: 0)

            Div {
                P("Built in Swift using")

                A("SwifWeb")
                    .href("https://github.com/swifweb/web")
                    .marginLeft(5.px)
            }
            .class([.Portfoilo.footerItem])

            Div {
                A("Github")
                    .href("https://github.com/ha-nabi")

                Div().class([.Portfoilo.textDivider])

                A("Mail")
                    .href("mailto:a2849535@gmail.com")

                Div().class([.Portfoilo.textDivider])

                A("Discord")
                    .href("https://discord.com/users/393079949449494538")
            }
            .class([.Portfoilo.footerItem])
        }
        .class([.Portfoilo.footer])
    }
}

// MARK: - StyleSheet
extension PortfoiloViewController {
    func dynamicIslandInActive() -> Stylesheet {
        Stylesheet {
            CSSRule(Class.Portfoilo.dynamicIsland)
                .width(120.px)
                .height(35.px)
                .borderRadius(all: .length(22.px))

            CSSRule(Class.Portfoilo.dynamicIsland.hover)
                .transform(.scale(1.1, 1.1))

            CSSRule(Class.Portfoilo.dynamicIslandContent)
                .opacity(0)
        }
    }

    func dynamicIslandActive() -> Stylesheet {
        Stylesheet {
            CSSRule(Class.Portfoilo.dynamicIsland)
                .width(371.px)
                .height(84.px)
                .borderRadius(all: .length(42.px))

            CSSRule(Class.Portfoilo.dynamicIsland.hover)
                .transform(.scale(1.0, 1.0))

            CSSRule(Class.Portfoilo.dynamicIslandContent)
                .opacity(1)
        }
    }

    @DOM
    func phoneFocusToggleStyleSheet() -> DOM.Content {
        Stylesheet {
            CSSRule(Class.Portfoilo.phoneContainer)
                .height(95.vh)

            MediaRule([.screen.maxWidth(1000.px)]) {
                CSSRule(Class.Portfoilo.iPhone14Pro)
                    .pointerEvents(.auto)

                CSSRule(Class.Portfoilo.phone)
                    .cursor(.auto)
            }
        }
        .disabled(self.$isFocusedPhone.map { !$0 })

        Stylesheet {
            CSSRule(Class.Portfoilo.phoneContainer)
                .height(150.px)

            MediaRule([.screen.maxWidth(1000.px)]) {
                CSSRule(Class.Portfoilo.iPhone14Pro)
                    .pointerEvents(.none)

                CSSRule(Class.Portfoilo.phone)
                    .cursor(.pointer)
            }
        }
        .disabled(self.$isFocusedPhone)
    }
}
