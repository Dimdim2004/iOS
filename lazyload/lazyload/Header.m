//
//  Header.m
//  lazyload
//
//  Created by wjc on 2024/8/29.
//

#import "Header.h"
#import "Masonry.h"
@implementation Header

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        [self setupViews];
    }
    return self;
}

- (void)setupViews {
    self.contentView.backgroundColor = [UIColor purpleColor];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:16];
    self.titleLabel.textColor = [UIColor whiteColor];
    [self.contentView addSubview:self.titleLabel];
    
    self.rowButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.rowButton setImage:[UIImage systemImageNamed:@"chevron.right"] forState:UIControlStateNormal];
    self.rowButton.tintColor = [UIColor darkTextColor];
    [self.contentView addSubview:self.rowButton];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(15);
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView);
    }];
    
    [self.rowButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@30);
        make.height.equalTo(@30);
        make.right.equalTo(self.contentView).offset(-15);
        make.centerY.equalTo(self.contentView);
    }];

}

@end

