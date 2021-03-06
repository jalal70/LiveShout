//  Copyright (c) 2010 Ecliptic Labs
//  
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//  
//  http://www.apache.org/licenses/LICENSE-2.0
//  
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//  
//  
//  ELTextFieldTableViewCell.m
//  ELTextFieldCellExample
//
//  Created by Chris McClelland on 17/03/2010.
//  Copyright 2010 Ecliptic Labs. All rights reserved.
//
//  Simple Example of a text field 

#import "ELTextFieldTableViewCell.h"

#define xSpacing 10

@implementation ELTextFieldTableViewCell

@synthesize textField, textLabelWidth, editEnabled;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleDefault // note that it's forced to use UITableViewCellStyleSubtitle
					reuseIdentifier:reuseIdentifier]) { 
		
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		
        textField = [[UITextField alloc] initWithFrame:CGRectZero];
		textField.clearsOnBeginEditing = NO;
		textField.clearButtonMode = UITextFieldViewModeWhileEditing;
		textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
		textField.font = [UIFont systemFontOfSize:15.0f];
		textField.adjustsFontSizeToFitWidth = YES;
		
		textField.backgroundColor = [UIColor clearColor];
		
		self.textLabel.textColor = [UIColor colorWithWhite:0.1 alpha:1.0];
		[self.contentView insertSubview:textField atIndex:5];    
		
		self.contentView.backgroundColor  = [UIColor clearColor];
		self.textLabel.font = [UIFont systemFontOfSize:15.0f];
		self.textLabel.textColor = [UIColor colorWithWhite:0.2 alpha:1.0];
		self.textLabel.backgroundColor = [UIColor clearColor];
		self.editEnabled = YES;
	}
    return self;
}


- (void)layoutSubviews {
	
	
	CGSize sizeToMakeLabel = [self.textLabel.text sizeWithFont:self.textLabel.font]; 
	self.textLabel.frame = CGRectMake(self.textLabel.frame.origin.x, self.textLabel.frame.origin.y, 
							 sizeToMakeLabel.width, sizeToMakeLabel.height); 
	
	
	//self.backgroundColor = [UIColor redColor];
	// DebugLog(@"textField %@", [self subviews]);
	if (self.textLabel.text) {
		
		//textField.frame = CGRectMake(CGRectGetMaxX(self.textLabel.frame)+xSpacing, 0, self.frame.size.width - CGRectGetMaxX(self.textLabel.frame)- (xSpacing * 2), self.contentView.frame.size.height) ;
		
		//DebugLog(@"textLabel %d", self.contentView.frame.size.width - CGRectGetMaxX(self.textLabel.frame) - (xSpacing * 2));
		// textField.frame = CGRectMake(0, 0, self.frame.size.width, self.contentView.frame.size.height);
		textField.frame = CGRectMake(sizeToMakeLabel.width + (xSpacing * 2), 0, 
									 self.contentView.frame.size.width - sizeToMakeLabel.width - (xSpacing * 4) , 
									 self.contentView.frame.size.height);
	} else {
	//	textField.frame = CGRectMake(xSpacing, 0, self.contentView.frame.size.width - (xSpacing * 2), self.contentView.frame.size.height);
	}
	[super layoutSubviews];
}


- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
	
	if (!editEnabled){
		self.textField.enabled = editing;
	}
	

}

- (void)dealloc {
	[textField release];
    [super dealloc];
}


@end
