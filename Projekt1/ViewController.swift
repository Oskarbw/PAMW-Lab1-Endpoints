import SnapKit
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }

    private func setupView() {
        view.addSubview(buttonOne)
        view.addSubview(buttonTwo)
        view.addSubview(buttonThree)
        view.addSubview(buttonFour)
        view.addSubview(buttonFive)
        view.addSubview(label)
        self.view.backgroundColor = .white
    }

    private func setupConstraints() {
        buttonOne.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        buttonTwo.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(buttonOne.snp.bottom).offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        buttonThree.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(buttonTwo.snp.bottom).offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        buttonFour.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(buttonThree.snp.bottom).offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        buttonFive.snp.makeConstraints { make -> Void in
            make.left.equalToSuperview().offset(20)
            make.top.equalTo(buttonFour.snp.bottom).offset(50)
            make.width.equalTo(100)
            make.height.equalTo(50)
        }

        label.snp.makeConstraints { make -> Void in
            make.left.equalTo(buttonOne.snp.right).offset(20)
            make.top.equalTo(view.safeAreaLayoutGuide).offset(50)
            make.width.equalTo(230)
            make.height.equalTo(400)
        }
    }

    private let label: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.backgroundColor = .systemGray5
        label.textAlignment = .center
        return label
    }()

    private let buttonOne: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle("First Endpoint", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(buttonOneTap), for: .touchUpInside)
        return button
    }()

    private let buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle("Second Endpoint", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(buttonTwoTap), for: .touchUpInside)
        return button
    }()

    private let buttonThree: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle("Third Endpoint", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(buttonThreeTap), for: .touchUpInside)
        return button
    }()

    private let buttonFour: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle("Forth Endpoint", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(buttonFourTap), for: .touchUpInside)
        return button
    }()

    private let buttonFive: UIButton = {
        let button = UIButton(type: .system)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        button.setTitle("Fifth Endpoint", for: .normal)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemGray6
        button.addTarget(self, action: #selector(buttonFiveTap), for: .touchUpInside)
        return button
    }()

    @objc
    private func buttonOneTap() {
        async {
            await buttonOneTapAPICall()
        }
    }

    private func buttonOneTapAPICall() async {
        let urlString = "http://dataservice.accuweather.com/locations/v1/adminareas/PL?apikey=z9zVW7oF4zWeF8SfD799xTWYvQMKcSUa"
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"

        urlRequest.allHTTPHeaderFields = [
        "Host" : "dataservice.accuweather.com",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip",
        "X-Forwarded-For" : "78.11.156.86",
        "X-Forwarded-Port" : "443",
        "X-Forwarded-Proto" : "https"
        ]

        do {
            let (jsonData, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            guard let adminAreas = try? JSONDecoder().decode(AdminAreas.self, from: jsonData) else { return }
            var text = "W polsce znajduja sie rejony:"
            for adminArea in adminAreas {
                text = text + "\n" + adminArea.localizedName
            }
            DispatchQueue.main.async { [weak self] in
                self?.label.text = text
            }
        } catch { print("Cos sie nie udalo") }
    }




    @objc
    private func buttonTwoTap() {
        async {
            await buttonTwoTapAPICall()
        }
    }

    private func buttonTwoTapAPICall() async {
        let urlString = "http://dataservice.accuweather.com/locations/v1/countries/EUR?apikey=z9zVW7oF4zWeF8SfD799xTWYvQMKcSUa"
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"

        urlRequest.allHTTPHeaderFields = [
        "Host" : "dataservice.accuweather.com",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip",
        "X-Forwarded-For" : "78.11.156.86",
        "X-Forwarded-Port" : "443",
        "X-Forwarded-Proto" : "https"
        ]

        do {
            let (jsonData, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            guard let countries = try? JSONDecoder().decode(Countries.self, from: jsonData) else { return }
            var text = "W europie znajduja sie panstwa:"
            for country in countries {
                text = text + "\n" + country.localizedName
            }
            DispatchQueue.main.async { [weak self] in
                self?.label.text = text
            }
        } catch { print("Cos sie nie udalo") }
    }





    @objc
    private func buttonThreeTap() {
        async {
            await buttonThreeTapAPICall()
        }
    }

    private func buttonThreeTapAPICall() async {
        let urlString = "http://dataservice.accuweather.com/locations/v1/regions?apikey=z9zVW7oF4zWeF8SfD799xTWYvQMKcSUa"
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"

        urlRequest.allHTTPHeaderFields = [
        "Host" : "dataservice.accuweather.com",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip",
        "X-Forwarded-For" : "78.11.156.86",
        "X-Forwarded-Port" : "443",
        "X-Forwarded-Proto" : "https"
        ]

        do {
            let (jsonData, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            guard let continents = try? JSONDecoder().decode(Continents.self, from: jsonData) else { return }
            var text = "Na swiecie sa kontynenty:"
            for continent in continents {
                text = text + "\n" + continent.localizedName
            }
            DispatchQueue.main.async { [weak self] in
                self?.label.text = text
            }
        } catch { print("Cos sie nie udalo") }
    }





    @objc
    private func buttonFourTap() {
        async {
            await buttonFourTapAPICall()
        }
    }

    private func buttonFourTapAPICall() async {
        let urlString = "http://dataservice.accuweather.com/locations/v1/topcities/50?apikey=z9zVW7oF4zWeF8SfD799xTWYvQMKcSUa"
        guard let url = URL(string: urlString) else { print("dwa"); return }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"

        urlRequest.allHTTPHeaderFields = [
        "Host" : "dataservice.accuweather.com",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip",
        "X-Forwarded-For" : "78.11.156.86",
        "X-Forwarded-Port" : "443",
        "X-Forwarded-Proto" : "https"
        ]

        do {
            let (jsonData, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            guard let topCities = try? JSONDecoder().decode(TopCities.self, from: jsonData) else { print("jeden"); return }
            var text = "50 najwiekszych panstw swiata w losowej kolejnosci:"
            for topCity in topCities {
                text = text + "\n" + topCity.localizedName
            }
            DispatchQueue.main.async { [weak self] in
                self?.label.text = text
            }
        } catch { print("Cos sie nie udalo") }
    }



    

    @objc
    private func buttonFiveTap() {
        async {
            await buttonFiveTapAPICall()
        }
    }

    private func buttonFiveTapAPICall() async {
        let urlString = "http://dataservice.accuweather.com/locations/v1/cities/autocomplete?apikey=z9zVW7oF4zWeF8SfD799xTWYvQMKcSUa&q=War"
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        urlRequest.httpMethod = "GET"

        urlRequest.allHTTPHeaderFields = [
        "Host" : "dataservice.accuweather.com",
        "Accept" : "*/*",
        "Accept-Encoding" : "gzip",
        "X-Forwarded-For" : "78.11.156.86",
        "X-Forwarded-Port" : "443",
        "X-Forwarded-Proto" : "https"
        ]

        do {
            let (jsonData, response) = try await URLSession.shared.data(for: urlRequest)
            let decoder = JSONDecoder()
            guard let autocompleteCities = try? JSONDecoder().decode(AutocompleteCities.self, from: jsonData) else { return }
            var text = "Miasta zaczynajace sie na \"War\":"
            for autocompleteCity in autocompleteCities {
                text = text + "\n" + autocompleteCity.localizedName
            }
            DispatchQueue.main.async { [weak self] in
                self?.label.text = text
            }
        } catch { print("Cos sie nie udalo") }
    }

}
