//: Playground - noun: a place where people can play

import Cocoa

var errorCodeString: String?
//errorCodeString = "404"
var errorDescription: String?
if let theError = errorCodeString, errorCodeInteger = Int(theError)
    where errorCodeInteger == 404 {
        errorDescription = "\(errorCodeInteger + 200): resource was not found."
}

var upCaseErrorDescription = errorDescription?.uppercaseString
upCaseErrorDescription?.appendContentsOf(" PLEASE TRY AGAIN.")
print(upCaseErrorDescription)

let description = errorDescription ?? "No error"