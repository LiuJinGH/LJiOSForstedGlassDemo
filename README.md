# iOS毛玻璃效果

这个Demo实现了iOS编程中的毛玻璃效果。

![iOS毛玻璃效果](http://note.youdao.com/yws/api/personal/file/WEB0103d8a0f2e902c4183967cb2e2c07b5?method=download&inline=true&shareKey=dc69bc34e7952405f78963fbc61a3617)

# 实现方法简介

## iOS8 及以后版本

在iOS8中，添加了毛玻璃效果的API，可以直接拿来使用。

承载毛玻璃效果的View
> UIVisualEffectView

毛玻璃效果
> UIBlurEffect


```
//代码示例
    UIImageView *iv = [UIImageView new];
    [self.view addSubview:iv];
    [iv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(UIEdgeInsetsMake(64, 0, 0, 0));
    }];
    
    iv.image = [UIImage imageNamed:@"pic2.jpg"];
    
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    [iv addSubview:effectView];
    [effectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
```

## iOS7 及之前版本

在iOS7及之前的版本是没有上面用到的这两个API的。但在系统内部实际上已经有类似的API实现了，比如在导航栏和工具栏就已经实现了毛玻璃效果。这时，为了实现毛玻璃的效果，可以用到一个取巧的方法：将一个UIToolbar当成一个UIVisualEffectView贴上去

> UIToolbar

```
//代码示例
    UIToolbar *bar = [[UIToolbar alloc] init];
    [iv addSubview:bar];
    [bar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(0);
    }];
    [bar setBarStyle:UIBarStyleBlack];
    bar.translatesAutoresizingMaskIntoConstraints = NO;
```