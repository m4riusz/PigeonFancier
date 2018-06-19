
enum LocalizableStrings: String {
    // DEPARTMENTS
    case departments = "departments"
    case departmentsNotAvailable = "departments_not_available"
    case departmentsNotFound = "departments_not_found"
    case departmentsNotFoundFilter = "departments_not_found_filter"
    
    // BOTTOM BAR
    case navPigeons = "nav_pigeons";
    case navDepartments = "nav_departments";
    case navAbout = "nav_about";
    
    // GENERAL
    case empty = "empty_string"
    case tryAgainLater = "try_again_later"
    case search = "search"
    case cancel = "cancel"
    
    var localized: String {
        return self.rawValue.localized()
    }
}
