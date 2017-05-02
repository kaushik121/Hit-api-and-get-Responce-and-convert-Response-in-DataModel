//
//  Utility.h
//  Hit_API_NSURLSession
//
//  Created by SILICON on 28/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "Constant_ObjectiveC.h"
#import <objc/runtime.h>
#import "MBProgressHUD.h"

typedef NS_ENUM(NSUInteger , WeekDay){
    SUNDAY = 1,
    MONDAY,
    TUESDAY,
    WEDNESDAY,
    THURSDAY,
    FRIDAY,
    SATURDAY
};

@interface Utility_ObjectiveC : NSObject

+ (void)setUserId:(NSString *)stringUserId;
+ (NSString *)getUserId;
+ (void)setAuthToken:(NSString *)stringAuthToken;
+ (NSString *)getAuthToken;
+ (void)setTokenHash:(NSString *)stringTokenHash;
+ (NSString *)getTokenHash;
+ (void)setCustomerId:(NSString *)stringCustomerId;
+ (NSString *)getCustomerId;
+ (void)setUserLogedIn:(BOOL)isLogedIn;
+ (BOOL)getUserLoggedIn;
+ (void)setBGPPlanRegisterFilled:(BOOL)isBGPPlanRegisterFilled;
+ (NSNumber *)getBGPPlanRegisterFilled;
+ (void)setKey:(NSString *)stringKey;
+ (NSString *)getKey;
+ (void)setEmailId:(NSString *)stringEmailId;
+ (NSString *)getEmailId;


#pragma mark-
+ (BOOL)isInternetConnected_ShowPopupIfNotConnected:(BOOL)showPopup;
+ (NSString *)descriptionForObject:(id)objct;
+ (NSString *)convertDateFormatDate:(NSString *)stringDate fromFormat:(NSString *)stringFromFormat toFormat:(NSString *)stringToFormat;
+ (NSString *)getDateFormatFromDateString:(NSString *)dateAPI withFormat:(NSDateFormatter *)wFormat toFormat:(NSDateFormatter *)tFormat;
+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat;
+ (NSString*)stringFromDate:(NSDate*)date inFormat:(NSString*)requiredFormat;
+ (NSArray*)timeUnitPassedbetween:(NSDate*)laterDate andPreviousDate:(NSDate*)previousDate;
+ (NSInteger)dayOfMonth:(NSDate *)date;
+ (NSInteger)weekDayOfDate:(NSDate *)date;
+ (NSString *)monthOfDate:(NSDate *)date;
+ (NSString *)getSortWeekDayFromDate:(NSDate *)date;
+ (NSString *)suffixForDay:(NSInteger)day;
+ (NSDate *)combineDateComponentFromDate:(NSDate *)date1 timeComponentFromDate:(NSDate *)date2;
+ (NSUInteger )getWeekdayFromDate:(NSDate *)date;
+ (NSString *)stringByStrippingHTML:(NSString *)htmlString;
+ (NSString *)stringByStrippingHTMLListTags:(NSString *)htmlString;
+ (NSString *)stringByStrippingHTMLTags:(NSString *)htmlString;
+ (NSArray<NSString *> *)stringByStrippingByList:(NSString *)htmlString;
+ (BOOL)isValidEmail:(NSString *)checkString;
+ (BOOL)isValidPhone:(NSString *)checkString;
+ (BOOL)isFirstCharacterOfPhoneNumber7or8or9PhoneNumber:(NSString *)stringPhoneNumber;
+ (UIActivityIndicatorView *)getActivityView:(UIView *)parentView withStyle:(UIActivityIndicatorViewStyle )style;
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;
+ (NSDictionary *)getBase64DecodedDictionary:(NSString *)base64String;
+ (NSString *)deviceUUID;
+ (NSUInteger)getWeekDayNumber:(NSString *)weekday;
+ (NSString *)trimString_RemoveWhiteSpaceFromString:(NSString *)string;
+ (void)showAlertControllerwithTitle:(NSString *)stringTitle Message:(NSString *)stringMessage;
+ (BOOL)isAbow18PlusAgeDateOfBirth:(NSString *)stringDateOfBirth;
+ (NSMutableDictionary *)getValueFromJsonFile_FileName:(NSString *)stringFileName FileType:(NSString *)stringFileType;
+ (NSString *)getApplicationVersion;
+ (NSString *)getApplicationBuild;
+ (NSString *)getApplicationVersionBuild;
+ (void)makeACallWithAlert:(BOOL)isShowAlert PhoneNumber:(NSString*)stringPhoneNumber;
+ (BOOL)isStringOnlyNumeric:(NSString *)text;
+ (NSArray *)sortArray:(NSArray *)array sortDescrptionKey:(NSString *)sortDescrptionKey isAscending:(BOOL)isAcsending;
+ (NSMutableArray *)convertDictionaryToArray_Dictionary:(NSMutableDictionary *)dictionary;
+ (NSString *)convertToCommaSeparatedFromArray:(NSMutableArray *)array;
+ (NSArray *)convertToArrayFromCommaSeparated:(NSString *)string;
+ (void)setRoundCorner_BorderLayer:(CALayer *)layer cornerRadius:(float)radius borderWidth:(float)borderWidth borderColor:(UIColor *)borderColor maskToBounds:(BOOL)maskToBounds;
+ (void)setShoadow_ShadowColorLayer:(CALayer *)layer shadowOffSetCGSizeMake:(CGSize)offSetSize shadowRadius:(float)radius shadowColor:(UIColor *)color shadowOpacity:(float)opacity maskToBounds:(BOOL)maskToBounds;
+ (void)resetNSUserDefaultsStandardUserDefaults;
+ (BOOL)isPoint:(CGPoint)point insideOfRect:(CGRect)rect;
+ (NSDate *)getDateAfterORBeforePeriodFromOriginalDate:(NSDate *)dateOriginal period:(NSInteger)intPeriod;
+ (NSDate *)getDateAfterORBeforeDaysFromOriginalDate:(NSDate *)dateOriginal periodInDays:(int)intPeriodInDays;
+ (NSString *)getCurretnViewControllerName_ViewController:(UIViewController *)viewController;
+(NSString*)urlEscape:(NSString *)unencodedString;
+(NSString*)addQueryStringToUrl:(NSString *)url params:(NSDictionary *)params;


@end
