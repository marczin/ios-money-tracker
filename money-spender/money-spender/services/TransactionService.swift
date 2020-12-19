//
//  TransactionService.swift
//  money-spender
//
//  Created by Marcin Rosół on 19/12/2020.
//

import UIKit

protocol TransactionServiceProtocol {
    func getData() -> [Transaction]
}

class TransactionService: TransactionServiceProtocol {
    
    
    func getData() -> [Transaction] {
        guard let apiUrlString = Bundle.main.infoDictionary?["ApiServerAdress"] as? String else {
                    fatalError("Missing API_URL setting")
                }
        let url = URL(string: apiUrlString)!
        var fetchedData: [Transaction]?
        
        URLSession.shared.dataTask(with: url, completionHandler: { data, result, error in
            guard let data = data, error == nil else {
                print("somethng went wrong")
                return
            }
            var result: [Transaction]?
            
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategyFormatters = [ DateFormatter.standardT,
                                                       DateFormatter.standard,
                                                       DateFormatter.yearMonthDay ]
            
            do{
                result = try decoder.decode(Array<Transaction>.self, from: data)
            }
            catch{
                print ("error -> \(error)")
            }
            
            guard let json = result else {
                return
            }
            fetchedData = json
        }).resume()
        
        guard let unwrapedData = fetchedData else { return [] }
        return unwrapedData
    }
    
    
}

extension JSONDecoder {

    /// Assign multiple DateFormatter to dateDecodingStrategy
    ///
    /// Usage :
    ///
    ///      decoder.dateDecodingStrategyFormatters = [ DateFormatter.standard, DateFormatter.yearMonthDay ]
    ///
    /// The decoder will now be able to decode two DateFormat, the 'standard' one and the 'yearMonthDay'
    ///
    /// Throws a 'DecodingError.dataCorruptedError' if an unsupported date format is found while parsing the document
    var dateDecodingStrategyFormatters: [DateFormatter]? {
        @available(*, unavailable, message: "This variable is meant to be set only")
        get { return nil }
        set {
            guard let formatters = newValue else { return }
            self.dateDecodingStrategy = .custom { decoder in

                let container = try decoder.singleValueContainer()
                let dateString = try container.decode(String.self)

                for formatter in formatters {
                    if let date = formatter.date(from: dateString) {
                        return date
                    }
                }

                throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date string \(dateString)")
            }
        }
    }
}

extension DateFormatter {
    static let standardT: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        return dateFormatter
    }()

    static let standard: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return dateFormatter
    }()

    static let yearMonthDay: DateFormatter = {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter
    }()
}
