using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Ткани.DataBase;

namespace Ткани.Windows
{
    /// <summary>
    /// Логика взаимодействия для AddChangeProductWindow.xaml
    /// </summary>
    public partial class AddChangeProductWindow : Window
    {
       TradeEntities entity = new TradeEntities();
        Product newProduct;
        public AddChangeProductWindow(Product product)
        {
            InitializeComponent();
            newProduct = product;
            
        }
        string identity;
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            if (newProduct != null )
            {

            }
            cbCategory.ItemsSource = entity.ProductCategories.Select(x => x.Name).ToList();
            cbManufacturer.ItemsSource = entity.ProductManufactures.Select(x => x.Name).ToList();
            cbUnitOfMeasurement.ItemsSource = entity.ProductCategories.Select(x => x.Name).ToList();
            cbSupplier.ItemsSource = entity.ProductCategories.Select(x => x.Name).ToList();
            
            this.DataContext = newProduct;
            identity = newProduct.ProductArticleNumber;
            List<Product> products = entity.Product.Where(x => x.ProductArticleNumber == identity).ToList();
        }

        private void saveBttn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (tbArticle.Text == "" | tbName.Text == "" | tbDescription.Text == "" | cbCategory.Text == "" | cbManufacturer.Text == ""
                    | tbCost.Text == "" | tbDescription.Text == "" | tbQuantityInStock.Text == "" | cbUnitOfMeasurement.Text == "" | tbMaxDiscount.Text == "")
                {
                    MessageBox.Show("Заполните все поля!");
                }
                else
                {
                    int categoryID = entity.ProductCategories.Where(x => x.Name == cbCategory.Text).Select(x => x.ID).FirstOrDefault();
                    int manufacturerID = entity.ProductManufactures.Where(x => x.Name == cbManufacturer.Text).Select(x => x.ID).FirstOrDefault();
                    int unitOfMeasurementID = entity.ProductMeasures.Where(x => x.Name == cbUnitOfMeasurement.Text).Select(x => x.ID).FirstOrDefault();
                    int suppliersID = entity.ProductSuppliers.Where(x => x.Name== cbSupplier.Text).Select(x => x.ID).FirstOrDefault();
                    if (newProduct != null) 
                    {
                        List<Product> products = entity.Product.Where(x => x.ProductArticleNumber == identity).ToList();
                        try
                        {
                            products[0].ProductArticleNumber = tbArticle.Text;
                            products[0].ProductName = tbName.Text;
                            products[0].ProductDescription = tbDescription.Text;
                            products[0].ProductCategory = categoryID;
                            products[0].ProductManufacturer = manufacturerID;
                            products[0].ProductCost = Convert.ToDecimal(tbCost.Text);
                            products[0].ProductRealDiscountAmount = (byte)Convert.ToInt32(tbDiscount.Text);
                            products[0].ProductQuantityInStock = Convert.ToInt32(tbQuantityInStock.Text);
                            products[0].ProductMeasure = unitOfMeasurementID;
                            products[0].ProductDiscountAmountMax = (byte)Convert.ToInt32(tbMaxDiscount.Text);
                            products[0].ProductSupplier = suppliersID;
                        }
                        catch { }                    
                        entity.Product.AddOrUpdate();
                        entity.SaveChanges();
                        MessageBox.Show("Данные успешно изменены!");
                        
                    }
                    else
                {

                    Product product = new Product()
                    {
                        ProductArticleNumber = tbArticle.Text,
                        ProductName = tbName.Text,
                        ProductDescription = tbDescription.Text,
                        ProductCategory = categoryID,
                        ProductManufacturer = manufacturerID,
                        ProductCost = Convert.ToDecimal(tbCost.Text),
                        ProductRealDiscountAmount = (byte)Convert.ToInt32(tbDiscount.Text),
                        ProductQuantityInStock = Convert.ToInt32(tbQuantityInStock.Text),
                        ProductMeasure = unitOfMeasurementID,
                        ProductDiscountAmountMax = (byte)Convert.ToInt32(tbMaxDiscount.Text),
                        ProductSupplier = suppliersID
                    };
                    entity.Product.Add(product);
                   entity.SaveChanges();
                    MessageBox.Show("Данные успешно добавлены!");
                    
                }
                AdminWindow administrator = new AdminWindow(null);
                    administrator.Show();
                    this.Close();
                }
            }
            catch
            {
                MessageBox.Show("Одна из строк имела неверный формат!");
            }
        }

        private void Exit_Click(object sender, RoutedEventArgs e)
        {
            AdminWindow administrator = new AdminWindow(null);
            administrator.Show();
            this.Close();
        }
    }
}
