//
//  AAConstants.swift

import Foundation
import UIKit
import CoreData

//APIS
let SERVER_IP = "5e99a9b1bc561b0016af3540.mockapi.io/jet2/api"
let BASE_URL = "https://\(SERVER_IP)/"

//SIZES
let IS_IPHONE_5 = (fabs(Double(UIScreen.main.bounds.size.height) - Double(568)) < .ulpOfOne)
let IS_IPHONE_6 = (fabs(Double(UIScreen.main.bounds.size.height) - Double(667)) < .ulpOfOne)
let IS_IPHONE_6Plus = (fabs(Double(UIScreen.main.bounds.size.height) - Double(736)) < .ulpOfOne)
let IS_IPHONE_X = (fabs(Double(UIScreen.main.bounds.size.height) - Double(812)) < .ulpOfOne)
let IS_IPHONE_XSMAX = (fabs(Double(UIScreen.main.bounds.size.height) - Double(896)) < .ulpOfOne)


//ALERTS TEXT
let EMAIL_ALERT_MSG = "Please enter valid email address!"
let EMAIL_ALERT_EMPTY = "Please enter email address!"
let CODE_ALERT_EMPTY = "Please enter membership code!"
let CODE_ALERT_VERIFY = "Please verify your membership code!"
let CODE_DIGIT_MSG = "CVC!"
let MEMBERSHIP_CODE_DIGIT_MSG = "Please enter 16 digit code!"
let CURRENT_PASSWORD_EMPTY_MSG = "Please enter a current password!"
let PASSWORD_6DIGIT_MSG = "Please enter atleast 6 characters!"
let PASSWORDS_DIDNT_MATCH_MSG = "Passwords didn't match!"
let NAME_EMPTY_MSG = "Please enter a name!"
let FIRSTNAME_EMPTY_MSG = "Please enter a first name!"
let LASTNAME_EMPTY_MSG = "Please enter a last name!"
let PASSWORD_EMPTY_MSG = "Please enter a password!"
let CONFIRM_PASSWORD_EMPTY_MSG = "Please enter a confirm password!"
let LOGINID_EMPTY_MSG = "Please enter a loginId!"
let OTP_EMPTY_MSG = "Please enter OTP!"
let OTP_4DIGIT_MSG = "Please enter 4 digit OTP!"
let MEMBERSHIP_EMPTY_MSG = "Membership Code!"
let MOBILE_EMPTY_MSG = "Please enter a mobile number!"
let MOBILE_10DIGIT_MSG = "Please enter valid 10 digit mobile number!"
let PASSWORD_VALIDATE_MSG = "Password must be more than 6 characters, with at least one capital, numeric or special character!"
let USER_CREDENTIAL_WRONG = "User credentials does not seems to match out record!"
let USER_OTP_WRONG = "You have entered wrong OTP!"
let OTP_SENT_MSG = "OTP sent successfully!"
let CHECK_INTERNET_CONNECTION = "Please check your internet connection!"
let TRY_AGAIN = "Something went wrong,Please try again!"
let Select_Value = "Select Value"
let TEXT_OPTIONAL = "Comments(Optional)"

let BACKGROUND_MSG = "Give us some background"
let SOLUTION_MSG = "An Approach or solution which would help drive this"
let BENEFIT_MSG = "Convince us by giving the potential benefits"
let TITLE_MSG = "Give it a title"
