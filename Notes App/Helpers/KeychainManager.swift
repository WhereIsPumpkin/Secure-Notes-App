import Foundation
import Security

class CredentialsManager {
    
    static let shared = CredentialsManager()
    
    
    private let secureServiceIdentifier = "SecureNotesService"
    
    enum CredentialsError: Error {
        case duplicateEntry
        case undefinedError
        case dataNotFound
        case keychainError(status: OSStatus)
    }
    
    func storeCredentials(forUser username: String, withPassword password: String) throws {
        
        guard let encryptedPassword = password.data(using: .utf8) else {
            throw CredentialsError.undefinedError
        }
        
        let credentialsDict: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: secureServiceIdentifier as AnyObject,
            kSecAttrAccount as String: username as AnyObject,
            kSecValueData as String: encryptedPassword as AnyObject,
        ]
        
        let saveStatus = SecItemAdd(credentialsDict as CFDictionary, nil)
        
        if saveStatus == errSecDuplicateItem {
            throw CredentialsError.duplicateEntry
        } else if saveStatus != errSecSuccess {
            throw CredentialsError.keychainError(status: saveStatus)
        }
        
        print("Credentials successfully stored.")
    }
    
    func retrievePassword(forUser username: String) -> String? {
        
        let searchQuery: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: secureServiceIdentifier as AnyObject,
            kSecAttrAccount as String: username as AnyObject,
            kSecReturnData as String: kCFBooleanTrue as AnyObject,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var extractedData: AnyObject?
        let fetchStatus = SecItemCopyMatching(searchQuery as CFDictionary, &extractedData)
        
        if fetchStatus != errSecSuccess {
            return nil
        }
        
        guard let retrievedData = extractedData as? Data else {
            return nil
        }
        
        return String(data: retrievedData, encoding: .utf8)
    }
    
    func removeCredentials(forUser username: String) throws {
        
        let removalQuery: [String: AnyObject] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: secureServiceIdentifier as AnyObject,
            kSecAttrAccount as String: username as AnyObject,
        ]
        
        let deleteStatus = SecItemDelete(removalQuery as CFDictionary)
        
        if deleteStatus != errSecSuccess && deleteStatus != errSecItemNotFound {
            throw CredentialsError.keychainError(status: deleteStatus)
        }
    }
}

