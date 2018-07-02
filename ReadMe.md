工程说明：

1. 视图ContentHugging 与 ContentCompression两个约束，优先级分别是250,750。相比压缩视图更容易拉伸。因此视图在做自适应大小，只要在需要自适应大小方向，子视图做连续约束即可。
2. intrinsicContentSize 视图固有大小，多用包含容器视图的视图大小自适应（比如UIScrollView、UITableview、UICollectionView)。contentView无法做父视图的约束时，使用。步骤为：(1)复写视图intrinsicContentSize方法 (2)调用invalidateIntrinsicContentSize方法，让系统在下个更新周期，重新布局视图。
3. cell类视图自适应。systemLayoutSizeFittingSize 使用方法和intrinsicContentSize 方法类似，多用于Cell这类有复用机制的视图自适应。
4. preferredMaxLayoutWidth (UILable)属性，使lable视图的自适应方式更加灵活。