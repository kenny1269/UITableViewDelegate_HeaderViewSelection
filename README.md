# UITableViewDelegate_HeaderViewSelection
Extension for the UITableView that allows a user to select the headerView of tableView and call back, can be used to make a foldable tableView.

# Getting start
- include `UITableView+HeaderView` category and `UITableViewDelegate_HeaderViewSelection` protocol.
- UITableView's delegate should implement the `UITableViewDelegate_HeaderViewSelection` protocol.
- when implementing the method `tableView:viewForHeaderInSection:`, call the category method `headerView:forSection` using the returning headerView as the parameter.

# How it works
It works because a tapGestureRecognizer is added to the headerView, so the headerView can send callback when selection occurs.

# How to make a foldable tableview
In the headerView selection callback method `tableView:didSelectHeaderView:inSection:` and `tableView:didSelectHeaderView:inSection:`, refresh the section in where the headerView lays, returning the corresponding number of row of the section, done!

it works like:
![](https://raw.githubusercontent.com/kenny1269/UITableViewDelegate_HeaderViewSelection/master/gif.gif)
