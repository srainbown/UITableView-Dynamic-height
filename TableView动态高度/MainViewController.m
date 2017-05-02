//
//  MainViewController.m
//  TableView动态高度
//
//  Created by 李自杨 on 2017/4/26.
//  Copyright © 2017年 View. All rights reserved.
//

#import "MainViewController.h"
#import "MainTableViewCell.h"


@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"动态高度";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self getData];
    
    [self createTableView];
    
}

#pragma mark -- 懒加载
-(NSMutableArray *)dataArray{

    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

-(void)getData{

    [self.dataArray addObject:@"三国演义"];
    
    [self.dataArray addObject:@"《三国演义》是中国古典四大名著之一，是中国第一部长篇章回体历史演义小说，全名为《三国志通俗演义》（又称《三国志演义》），作者是元末明初的著名小说家罗贯中。"];
    
    [self.dataArray addObject:@"《三国演义》描写了从东汉末年到西晋初年之间近105年的历史风云，以描写战争为主，诉说了东汉末年的群雄割据混战和汉、魏、吴三国之间的政治和军事斗争，最终司马炎一统三国，建立晋朝的故事。反映了三国时代各类社会斗争与矛盾的转化，并概括了这一时代的历史巨变，塑造了一批叱咤风云的三国英雄人物。"];
    
    [self.dataArray addObject:@"全书可大致分为黄巾之乱、董卓之乱、群雄逐鹿、三国鼎立、三国归晋五大部分。在广阔的背景上，上演了一幕幕气势磅礴的战争场面。编者罗贯中将兵法三十六计融于字里行间，既有情节，也有兵法韬略。"];
    
    [self.dataArray addObject:@"刘备（公元161年－公元223年6月10日），字玄德，东汉末年幽州涿郡涿县（今河北省涿州市）人，西汉中山靖王刘胜的后代，三国时期汉开国皇帝，政治家，史家又称他为先主。刘备少年与公孙瓒拜卢植为师求学，而后参与镇压黄巾起义。与关羽、张飞先后救援过北海孔融、徐州陶谦等。陶谦病亡后将徐州让与刘备。刘备早期颠沛流离，投靠过多个诸侯，后于赤壁之战与孙权联盟击败曹操，趁势夺取荆州，而后进取益州，建立季汉政权。陈寿评刘备机权干略不及曹操，但其弘毅宽厚，知人待士，百折不挠，终成帝业。刘备自己也曾说过，自己做事“每与操反，事乃成尔”。公元221年，刘备在成都称帝，国号汉，年号章武，占有今四川、云南大部，贵州全部，陕西汉中和甘肃白龙江一部分。为替关张二人复仇发兵出击东吴，被陆逊在夷陵火烧连营，因此惨败使蜀汉元气大伤。公元223年，刘备病逝于白帝城，终年63岁，谥号昭烈皇帝，庙号烈祖（一说太宗），葬惠陵。后世有众多文艺作品以其为主角，在成都武侯祠有昭烈庙为纪念"];
    
    [self.dataArray addObject:@"诸葛亮（181年－234年10月8日），字孔明，号卧龙（也作伏龙），汉族，徐州琅琊阳都（今山东临沂市沂南县）人，三国时期大汉丞相，杰出的政治家、军事家、散文家、书法家、发明家。在世时被封为武乡侯，死后追谥忠武侯，东晋政权因其军事才能特追封他为武兴王。其散文代表作有《出师表》、《诫子书》等。曾发明木牛流马、孔明灯等，并改造连弩，叫做诸葛连弩，可一弩十矢俱发。于建兴十二年（234年）在五丈原（今宝鸡岐山境内）逝世。刘禅追谥其为忠武侯，故后世常以武侯、诸葛武侯尊称诸葛亮。诸葛亮一生“鞠躬尽瘁、死而后已”，是中国传统文化中忠臣与智者的代表人物。"];
    
    [self.dataArray addObject:@"孙权（公元182年－公元252年5月21日），字仲谋，吴郡富春（今浙江富阳）人，生于下邳（今江苏徐州市邳州）。三国时代东吴的建立者。其父孙坚，自称为春秋时大军事家孙武之后。其兄孙策遇害后，孙权承父兄之业，保有江东，成为一方诸侯。曹操表权为讨虏将军，领会稽太守。孙权先后两次出兵镇抚了山越，稳定了江东六郡的局势。公元208年，率大军亲征黄祖，夺得江陵，复与刘备联合，获得赤壁之战的胜利。公元221年，刘备为报关羽之仇，亲率大军伐吴。孙权一方面以陆逊为大都督迎战，一面向魏文帝曹丕称臣，被曹丕拜为吴王，次年三月大破汉军。公元252年病逝。作者罗贯中通过一系列生动的事例,给读者塑造出一位外表独特、胆识过人、治国有法、治军有方的政治家和军事家的形象。"];
    
    [self.dataArray addObject:@"曹操（公元155年－公元220年3月15日[9]  ），字孟德，一名吉利，小名阿瞒，沛国谯县（今安徽亳州）人，汉族。东汉末年杰出的政治家、军事家、文学家、书法家，三国中曹魏政权的缔造者。黄巾军起义爆发时，任骑都尉，参加剿除黄巾军。从建安二年到十六年（197-211年），先后用兵打败吕布、袁术、袁绍等豪强，统一北方。曾在赤壁被周瑜、诸葛亮用火攻战败。建安二十一年，受封为魏王，四年后，病死于洛阳。形象上是一个既凶残奸诈又有雄才大略的政治野心家和军事家的艺术典型。但小说在揭露和批判他的恶德的同时，又充分表现了他作为一个奸雄的才智与胆略，他具有卓然超越于董卓、袁绍等人之上的政治远见和政治气度。他深通兵法，善于用兵，施谋用策，以弱胜强，先后消灭了除刘备、孙权以外的大小军阀，统一了大半个中国。人生信条是“宁教我负天下人，休教天下人负我。”"];
    
    [self.tableView reloadData];
}

-(void)createTableView{
    
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    self.tableView.estimatedRowHeight = 100;
    //    self.tableView.rowHeight = UITableViewAutomaticDimension;
    //    PS：iOS 8系统中rowHeight的默认值已经设置成了UITableViewAutomaticDimension，所以第二行代码可以省略。
    
    
    //隐藏因为数据少不能满足一屏时下面的现实的空白cell
    UIView *footView = [[UIView alloc]init];
    self.tableView.tableFooterView = footView;
    
}

#pragma mark -- UITableViewDelegate, UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return self.tableView.rowHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellID";
    
    MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (cell == nil) {
        cell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    //cell数据赋值
    [cell setData:_dataArray[indexPath.row]];
    
    return cell;
}


@end
