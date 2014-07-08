//
//  HPViewController.m
//  HPTextViewTapGestureRecognizerDemo
//
//  Created by Hermes Pique on 7/8/14.
//  Copyright (c) 2014 Hermes Pique. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//   http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "HPViewController.h"
#import "HPTextViewTapGestureRecognizer.h"

@interface HPViewController ()<HPTextViewTapGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet HPTextViewTapGestureRecognizer *textViewTapGestureRecognizer;

@end

@implementation HPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView.editable = NO; // Not required. Used to simplify the example interaction.
    self.textViewTapGestureRecognizer.delegate = self; // This can also be done in Interface Builder. Done here just to be explicit .

    self.textView.attributedText = [self sampleAttributedString];
}

#pragma mark HPTextViewTapGestureRecognizerDelegate

-(void)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer handleTapOnURL:(NSURL*)URL inRange:(NSRange)characterRange
{
    [[UIApplication sharedApplication] openURL:URL];
}

-(void)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer handleTapOnTextAttachment:(NSTextAttachment*)textAttachment inRange:(NSRange)characterRange
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:NSLocalizedString(@"Woof!", @"") delegate:nil cancelButtonTitle:NSLocalizedString(@"OK", @"") otherButtonTitles:nil];
    [alertView show];
}

#pragma mark Utils

- (NSAttributedString*)sampleAttributedString
{
    NSMutableAttributedString *attributedText = [NSMutableAttributedString new];
    [attributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@"This is "]];
    [attributedText appendAttributedString:[self attributedLinkWithText:@"HPTextViewTapGestureRecognizer" URLString:@"https://github.com/hpique/HPTextViewTapGestureRecognizer"]];
    [attributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@" by "]];
    [attributedText appendAttributedString:[self attributedLinkWithText:@"@hpique" URLString:@"https://github.com/hpique"]];
    [attributedText appendAttributedString:[[NSAttributedString alloc] initWithString:@". It can detect taps on links and attachments.\n\nHere's a picture of a chihuahua:\n\n"]];
    NSTextAttachment *textAttachment = [NSTextAttachment new];
    textAttachment.image = [UIImage imageNamed:@"chihuahua.jpg"];
    [attributedText appendAttributedString:[NSAttributedString attributedStringWithAttachment:textAttachment]];
    return attributedText;
}

- (NSAttributedString*)attributedLinkWithText:(NSString*)text URLString:(NSString*)URLString
{
    NSURL *URL = [NSURL URLWithString:URLString];
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text attributes:@{NSLinkAttributeName : URL}];
    return attributedString;
}

@end
