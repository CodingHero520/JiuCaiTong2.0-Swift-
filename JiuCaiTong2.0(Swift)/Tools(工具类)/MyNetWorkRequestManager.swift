//
//  MyNetWorkRequestManager.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2017/12/26.
//  Copyright © 2017年 baolei. All rights reserved.
//

import UIKit
import Alamofire
//枚举出请求的类型
enum RequestMethod {
    case RequestMethodPOST
    case RequestMethodGET
}

private let NetworkRequestShareInstace = MyNetWorkRequestManager()
class MyNetWorkRequestManager: NSObject {
    
    var baseUrl :String = ""
    var isNeedAccessToken:Bool = true //默认yes
    var baseParams :NSMutableDictionary = [:]

    //做一个单利
    class var sharedInstace:MyNetWorkRequestManager{
        
            return NetworkRequestShareInstace
    }

}
extension MyNetWorkRequestManager{
    
    //MARK ：拼接完整的url
    func getCompleteUrl(url:String) -> String {
        
        let newUrl = self.baseUrl.appending(url)
        
        if self.isNeedAccessToken {
            
            //拼接AccessToken
        }
        return newUrl.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        
    }
    //MARK：拼接完成的参数
    func CombinationParams(params:NSDictionary) -> NSDictionary {
        
        self.baseParams.addEntries(from: params as! [AnyHashable:Any])
        return self.baseParams
    }
    
    //MARK :获取请求的方式
    func getHttpMethod(method:RequestMethod) -> HTTPMethod {
        
        if method == .RequestMethodPOST {
            return .post
        }else{
            return .get
        }
    }
    //MARK:获得设备的相关信息
    func getMachineInfo() -> NSString {
        
        let info:NSMutableString = NSMutableString.init()
        
        let system:NSString = "iOS"  //操作系统
        let systemVision:NSString = UIDevice.current.systemVersion as NSString //系统版本
        let appVision:NSString = (Bundle.main.infoDictionary! as NSDictionary).object(forKey: "CFBundleShortVersionString") as! NSString
        let appBuildVision:NSString = (Bundle.main.infoDictionary! as NSDictionary).object(forKey: "CFBundleVersion") as! NSString
        
        let phoneType = "Iphone6s"
        
        
        info.append("\(system)|||")
        info.append("\(systemVision)|||")
        info.append("\(phoneType)")
        info.append("\(appVision)|||")
        info.append("\(appBuildVision)")
        
        return info
    }
    //数据的请求，设置请求头，验证证书，这里没有本地配置证书的，直接设置允许的
    //将get和post方法，封装在一个方法中
    func RequestParams(url:String,method:RequestMethod,params:NSMutableDictionary,success:@escaping(AnyObject)->(),failure:@escaping(Error)->()) -> Void {
    
        let ParamDict:NSMutableDictionary = ["i_type":"1","r_type":"1"]
        
        var keys:NSArray = params.allKeys as NSArray
        
        //拼接参数
        if keys.lastObject != nil {
    
            for keyvalue in keys{
                
                var value:NSString = params.object(forKey: keyvalue) as! NSString
                
                ParamDict .setValue(value, forKey: keyvalue as! String)
                
                var machineInfo:NSString = self .getMachineInfo()
                
                ParamDict .setValue(machineInfo, forKey: "MachineInfo")
            
            }
        }
        
        //对参数进行base64加密
        
        var paramkeys :NSArray = ParamDict.allKeys as NSArray
        
        var ParamMutDict:NSMutableDictionary = [:]
        
        //对每一个值进行加密
        for paramKey in paramkeys{
            
            var paramvalue:NSString = ParamDict.object(forKey: paramKey) as! NSString
            
            var data:NSData = paramvalue.data(using: String.Encoding.utf8.rawValue)! as NSData
                
            var base64Str = data.base64EncodedString(options: .lineLength64Characters)
            
            ParamMutDict .setValue(base64Str, forKey: paramKey as! String)
            
        }
        
        self.baseParams = self.CombinationParams(params: ParamMutDict) as! NSMutableDictionary
        //验证证书
        self .verificationCertificate()

        let urlstr:String = self.getCompleteUrl(url: url)
        
        var param:NSDictionary = NSDictionary.init()
        
//        ["r_type":self.baseParams .object(forKey: "r_type")!,"i_type":self.baseParams .object(forKey: "i_type")!,"MachineInfo":self.baseParams .object(forKey: "MachineInfo")!,"act":self.baseParams .object(forKey: "act")!]
        //解析成功
        Alamofire.request(urlstr, parameters:self.baseParams as? Parameters)
            .responseJSON { response in

                switch (response.result){
                    
                case .success(let value):
                    
                        success(response.result.value as AnyObject)
                    
                    break
                    
                    
                case .failure(let  error):
                    
                    failure(error)
                    
                    break
                }
                
                
        }

    }
    
    //Mark:https证书验证
    func verificationCertificate() -> Void {
        
        let manager = SessionManager.default
        
        manager.delegate.sessionDidReceiveChallenge = { session,challenge in
            
            var disposition :URLSession.AuthChallengeDisposition = .performDefaultHandling
            var credential :URLCredential?
            if challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust {
        
                disposition = URLSession.AuthChallengeDisposition.useCredential
                credential = URLCredential.init(trust: challenge.protectionSpace.serverTrust!)
                
            }else{
                
                if challenge.previousFailureCount > 0{
                    
                    disposition = .cancelAuthenticationChallenge
                }else{
                    credential = (manager.session.configuration.urlCredentialStorage?.defaultCredential(for: challenge.protectionSpace))!
                    
                    if credential != nil{
                        disposition = .useCredential
                    }
                }
                
            }
            return (disposition,credential)
        }
    }
}
