//
//  IOSPanDianChoDetailVC.m
//  FindMe
//
//  Created by mac on 2021/5/21.
//

#import "IOSPanDianChoDetailVC.h"
#import "IOSGodsHisTBCell.h"
#import "IOSGodsHisModel.h"
@interface IOSPanDianChoDetailVC ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation IOSPanDianChoDetailVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];

}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, KDeviceWith, KDeviceHeight-KEVNScreenTopStatusNaviHeight-KEVNScreenTabBarSafeBottomMargin-50) style:UITableViewStylePlain];
        _tableView.delegate = self;
        [_tableView registerNib:[UINib nibWithNibName:@"IOSGodsHisTBCell" bundle:nil] forCellReuseIdentifier:@"IOSGodsHisTBCell"];
        _tableView.dataSource = self;
        //刷新
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
        _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
    }
    return _tableView;
}
- (void)loadNewData {

}
//加载更多
- (void)loadMoreData {
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    IOSGodsHisTBCell *cell = [tableView dequeueReusableCellWithIdentifier:@"IOSGodsHisTBCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    IOSGodsHisModel *model;
    cell.hisModel = model;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    //第二组可以左滑删除
    if (indexPath.section == 1) {
        return YES;
    }
    
    return NO;
}
 
// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}
 
// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        if (indexPath.section == 1) {
            
           
            
        }
    }
}

@end
