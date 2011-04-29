#import "UIColor+String.h"

@implementation UIColor (Hex)

+ (UIColor *) colorWithString:(NSString *)hex
{
   NSScanner *scanner = [NSScanner scannerWithString:hex];
   [scanner setCharactersToBeSkipped:[NSCharacterSet
                                      characterSetWithCharactersInString:@"#"]];
   unsigned int rgb;
   assert([scanner scanHexInt:&rgb]);
   return [UIColor colorWithHex:rgb];
}

+ (UIColor *) colorWithHex:(int)hex
{
   UIColor *color = [[[UIColor alloc] initWithRed:((float)((hex & 0xFF0000) >> 16))/255.0
                                            green:((float)((hex & 0xFF00) >> 8))/255.0
                                             blue:((float)(hex & 0xFF))/255.0
                                            alpha:1.0] autorelease];

   return color;
}

@end

