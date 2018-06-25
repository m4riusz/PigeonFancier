import Foundation

protocol IDepartmentService {
    
    func getDistinctsWithDepartments(successCallback: @escaping ([District]) -> Void, errorBlock: @escaping (Error) -> Void) -> Void
    
    func getDepartmentWithEvidenceNumber(_ evidenceNumber: String, successCallback: @escaping (Department) -> Void, errorBlock: @escaping (Error) -> Void)
}

class DepartmentService: IDepartmentService {
    
    
    func getDistinctsWithDepartments(successCallback: @escaping ([District]) -> Void, errorBlock: (@escaping (Error) -> Void)) -> Void {
        // TODO: remove mocks
        let distincts = [
            District(name: "Biała Podlaska", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "08", name: "Bełchatów", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                Department(favourite: false, evidenceNumber: "09", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                ]),
            District(name: "Lódź", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                ]),
            District(name: "Piotrków Trybunalski", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "08", name: "Bełchatów", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "08", name: "Bełchatów", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                Department(favourite: false, evidenceNumber: "09", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                ]),
            District(name: "Biała Podlaska", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "08", name: "AAAAA", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                Department(favourite: false, evidenceNumber: "09", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                ]),
            District(name: "Lódź", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                ]),
            District(name: "Piotrków Trybunalski", president: Person(firstName: "Janusz", lastName: "Podlaski", phoneNumber: ["444-122-222"], email: nil), address: Address(street: "ul. Polna 18", city: "Biała Podlaska", postalCode: "99-123"), departments: [
                Department(favourite: true, evidenceNumber: "07", name: "Aaaa", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "08", name: "Bełchatów", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                Department(favourite: true, evidenceNumber: "07", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "08", name: "Bełchatów", owner: Person(firstName: "Kamil", lastName: "Rybus", phoneNumber: ["111-111-111", "222-222-222"], email: nil), address: Address(street: "ul Pawła 2", city: "Bełchatów", postalCode: "90-300")),
                Department(favourite: false, evidenceNumber: "09", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300")),
                Department(favourite: false, evidenceNumber: "017", name: "Biała Podlaska", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111"], email: ["email@email.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
                ])
        ]
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            successCallback(distincts)
        }
    }
    
    func getDepartmentWithEvidenceNumber(_ evidenceNumber: String, successCallback: @escaping (Department) -> Void, errorBlock: @escaping (Error) -> Void) {
        
        let department: Department = Department(favourite: true, evidenceNumber: "07", name: "Aaaa", owner: Person(firstName: "Janusz", lastName: "Piechociński", phoneNumber: ["111-111-111", "222-222-222"], email: ["email@email.pl","kajak@krzysztof.pl"]), address: Address(street: "ul Jana Pawła 2", city: "Opoczno", postalCode: "91-300"))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            successCallback(department)
        }
    }
    
}
