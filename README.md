HPTextViewTapGestureRecognizer
==============================

[![Version](https://cocoapod-badges.herokuapp.com/v/HPTextViewTapGestureRecognizer/badge.png)](http://cocoadocs.org/docsets/HPTextViewTapGestureRecognizer) [![Platform](https://cocoapod-badges.herokuapp.com/p/HPTextViewTapGestureRecognizer/badge.png)](http://cocoadocs.org/docsets/HPTextViewTapGestureRecognizer) [![Build Status](https://travis-ci.org/hpique/HPTextViewTapGestureRecognizer.png)](https://travis-ci.org/hpique/HPTextViewTapGestureRecognizer) 

A gesture recognizer to detect taps on links and text attachments.

If you're using the most excellent [TTTAttributedLabel](https://github.com/mattt/TTTAttributedLabel) just for the links, you might want to give this a look instead. 

## Installation

Using [CocoaPods](http://cocoapods.org/):

```ruby
pod 'HPTextViewTapGestureRecognizer', '~> 0.1'
```

Or add the files from the [HPTextViewTapGestureRecognizer](https://github.com/hpique/HPTextViewTapGestureRecognizer/tree/master/HPTextViewTapGestureRecognizer) directory if you're doing it manually.

## Usage

Add a `HPTextViewTapGestureRecognizer` to your `UITextView`, set the recognizer delegate and implement the following optional delegate methods as needed:

```objective-c
-(void)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer 
          handleTapOnURL:(NSURL*)URL
                 inRange:(NSRange)characterRange { }

-(void)gestureRecognizer:(UIGestureRecognizer*)gestureRecognizer
handleTapOnTextAttachment:(NSTextAttachment*)textAttachment
                 inRange:(NSRange)characterRange { }
```

## Requirements

HPReorderTableView requires iOS 7.0 or above and ARC. 

## License

 Copyright 2014 Hermes Pique ([@hpique](https://twitter.com/hpique))
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
Here's a picture of a Chihuahua: 
 
[![Chihuahua](https://raw.githubusercontent.com/hpique/HPTextViewTapGestureRecognizer/master/HPTextViewTapGestureRecognizerDemo/chihuahua@2x.jpg)](https://flic.kr/p/adh8TT)

[Chihuahua picture](https://flic.kr/p/adh8TT) &copy; Michael Holden, used under a [CC BY-NC-ND 2.0](https://creativecommons.org/licenses/by-nc-nd/2.0/) license.
