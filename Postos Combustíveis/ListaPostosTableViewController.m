//
//  ListaPostosTableViewController.m
//  Postos Combustíveis
//
//  Created by Fabricio on 15/11/16.
//  Copyright © 2016 Fabricio. All rights reserved.
//


#import "ListaPostosTableViewController.h"
#import "ViewController.h"
#import "Posto.h"

@interface ListaPostosTableViewController ()

@end

@implementation ListaPostosTableViewController

-(ListaPostosTableViewController *) init {
    
    self = [super init];
    
    if (self) {

    UIBarButtonItem *botaoAdd = [[UIBarButtonItem alloc] initWithBarButtonSystemItem: UIBarButtonSystemItemAdd target:self action:@selector(exibeFormulario)];
    
    self.navigationItem.rightBarButtonItem = botaoAdd;
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.navigationItem.title = @"Postos de Combustíveis";
    self.dao = [PostoDAO postoDaoInstance];

        
    }
    return self;
}
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete){
        
        Posto *posto = [self.dao postoIndice:indexPath.row];
        
        [self.dao removePosto: posto];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationFade];
        
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}
#pragma mark - Table view data source

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.dao total];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *identificador = @"Celula";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:identificador];
    
    if (!cell){
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identificador];
    }
    Posto *posto = [self.dao postoIndice :indexPath.row];
    cell.textLabel.text = posto.nome_posto;
    
    return cell;
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.postoSelecionado = [self.dao postoIndice:indexPath.row];
    [self exibeFormulario];
}

-(void) exibeFormulario {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController *form = [storyboard instantiateViewControllerWithIdentifier:@"FormPosto"];
    
    if (self.postoSelecionado){
        form.posto = self.postoSelecionado;
    }
    
    self.postoSelecionado = nil;
    
    [self.navigationController pushViewController:form animated:YES];
    
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
