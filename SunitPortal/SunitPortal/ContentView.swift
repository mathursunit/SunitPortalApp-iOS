//
//  ContentView.swift
//  SunitPortal
//
//  Created on iOS
//

import SwiftUI

private struct IdentifiableURL: Identifiable {
    let id = UUID()
    let url: URL
}

struct ContentView: View {
    @State private var urlToOpen: IdentifiableURL?
    
    var body: some View {
        ZStack {
            // Background image
            Image("Coloredlights")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ScrollView {
                VStack(spacing: 0) {
                    // Header
                    headerView
                    
                    // Portal table
                    portalTableView
                }
            }
        }
        .sheet(item: $urlToOpen) { identifiableURL in
            SafariView(url: identifiableURL.url)
        }
    }
    
    var headerView: some View {
        ZStack {
            Image("headerBgrnd")
                .resizable()
                .scaledToFill()
            
            VStack(spacing: 0) {
                Text(" ")
                    .font(.system(size: 8))
                Text("S U N I T ' S   H O M E   P O R T A L")
                    .font(.custom("Arial Black", size: 20))
                    .foregroundColor(.white)
                    .bold()
                Text(" ")
                    .font(.system(size: 8))
            }
        }
        .frame(height: 80)
    }
    
    var portalTableView: some View {
        VStack(spacing: 0) {
            // NEWS Row 1
            HStack(spacing: 0) {
                categoryCell(text: "NEWS", rowspan: 2)
                linkCell(imageName: "hindu", url: "http://www.thehindu.com/", width: 161, height: 22)
                linkCell(imageName: "toi1", url: "https://timesofindia.indiatimes.com/?loc=in", width: 177, height: 31)
                linkCell(imageName: "deccan1", url: "http://www.deccan.com/", width: 183, height: 33)
                linkCell(imageName: "nl", url: "http://www.newslaundry.com/", width: 152, height: 30)
                emptyCell()
            }
            
            // NEWS Row 2
            HStack(spacing: 0) {
                linkCell(imageName: "ht", url: "http://www.hindustantimes.com/", width: 165, height: 19)
                linkCell(imageName: "syracuse.com", url: "http://www.syracuse.com/", width: 179, height: 29)
                linkCell(imageName: "cnycentral", url: "http://www.cnycentral.com/", width: 129, height: 45)
                linkCell(imageName: "cnn1", url: "http://www.cnn.com/", width: 177, height: 43)
                emptyCell()
            }
            
            // WORK Row
            HStack(spacing: 0) {
                categoryCell(text: "WORK")
                linkCell(imageName: "azure", url: "https://portal.azure.com", width: 149, height: 48)
                linkCell(imageName: "img3", url: "http://who.is/", width: 137, height: 61)
                linkCell(imageName: "csc_logo", url: "https://my.cscglobal.com/cscportal/login.pwd", width: 95, height: 59)
                linkCell(imageName: "indianexpress", url: "http://indianexpress.com/", width: 198, height: 28)
                emptyCell()
            }
            
            // FOODIES Row 1
            HStack(spacing: 0) {
                categoryCell(text: "", rowspan: 2, imageName: "FIHR1", imageUrl: "https://www.facebook.com/groups/foodiesinhyd", imageWidth: 77, imageHeight: 119)
                linkCell(imageName: "slickdeals1", url: "http://www.slickdeals.net/", width: 172, height: 50)
                emptyCell()
                textLinkCell(text: "meesho", url: "https://www.meesho.com")
                emptyCell()
                emptyCell()
            }
            .frame(height: 58)
            
            // FOODIES Row 2
            HStack(spacing: 0) {
                linkCell(imageName: "img1E", url: "https://www.amazon.in/", width: 140, height: 42)
                linkCell(imageName: "amazon", url: "https://www.amazon.com/", width: 149, height: 42)
                textLinkCell(text: "Cloudflare", url: "https://dash.cloudflare.com/websites")
                textLinkCell(text: "Heartland", url: "https://m.heartlandcheckview.com/#/home")
                emptyCell()
            }
            .frame(height: 65)
            
            // SOCIAL Row
            HStack(spacing: 0) {
                categoryCell(text: "SOCIAL")
                linkCell(imageName: "facebook", url: "https://www.facebook.com/", width: 173, height: 55)
                linkCell(imageName: "ht_twitter_logo_jef_120321_wblog", url: "https://www.twitter.com/sunitmathur", width: 146, height: 76)
                linkCell(imageName: "whatsapp", url: "https://web.whatsapp.com/", width: 106, height: 87)
                linkCell(imageName: "img5", url: "http://www.tvguide.com/", width: nil, height: nil)
                emptyCell()
            }
            
            // EXPERIMENTS Row
            HStack(spacing: 0) {
                categoryCell(text: "Experiments", bold: true)
                linkCell(imageName: "SunSarFWW", url: "https://fwwapp.sunitmathur.com", width: 149, height: 52)
                linkCell(imageName: "tk", url: "https://tk.sunitmathur.com/", width: 52, height: 52)
                emptyCell()
                emptyCell()
                emptyCell()
            }
            
            // LEARNING Row
            HStack(spacing: 0) {
                categoryCell(text: "LEARNING")
                textLinkCell(text: "ChatGPT", url: "https://chat.openai.com")
                textLinkCell(text: "Grok", url: "https://grok.com/")
                textLinkCell(text: "Google Gemini", url: "https://gemini.google.com/")
                emptyCell()
                emptyCell()
            }
            
            // MONEY Row 1
            HStack(spacing: 0) {
                categoryCell(text: "MONEY", rowspan: 2)
                textLinkCell(text: "Rocket Money", url: nil)
                linkCell(imageName: "img20", url: "https://usa.experian.com/login/#/index", width: 169, height: 72)
                linkCell(imageName: "img22", url: "https://www.creditkarma.com/", width: 182, height: 42)
                linkCell(imageName: "xoom", url: "https://www.xoom.com/india/send-money", width: 146, height: 38)
                emptyCell()
            }
            
            // MONEY Row 2
            HStack(spacing: 0) {
                linkCell(imageName: "hdfcbank", url: "https://netbanking.hdfcbank.com/netbanking/", width: nil, height: nil)
                textLinkCell(text: "Capital One", url: "https://capitalone.com")
                linkCell(imageName: "img3_icici", url: "https://infinity.icicibank.com/corp/AuthenticationController?FORMSGROUP_ID__=AuthenticationFG&__START_TRAN_FLAG__=Y&FG_BUTTONS__=LOAD&ACTION.LOAD=Y&AuthenticationFG.LOGIN_FLAG=1&BANK_ID=ICI&_ga=1.239278659.1597483024.1470762506", width: 170, height: 63)
                emptyCell()
                emptyCell()
            }
            
            // SERVICES Row 1
            HStack(spacing: 0) {
                categoryCell(text: "SERVICES", rowspan: 2)
                textLinkCell(text: "Verizon FIOS Bill", url: "https://www.verizon.com/home/myverizon/?session=n&goto=https%3A%2F%2Fwww.verizon.com%2Fforyourhome%2Febillpay%2Fbilling%2Fpaybill")
                VStack(spacing: 0) {
                    linkCell(imageName: "2016-06-16_12-56-48", url: "https://www.tssouthernpower.com/", width: 72, height: 75)
                    Text("F4012235")
                        .font(.system(size: 12))
                        .bold()
                    Text("101257126")
                        .font(.system(size: 12))
                        .foregroundColor(Color(red: 34/255, green: 34/255, blue: 34/255))
                }
                .frame(width: 72)
                .border(Color(red: 236/255, green: 236/255, blue: 242/255), width: 1)
                linkCell(imageName: "speedtest", url: "https://fast.com", width: nil, height: nil)
                linkCell(imageName: "AIRTEL_F5_RGB_3D", url: "http://www.airtel.in/", width: 105, height: 38)
                emptyCell()
            }
            
            // SERVICES Row 2
            HStack(spacing: 0) {
                emptyCell()
                emptyCell()
                emptyCell()
                emptyCell()
                emptyCell()
            }
            
            // ENTERTAINMENT Row 1
            HStack(spacing: 0) {
                categoryCell(text: "ENTERTAINMENT", rowspan: 2)
                textLinkCell(text: "Netflix", url: "https://netflix.com")
                linkCell(imageName: "YT", url: "https://www.youtube.com/", width: 96, height: 53)
                textLinkCell(text: "NY Times Games", url: "https://www.nytimes.com/games/connections")
                linkCell(imageName: "cricinfo1", url: "http://www.cricinfo.com/", width: 144, height: 45)
                emptyCell()
            }
            
            // ENTERTAINMENT Row 2
            HStack(spacing: 0) {
                textLinkCell(text: "Amazon Prime", url: "https://primevideo.com")
                textLinkCell(text: "Hulu", url: "https://hulu.com")
                textLinkCell(text: "MAX", url: "https://max.com")
                emptyCell()
                emptyCell()
            }
            
            // EMAIL Row
            HStack(spacing: 0) {
                categoryCell(text: "EMAIL")
                linkCell(imageName: "gmaillogo1", url: "https://www.gmail.com/", width: 129, height: 51)
                linkCell(imageName: "yahoomail1", url: "https://mail.yahoo.com/", width: 185, height: 29)
                emptyCell()
                emptyCell()
                emptyCell()
            }
            
            // DIY Row
            HStack(spacing: 0) {
                categoryCell(text: "DIY")
                emptyCell()
                linkCell(imageName: "xdadev", url: "http://forum.xda-developers.com/index.php", width: 165, height: 31, colspan: 2)
                emptyCell()
                emptyCell()
            }
        }
        .background(Color.white)
        .padding(.horizontal)
    }
    
    func categoryCell(text: String, rowspan: Int = 1, imageName: String? = nil, imageUrl: String? = nil, imageWidth: CGFloat? = nil, imageHeight: CGFloat? = nil, bold: Bool = false) -> some View {
        VStack {
            if let imageName = imageName, let imageUrl = imageUrl {
                Button(action: {
                    if let url = URL(string: imageUrl) {
                        urlToOpen = IdentifiableURL(url: url)
                    }
                }) {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageWidth ?? 77, height: imageHeight ?? 119)
                }
            } else if !text.isEmpty {
                Text(text)
                    .font(bold ? .system(size: 14, weight: .bold) : .system(size: 14))
                    .foregroundColor(Color(red: 0, green: 93/255, blue: 171/255))
            }
        }
        .frame(width: 100)
        .frame(minHeight: 50)
        .border(Color(red: 236/255, green: 236/255, blue: 242/255), width: 1)
        .multilineTextAlignment(.center)
    }
    
    func linkCell(imageName: String, url: String, width: CGFloat? = nil, height: CGFloat? = nil, colspan: Int = 1) -> some View {
        Button(action: {
            if let url = URL(string: url) {
                urlToOpen = IdentifiableURL(url: url)
            }
        }) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: width, height: height)
                .frame(maxWidth: .infinity)
        }
        .frame(maxWidth: .infinity)
        .frame(minHeight: 50)
        .border(Color(red: 236/255, green: 236/255, blue: 242/255), width: 1)
    }
    
    func textLinkCell(text: String, url: String?) -> some View {
        Group {
            if let url = url {
                Button(action: {
                    if let url = URL(string: url) {
                        urlToOpen = IdentifiableURL(url: url)
                    }
                }) {
                    Text(text)
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 0, green: 77/255, blue: 165/255))
                }
            } else {
                Text(text)
                    .font(.system(size: 14))
                    .foregroundColor(Color(red: 0, green: 77/255, blue: 165/255))
            }
        }
        .frame(maxWidth: .infinity)
        .frame(minHeight: 50)
        .border(Color(red: 236/255, green: 236/255, blue: 242/255), width: 1)
    }
    
    func emptyCell() -> some View {
        Color.clear
            .frame(maxWidth: .infinity)
            .frame(minHeight: 50)
            .border(Color(red: 236/255, green: 236/255, blue: 242/255), width: 1)
    }
}

import SafariServices

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

