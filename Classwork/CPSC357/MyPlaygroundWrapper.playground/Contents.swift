import UIKit

@propertyWrapper struct FixCase {
    var value : String = ""
    
    var wrappedValue: String {
        get { value }
        set { value = newValue.uppercased() }
    }
    
    init (wrappedValue initialValue: String) {
        self.wrappedValue = initialValue
    }
    
}

struct Address {
    var cityName: String
    
    var city: String {
        get { cityName }
        set { cityName + newValue.uppercased()}
    }
}


struct Contact {
    @FixCase var name: String
    @FixCase var city: String
    
}


var address = Address(cityName: "Orange")
print(address.city)


var contact = Contact (name: "Tyler", city: "Orange");
print(contact.name)
print(contact.city)
