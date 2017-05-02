//
//  Utility.m
//  Hit_API_NSURLSession
//
//  Created by SILICON on 28/07/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "Utility_ObjectiveC.h"

@implementation Utility_ObjectiveC


+ (void)setUserId:(NSString *)stringUserId{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:stringUserId forKey:@"user_id"];
    [userDefaults synchronize];
}


+ (NSString *)getUserId{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"user_id"];
}


+ (void)setAuthToken:(NSString *)stringAuthToken{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:stringAuthToken forKey:@"Auth-Token"];
    [userDefaults synchronize];
}

+ (NSString *)getAuthToken{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"Auth-Token"];
}


+ (void)setTokenHash:(NSString *)stringTokenHash{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:stringTokenHash forKey:@"tokenhash"];
    [userDefaults synchronize];
}


+ (NSString *)getTokenHash{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"tokenhash"];
}


+ (void)setCustomerId:(NSString *)stringCustomerId{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:stringCustomerId forKey:@"customer_id"];
    [userDefaults synchronize];
}


+ (NSString *)getCustomerId{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"customer_id"];
}


+ (void)setUserLogedIn:(BOOL)isLogedIn{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:isLogedIn forKey:@"isLoggedIn"];
    [userDefaults synchronize];
}


+ (BOOL)getUserLoggedIn{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"isLoggedIn"];
}


+ (void)setBGPPlanRegisterFilled:(BOOL)isBGPPlanRegisterFilled{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:[NSNumber numberWithBool:isBGPPlanRegisterFilled] forKey:@"isBGPPlanRegisterFilled"];
    [userDefaults synchronize];
}


+ (NSNumber *)getBGPPlanRegisterFilled{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"isBGPPlanRegisterFilled"];
}


+ (void)setKey:(NSString *)stringKey{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:stringKey forKey:@"key"];
    [userDefaults synchronize];
}


+ (NSString *)getKey{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"key"];
}


+ (void)setEmailId:(NSString *)stringEmailId{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:stringEmailId forKey:@"email_id"];
    [userDefaults synchronize];
}


+ (NSString *)getEmailId{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:@"email_id"] == nil ? @"" : [userDefaults objectForKey:@"email_id"];
}


#pragma mark -
+ (BOOL)isInternetConnected_ShowPopupIfNotConnected:(BOOL)showPopup{
    Reachability *reach = [Reachability reachabilityForInternetConnection];
    //(or)
    // Reachability *reach = [Reachability reachabilityWithHostName:@"http://www.google.com"];
    
    NetworkStatus netStatus = [reach currentReachabilityStatus];
    if (netStatus != NotReachable){
        NSLog(@"Internet Rechable");
        return YES;
    }
    else{
        NSLog(@"Check Internet Connection");
        if (showPopup){
            UIAlertController *anAlertController=[UIAlertController alertControllerWithTitle:@"Please Check Internet Connection" message:nil preferredStyle:UIAlertControllerStyleAlert];
            
            id rootViewController=[UIApplication sharedApplication].delegate.window.rootViewController;
            if([rootViewController isKindOfClass:[UINavigationController class]]){
                rootViewController=[((UINavigationController *)rootViewController).viewControllers objectAtIndex:0];
            }
            
            UIAlertAction *alertActionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                NSLog(@"OK");
            }];
            
            [anAlertController addAction:alertActionOK];
            [rootViewController presentViewController:anAlertController animated:YES completion:^{
                NSLog(@"After Completion Code");
            }];
        }
        return NO;
    }
}


+ (NSString *)descriptionForObject:(id)objct{
    unsigned int varCount;
    NSMutableString *descriptionString = [[NSMutableString alloc]init];
    objc_property_t *vars = class_copyPropertyList(object_getClass(objct), &varCount);
    
    for (int i = 0; i < varCount; i++){
        objc_property_t var = vars[i];
        const char* name = property_getName (var);
        NSString *keyValueString = [NSString stringWithFormat:@"\n%@ = %@",[NSString stringWithUTF8String:name],[objct valueForKey:[NSString stringWithUTF8String:name]]];
        [descriptionString appendString:keyValueString];
    }
    free(vars);
    return descriptionString;
}


+ (NSString *)convertDateFormatDate:(NSString *)stringDate fromFormat:(NSString *)stringFromFormat toFormat:(NSString *)stringToFormat{
    //    @"2011-01-22" = @"yyyy-MM-dd"
    //    @"23 Feb 2012" = @"dd MMM yyyy"
    //    @"23 Feb, 2012" = @"dd MMM, yyyy"
    
    NSDateFormatter *dateFormatterFrom = [[NSDateFormatter alloc] init];
    [dateFormatterFrom setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    [dateFormatterFrom setDateFormat:stringFromFormat];
    NSDate *date = [dateFormatterFrom dateFromString:stringDate];
    NSDateFormatter *dateFormatterTo=[[NSDateFormatter alloc] init];
    [dateFormatterTo setDateFormat:stringToFormat];
    NSString *stringNewDate = [dateFormatterTo stringFromDate:date];
    return stringNewDate;
}


+ (NSString *)getDateFormatFromDateString:(NSString *)dateAPI withFormat:(NSDateFormatter *)wFormat toFormat:(NSDateFormatter *)tFormat{
    NSDate *dated = [wFormat dateFromString:dateAPI];
    NSString *newDate = [tFormat stringFromDate:dated];
    return  newDate;
}


+ (NSDate *)dateFromString:(NSString *)dateString withFormat:(NSString *)dateFormat{
    NSDateFormatter * formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"IST"]];
    // [formatter setLocale:[NSLocale systemLocale]];
    [formatter setDateFormat:dateFormat];
    /*** exception crash issue******/
    if([formatter dateFromString:dateString]==nil){
        return [NSDate date];
    }
    return  [formatter dateFromString:dateString];
}

+ (NSString*)stringFromDate:(NSDate*)date inFormat:(NSString*)requiredFormat{
    NSDateFormatter* df = [[NSDateFormatter alloc]init];
    [df setDateFormat:requiredFormat];
    return  [df stringFromDate:date];
}


+ (NSArray*)timeUnitPassedbetween:(NSDate*)laterDate andPreviousDate:(NSDate*)previousDate{
    NSDate *startDate = previousDate;
    NSDate *endDate = laterDate;
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitDay | NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitWeekOfMonth | NSCalendarUnitHour | NSCalendarUnitMinute
                                                        fromDate:startDate
                                                          toDate:endDate
                                                         options:NSCalendarWrapComponents];
    NSInteger year = [components year];
    NSInteger month = [components month];
    // NSInteger week = [components weekday];
    NSInteger days = [components day];
    NSInteger hour = [components hour];
    NSInteger minutes = [components minute];
    NSString *stringToUse;
    if (year > 0) {
        if (year==1) {
            stringToUse = @"year";
        }else{
            stringToUse = @"years";
        }
        return [NSArray arrayWithObjects:[NSNumber numberWithInteger:year],stringToUse, nil];
    }if (month>0) {
        if (year==1) {
            stringToUse = @"month";
        }else{
            stringToUse = @"months";
        }
        return [NSArray arrayWithObjects:[NSNumber numberWithInteger:month],stringToUse, nil];
    }
    if (days>0) {
        if (days>7) {
            if (days>14) {
                stringToUse = @"weeks";
            }else{
                stringToUse= @"week";
            }
            return [NSArray arrayWithObjects:[NSNumber numberWithInteger:days%7],stringToUse,nil];
        }else{
            if (days == 1) {
                stringToUse = @"day";
            }else{
                stringToUse = @"days";
            }
            return [NSArray arrayWithObjects:[NSNumber numberWithInteger:days],stringToUse,nil];
        }
    }if (hour>0) {
        if (hour == 1) {
            stringToUse = @"hour";
        }else{
            stringToUse = @"hours";
        }
        return [NSArray arrayWithObjects:[NSNumber numberWithInteger:hour],stringToUse,nil];
    }
    if (minutes>=0) {
        if (minutes <= 1) {
            stringToUse = @"minute";
        }else{
            stringToUse = @"minutes";
        }
    }
    return [NSArray arrayWithObjects:[NSNumber numberWithInteger:minutes],stringToUse,nil];
}


+ (NSInteger)dayOfMonth:(NSDate *)date{
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay fromDate:date];
    
    NSInteger dayOfMonth = [comps day];
    return dayOfMonth;
}


+ (NSInteger)weekDayOfDate:(NSDate *)date{
    NSDateComponents *comps = [[NSCalendar currentCalendar] components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay | NSCalendarUnitWeekday fromDate:date];
    
    NSInteger dayOfMonth = [comps weekday];
    return dayOfMonth;
}


+ (NSString *)monthOfDate:(NSDate *)date{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MMM"];
    // NSDate *now = [[NSDate alloc] init];
    NSString *dateString = [format stringFromDate:date];
    return dateString;
}


+ (NSString *)getSortWeekDayFromDate:(NSDate *)date{
    NSInteger weekDay = [self weekDayOfDate:date];
    NSString *sortWeekDayName = @"";
    switch (weekDay) {
        case 1:
            // Sunday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_SUNDAY;
            break;
        case 2:{
            // Monday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_MONDAY;
        }
            break;
        case 3:
            // Tuesday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_TUESDAY;
            break;
        case 4:{
            // Wednesday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_WEDNESDAY;
        }
            break;
        case 5:
            // Thursday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_THURSDAY;
            break;
        case 6:{
            // Friday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_FRIDAY;
        }
            break;
        case 7:{
            // Saturday
            sortWeekDayName = FT_UPCOMING_CLASSES_SESSION_SORT_WEEKNAME_SATURDAY;
        }
            break;
        default:
            break;
    }
    return sortWeekDayName;
}


+ (NSString *)suffixForDay:(NSInteger)day{
    // Finding suffix for date
    NSString *suffix_string = @"|st|nd|rd|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|th|st|nd|rd|th|th|th|th|th|th|th|st";
    NSArray *suffixes = [suffix_string componentsSeparatedByString: @"|"];
    NSString *suffix = [suffixes objectAtIndex:day];
    return suffix;
}


+ (NSDate *)combineDateComponentFromDate:(NSDate *)date1 timeComponentFromDate:(NSDate *)date2{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"IST"]];
    
    // Extract date components into components1
    NSDateComponents *components1 = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                                                fromDate:date1];
    
    // Extract time components into components2
    NSDateComponents *components2 = [calendar components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond
                                                fromDate:date2];
    
    // Combine date and time into components3
    NSDateComponents *components3 = [[NSDateComponents alloc] init];
    
    [components3 setYear:components1.year];
    [components3 setMonth:components1.month];
    [components3 setDay:components1.day];
    [components3 setHour:components2.hour];
    [components3 setMinute:components2.minute];
    [components3 setSecond:components2.second];
    
    // Generate a new NSDate from components3.
    NSDate *combinedDate = [calendar dateFromComponents:components3];
    // combinedDate contains both your date and time!
    return combinedDate;
}


+ (NSUInteger )getWeekdayFromDate:(NSDate *)date{
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = [gregorian components:NSCalendarUnitWeekday fromDate:date];
    NSUInteger weekday = [comps weekday];
    return weekday;
}


+ (NSString *)stringByStrippingHTML:(NSString *)htmlString{
    NSRange r;
    while ((r = [htmlString rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        htmlString = [htmlString stringByReplacingCharactersInRange:r withString:@""];
    
    return htmlString;
}


+ (NSString *)stringByStrippingHTMLListTags:(NSString *)htmlString{
    NSString *removeTag0 = [htmlString stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSString *removeTag1 = [removeTag0 stringByReplacingOccurrencesOfString:@"<ul><li>" withString:@" "];
    NSString *removeTag2 = [removeTag1 stringByReplacingOccurrencesOfString:@"</li><li>" withString:@" "];
    NSString *removeTag3 = [removeTag2 stringByReplacingOccurrencesOfString:@"</li></ul>" withString:@" "];
    NSString *removeTag4 = [removeTag3 stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    NSString *removeTag5 = [removeTag4 stringByReplacingOccurrencesOfString:@" and " withString:@""];
    NSString *removeTag6 = [removeTag5 stringByReplacingOccurrencesOfString:@"<strong>" withString:@""];
    NSString *removeTag7 = [removeTag6 stringByReplacingOccurrencesOfString:@"</strong>" withString:@""];
    NSString *removeTag8 = [removeTag7 stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    NSString *removeTag9 = [removeTag8 stringByReplacingOccurrencesOfString:@"</p><p>" withString:@" "];
    NSString *removeTag10 = [removeTag9 stringByReplacingOccurrencesOfString:@"</p>" withString:@" "];
    NSString *removeTag11 = [removeTag10 stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"];
    NSString *removeTag12 = [removeTag11 stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    
    return removeTag12;
}


+ (NSString *)stringByStrippingHTMLTags:(NSString *)htmlString{
    NSString *removeTag1 = [htmlString stringByReplacingOccurrencesOfString:@"<ul><li>" withString:@" "];
    NSString *removeTag2 = [removeTag1 stringByReplacingOccurrencesOfString:@"</li><li>" withString:@" "];
    NSString *removeTag3 = [removeTag2 stringByReplacingOccurrencesOfString:@"</li></ul>" withString:@" "];
    NSString *removeTag4 = [removeTag3 stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@" "];
    NSString *removeTag5 = [removeTag4 stringByReplacingOccurrencesOfString:@" and " withString:@""];
    NSString *removeTag6 = [removeTag5 stringByReplacingOccurrencesOfString:@"<strong>" withString:@""];
    NSString *removeTag7 = [removeTag6 stringByReplacingOccurrencesOfString:@"</strong>" withString:@""];
    NSString *removeTag8 = [removeTag7 stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    NSString *removeTag9 = [removeTag8 stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    NSString *removeTag10 = [removeTag9 stringByReplacingOccurrencesOfString:@"</p><p>" withString:@" "];
    NSString *removeTag11 = [removeTag10 stringByReplacingOccurrencesOfString:@"&#39;" withString:@"'"];
    NSString *removeTag12 = [removeTag11 stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    
    return removeTag12;
}


+ (NSArray<NSString *> *)stringByStrippingByList:(NSString *)htmlString{
    NSString *removeTag1 = [htmlString stringByReplacingOccurrencesOfString:@"<ul>" withString:@""];
    NSString *removeTag2 = [removeTag1 stringByReplacingOccurrencesOfString:@"</ul>" withString:@""];
    NSString *removeTag3 = [removeTag2 stringByReplacingOccurrencesOfString:@"<li>" withString:@""];
    NSString *removeTag4 = [removeTag3 stringByReplacingOccurrencesOfString:@"<p>" withString:@""];
    NSString *removeTag5 = [removeTag4 stringByReplacingOccurrencesOfString:@"</p>" withString:@""];
    NSString *removeTag6 = [removeTag5 stringByReplacingOccurrencesOfString:@"&nbsp;" withString:@""];
    NSArray<NSString *> *splittedStrings = [removeTag6 componentsSeparatedByString:@"</li>"];
    
    return [splittedStrings filteredArrayUsingPredicate:
            [NSPredicate predicateWithFormat:@"length > 0"]];
}


+ (BOOL)isValidEmail:(NSString *)checkString{
    BOOL stricterFilter = NO;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}


+ (BOOL)isValidPhone:(NSString *)checkString{
    //{6,14} set Phone number length
    NSString *phoneRegex = @"^((\\+)|(00))[0-9]{10,10}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", phoneRegex];
    return [phoneTest evaluateWithObject:checkString];
}


+ (BOOL)isFirstCharacterOfPhoneNumber7or8or9PhoneNumber:(NSString *)stringPhoneNumber{
    if ([[stringPhoneNumber substringToIndex:1] isEqualToString:@"7"]){
        return YES;
    }
    else if ([[stringPhoneNumber substringToIndex:1] isEqualToString:@"8"]){
        return YES;
    }
    else if ([[stringPhoneNumber substringToIndex:1] isEqualToString:@"9"]){
        return YES;
    }
    return NO;
}


+ (UIActivityIndicatorView *)getActivityView:(UIView *)parentView withStyle:(UIActivityIndicatorViewStyle )style{
    UIActivityIndicatorView *activityIndicator= [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    activityIndicator.tag=100;
    activityIndicator.center = parentView.center;
    activityIndicator.activityIndicatorViewStyle = style;
    CGAffineTransform transform = CGAffineTransformMakeScale(1.75f, 1.75f);
    activityIndicator.transform = transform;
    [parentView addSubview:activityIndicator];
    [parentView bringSubviewToFront:activityIndicator];
    return  activityIndicator;
}


+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize{
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}


+ (NSDictionary *)getBase64DecodedDictionary:(NSString *)base64String{
    NSArray *stringData = [base64String componentsSeparatedByString:@"."];
    NSData *rawData = [[NSData alloc] initWithBase64EncodedString:stringData[1] options:0];
    
    NSString *decodedString = [[NSString alloc] initWithData:rawData encoding:NSUTF8StringEncoding];
    NSData *objectData = [decodedString dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error;
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:objectData
                                                         options:NSJSONReadingMutableContainers
                                                           error:&error];
    return json;
}


+ (NSString *)deviceUUID{
    return [[[UIDevice currentDevice] identifierForVendor] UUIDString];
}


+ (NSUInteger)getWeekDayNumber:(NSString *)weekday{
    NSUInteger day = 0;
    if([weekday isEqualToString:@"sunday"]){
        day = SUNDAY;
    }else if([weekday isEqualToString:@"monday"]){
        day = MONDAY;
    }else if([weekday isEqualToString:@"tuesday"]){
        day = TUESDAY;
    }else if([weekday isEqualToString:@"wednesday"]){
        day = WEDNESDAY;
    }else if([weekday isEqualToString:@"thursday"]){
        day = THURSDAY;
    }else if([weekday isEqualToString:@"friday"]){
        day = FRIDAY;
    }else if([weekday isEqualToString:@"saturday"]){
        day = SATURDAY;
    }
    return day;
}


+ (NSString *)trimString_RemoveWhiteSpaceFromString:(NSString *)string{
    return [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}


+ (void)showAlertControllerwithTitle:(NSString *)stringTitle Message:(NSString *)stringMessage{
    UIAlertController *anAlertController=[UIAlertController alertControllerWithTitle:stringTitle message:stringMessage preferredStyle:UIAlertControllerStyleAlert];
    
    id rootViewController=[UIApplication sharedApplication].delegate.window.rootViewController;
    if([rootViewController isKindOfClass:[UINavigationController class]])
    {
        rootViewController=[((UINavigationController *)rootViewController).viewControllers objectAtIndex:0];
    }
    
    UIAlertAction *alertActionOK = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"OK");
    }];
    
    [anAlertController addAction:alertActionOK];
    [rootViewController presentViewController:anAlertController animated:YES completion:^{
        NSLog(@"After Completion Code");
    }];
}


+ (BOOL)isAbow18PlusAgeDateOfBirth:(NSString *)stringDateOfBirth{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSDate *dateStart = [dateFormatter dateFromString:stringDateOfBirth];
    NSDate *dateEnd = [NSDate date];
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSUInteger unitFlags = NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    NSDateComponents *components = [calendar components:unitFlags fromDate:dateStart toDate:dateEnd options:0];
    NSInteger years  = [components year];
    NSInteger months  = [components month];
    NSInteger days  = [components day];
    
    NSLog(@"Years:%ld Months:%ld Days:%ld", (long)years,(long)months,(long)days);
    
    if (years == 18){
        if (days >= 1){
            return YES;
        }
    }
    else if (years > 18){
        return YES;
    }
    return NO;
}


+ (NSMutableDictionary *)getValueFromJsonFile_FileName:(NSString *)stringFileName FileType:(NSString *)stringFileType{
    NSString *stringFilePath = [[NSBundle mainBundle] pathForResource:stringFileName ofType:stringFileType];
    NSString *stringJSONContent = [NSString stringWithContentsOfFile:stringFilePath encoding:NSUTF8StringEncoding error:nil];
    NSData *aData = [stringJSONContent dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];;;
    NSError *anError;
    NSMutableDictionary *dictionaryJSON = [NSJSONSerialization JSONObjectWithData:aData options:kNilOptions error:&anError];
    return dictionaryJSON;
}


+ (NSString *)getApplicationVersion{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: @"CFBundleShortVersionString"];
}


+ (NSString *)getApplicationBuild{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey: (NSString *)kCFBundleVersionKey];
}


+ (NSString *)getApplicationVersionBuild{
    NSString * stringVersion = [self getApplicationVersion];
    NSString * stringBuild = [self getApplicationBuild];
    NSString * stringVersionBuild = [NSString stringWithFormat: @"v%@", stringVersion];
    
    if (![stringVersion isEqualToString: stringBuild]) {
        stringVersionBuild = [NSString stringWithFormat: @"%@(%@)", stringVersionBuild, stringBuild];
    }
    return stringVersionBuild;
}


+ (void)makeACallWithAlert:(BOOL)isShowAlert PhoneNumber:(NSString*)stringPhoneNumber{
    if (isShowAlert){
        UIAlertController *alertController=[UIAlertController alertControllerWithTitle:stringPhoneNumber message:nil preferredStyle:UIAlertControllerStyleAlert];
        
        id rootViewController=[UIApplication sharedApplication].delegate.window.rootViewController;
        if([rootViewController isKindOfClass:[UINavigationController class]])
        {
            rootViewController=[((UINavigationController *)rootViewController).viewControllers objectAtIndex:0];
        }
        
        UIAlertAction *alertActionButtonCancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"Cancel");
            
        }];
        
        UIAlertAction *alertActionButtonCall = [UIAlertAction actionWithTitle:@"Call" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSString *stringPhoneNumberTemp = [[stringPhoneNumber componentsSeparatedByCharactersInSet:
                                                [[NSCharacterSet characterSetWithCharactersInString:@"+0123456789"]
                                                 invertedSet]]
                                               componentsJoinedByString:@""];
            NSLog(@"Call");
            
            stringPhoneNumberTemp = [@"tel://" stringByAppendingString:stringPhoneNumberTemp];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringPhoneNumberTemp]];
            
        }];
        
        [alertController addAction:alertActionButtonCancel];
        [alertController addAction:alertActionButtonCall];
        
        [rootViewController presentViewController:alertController animated:YES completion:nil];
    }
    else{
        NSString *stringPhoneNumberTemp = [[stringPhoneNumber componentsSeparatedByCharactersInSet:
                                            [[NSCharacterSet characterSetWithCharactersInString:@"+0123456789"]
                                             invertedSet]]
                                           componentsJoinedByString:@""];
        NSLog(@"Call");
        
        stringPhoneNumberTemp = [@"tel://" stringByAppendingString:stringPhoneNumberTemp];
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:stringPhoneNumberTemp]];
    }
}


+ (BOOL)isStringOnlyNumeric:(NSString *)text{
    NSCharacterSet *alphaNums = [NSCharacterSet decimalDigitCharacterSet];
    NSCharacterSet *inStringSet = [NSCharacterSet characterSetWithCharactersInString:text];
    return [alphaNums isSupersetOfSet:inStringSet];
}


+ (NSArray *)sortArray:(NSArray *)array sortDescrptionKey:(NSString *)sortDescrptionKey isAscending:(BOOL)isAcsending{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:sortDescrptionKey
                                                                     ascending:isAcsending
                                                                    comparator: ^(id obj1, id obj2){
                                                                        return [obj1 compare:obj2 options:NSNumericSearch];
                                                                    }];
    NSArray *arraySortDescriptor = @[sortDescriptor];
    NSArray *arraySorted = [array sortedArrayUsingDescriptors:arraySortDescriptor];
    return arraySorted;
}


+ (NSMutableArray *)convertDictionaryToArray_Dictionary:(NSMutableDictionary *)dictionary{
    NSMutableArray *arrayConverted = [[NSMutableArray alloc]init];
    NSMutableArray *arrayAllKeys = [[NSMutableArray alloc]init];
    NSMutableArray *arrayAllValues = [[NSMutableArray alloc]init];
    
    arrayAllKeys = [[dictionary allKeys] mutableCopy];
    arrayAllValues = [[dictionary allValues] mutableCopy];
    
    for (int i = 0; i < dictionary.count; i++){
        NSMutableDictionary *dictionaryTemp = [[NSMutableDictionary alloc]init];
        [dictionaryTemp setObject:[arrayAllValues objectAtIndex:i] forKey:[arrayAllKeys objectAtIndex:i]];
        [arrayConverted addObject:dictionaryTemp];
    }
    return arrayConverted;
}


+ (NSString *)convertToCommaSeparatedFromArray:(NSMutableArray *)array{
    return [array componentsJoinedByString:@","];
}


+ (NSArray *)convertToArrayFromCommaSeparated:(NSString *)string{
    return [string componentsSeparatedByString:@","];
}


+ (void)setRoundCorner_BorderLayer:(CALayer *)layer cornerRadius:(float)radius borderWidth:(float)borderWidth borderColor:(UIColor *)borderColor maskToBounds:(BOOL)maskToBounds{
    layer.cornerRadius = radius;
    layer.borderWidth = borderWidth;
    layer.borderColor = borderColor.CGColor;
    layer.masksToBounds = maskToBounds;
    return;
}


+ (void)setShoadow_ShadowColorLayer:(CALayer *)layer shadowOffSetCGSizeMake:(CGSize)offSetSize shadowRadius:(float)radius shadowColor:(UIColor *)color shadowOpacity:(float)opacity maskToBounds:(BOOL)maskToBounds{
    layer.shadowOffset = offSetSize;
    layer.shadowRadius = radius;
    layer.shadowColor = color.CGColor;
    layer.shadowOpacity = opacity;
    layer.masksToBounds = maskToBounds;
    layer.shadowPath = [UIBezierPath bezierPathWithRect:layer.bounds].CGPath;
    return;
}


+ (void)resetNSUserDefaultsStandardUserDefaults{
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}


+ (BOOL)isPoint:(CGPoint)point insideOfRect:(CGRect)rect{
    if ( CGRectContainsPoint(rect,point)){
        return  YES;// inside
    }
    else{
        return  NO;// outside
    }
}


+ (NSDate *)getDateAfterORBeforePeriodFromOriginalDate:(NSDate *)dateOriginal period:(NSInteger)intPeriod{
    //Select Year, Month, Day, Hour, Minute, Second as per requirement
    
    NSCalendar *calander = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setYear:intPeriod];
    //    [dateComponents setMonth:intPeriod];
    //    [dateComponents setDay:intPeriod];
    //    [dateComponents setHour:intPeriod];
    //    [dateComponents setMinute:intPeriod];
    //    [dateComponents setSecond:intPeriod];
    NSDate *dateAfterDifferanceOfPeriod = [calander dateByAddingComponents:dateComponents toDate:dateOriginal options:0];
    return dateAfterDifferanceOfPeriod;
}


+ (NSDate *)getDateAfterORBeforeDaysFromOriginalDate:(NSDate *)dateOriginal periodInDays:(int)intPeriodInDays{
    NSDate *dateAfterDifferanceOfPeriod = [dateOriginal dateByAddingTimeInterval:60*60*24*intPeriodInDays];
    return dateAfterDifferanceOfPeriod;
}


+ (NSString *)getCurretnViewControllerName_ViewController:(UIViewController *)viewController{
    NSString *stringViewControllerName = NSStringFromClass(viewController.class);
    NSLog(@"%@",stringViewControllerName);
    return stringViewControllerName;
}


+(NSString*)urlEscape:(NSString *)unencodedString {
    NSString *s = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(NULL,
                                                                                        (CFStringRef)unencodedString,
                                                                                        NULL,
                                                                                        (CFStringRef)@"!*'\"();:@&=+$,/?%#[]% ",
                                                                                        kCFStringEncodingUTF8));
    return s; // Due to the 'create rule' we own the above and must autorelease it
}


// Put a query string onto the end of a url
+(NSString*)addQueryStringToUrl:(NSString *)url params:(NSDictionary *)params {
    NSMutableString *urlWithQuerystring = [[NSMutableString alloc] initWithString:url];
    // Convert the params into a query string
    if (params) {
        for(id key in params) {
            NSString *sKey = [key description];
            NSString *sVal = [[params objectForKey:key] description];
            // Do we need to add ?k=v or &k=v ?
            if ([urlWithQuerystring rangeOfString:@"?"].location==NSNotFound) {
                [urlWithQuerystring appendFormat:@"?%@=%@", [Utility_ObjectiveC urlEscape:sKey], [Utility_ObjectiveC urlEscape:sVal]];
            } else {
                [urlWithQuerystring appendFormat:@"&%@=%@", [Utility_ObjectiveC urlEscape:sKey], [Utility_ObjectiveC urlEscape:sVal]];
            }
        }
    }
    return urlWithQuerystring;
}


@end
