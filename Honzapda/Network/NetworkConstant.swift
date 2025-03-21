//
//  NetworkConstant.swift
//  Honzapda
//
//  Created by YOUJIM on 2/28/24.
//

import Foundation

class Constant {
    // MARK: - USER CONTROLLER
    static let user = "/user"
    static let userPrifileImage = "/user/profileImage"
    static let userPrefer = "/user/prefer"
    static let userPassword = "/user/password"
    static let userLikeshops = "/user/likeshops"
    static let userLikes = "/user/likes"
    
    // MARK: - USER HELP INFO CONTROLLER
    static let userHelpInfo = "/userHelpInfo"
    static func userHelpInfoIdLike(ID userHelpInfoId: String) -> String  {
        return "/userHelpInfo/\(userHelpInfoId)/like"
    }
    static func userHelpInfo(ID userHelpInfoId: String) -> String {
        return "/userHelpInfo/\(userHelpInfoId)"
    }
    
    // MARK: - SHOP CONTROLLER
    static let shopSearch = "/shop/search"
    static let shopRegister = "/shop/register"
    static let shopLogin = "/shop/login"
    static func shop(ID shopId: String) -> String {
        return "/shop/\(shopId)"
    }
    
    // MARK: - REVIEW CONTROLLER
    static let review = "/review"
    static let reviewImage = "/review/image"
    static func review(ID reviewId: String) -> String {
        return "/review/\(reviewId)"
    }
    
    // MARK: - MAP CONTROLLER
    static let map = "/map"
    static func mapShop(ID shopId: String) -> String {
        return "/map/\(shopId)"
    }
    static let mapShop = "/map/shop"
    
    // MARK: - FILE CONTROLLER
    static let fileUpload = "/file/upload"
    static func fileDelete(ID uuid: String) -> String {
        return "/file/\(uuid)"
    }
    
    // MARK: - AUTH CONTROLLER
    static let authRegister = "/auth/register"
    static let authLogin = "/auth/login"
    static let authFindPassword = "/auth/findPassword"
    static let authCheckId = "/auth/checkId"
    static let authApple = "/auth/apple"
    static let authLogout = "/auth/logout"
    static let authExpired = "/auth/expired"
    static let authRevoke = "/auth/revoke"
}
