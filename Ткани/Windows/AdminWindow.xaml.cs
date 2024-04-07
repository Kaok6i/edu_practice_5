using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Metadata.W3cXsd2001;
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
using Ткани.Windows;

namespace Ткани
{
    /// <summary>
    /// Логика взаимодействия для AdminWindow.xaml
    /// </summary>
    public partial class AdminWindow : Window
    {
        TradeEntities entity = new TradeEntities();
        User newUser;
        public AdminWindow(User user)
        {
            InitializeComponent();
            BaseProduct.ItemsSource = entity.Product.ToList();
            cbFiltering.ItemsSource = entity.ProductManufactures.Select(x => x.Name).ToList();
            newUser = user;
        }

        private void backButton_Click(object sender, RoutedEventArgs e)
        {
            var mainWndw = new MainWindow();
            mainWndw.Show();
            this.Close();
        }
        /// <summary>
        /// Сортировка
        /// </summary>
        /// <param name="product"></param>
        /// <returns></returns>
        private Product[] SortProduct(Product[] product)
        {
            try
            {
                if (cbSorting.SelectedIndex == 0)
                    product = product.ToArray();
                if (cbSorting.SelectedIndex == 1)
                    product = product.OrderBy(c => c.ProductCost).ToArray();//по возрастанию
                if (cbSorting.SelectedIndex == 2)
                    product = product.
                        OrderByDescending(c => c.ProductCost).ToArray();//по убыванию
            }
            catch { }
            return product;
        }
/// <summary>
/// Фильтрация
/// </summary>
/// <param name="product"></param>
/// <returns></returns>
        private Product[] FilterProduct(Product[] product)
        {
            try
            {
                if (cbFiltering.SelectedIndex == 0)
                    product = product.ToArray();
                if (cbFiltering.SelectedIndex == 1)
                    product = product.Where(c => c.ProductManufactures
                    .Name == "БТК Текстиль").ToArray();
                if (cbFiltering.SelectedIndex == 2)
                    product = product.Where(c => c.ProductManufactures
                    .Name == "Империя ткани").ToArray();
                if (cbFiltering.SelectedIndex == 3)
                    product = product.Where(c => c.ProductManufactures
                    .Name == "Комильфо").ToArray();
                if (cbFiltering.SelectedIndex == 4)
                    product = product.Where(c => c.ProductManufactures
                    .Name == "Май Фабрик").ToArray();
            }
            catch { }
            return product;
        }
        private Product[] SearchProduct(Product[] product)//поиск
        {
            try
            {
                if (tbSearch.Text != null)
                {
                    product = product.Where(c => c.ProductName.ToLower().
                    Contains(tbSearch.Text.ToLower()) |
                    c.ProductArticleNumber.ToLower().
                    Contains(tbSearch.Text.ToLower()) |
                     c.ProductDescription.ToLower().
                    Contains(tbSearch.Text.ToLower()) |
                     c.ProductManufactures.Name.ToLower().
                    Contains(tbSearch.Text.ToLower())).ToArray();
                }
                if (product.Length == 0)
                {
                    BaseProduct.ItemsSource = product;
                    MessageBox.Show("Товаров с таким данными не найдено");
                }
            }
            catch { }

            return product;
        }
        private Product[] products;
        private int totalCount;
        private int currentCount;
        /// <summary>
        /// Метод для вывода данных 
        /// </summary>
        private void RefreshData()
        {

            products = entity.Product.ToArray();
            products = SortProduct(products);
            products = FilterProduct(products);
            products = SearchProduct(products);
            BaseProduct.ItemsSource = products.ToList();
            totalCount = entity.Product.Count();
            currentCount = products.Count();

        }
        private void cbFiltering_SelectionChanged(object sender, SelectionChangedEventArgs e)//Фильтрация
        {
            RefreshData();
        }

        private void cbSorting_SelectionChanged(object sender, SelectionChangedEventArgs e)//Сортировка
        {
            RefreshData();
        }

        private void Search_SelectionChanged(object sender, RoutedEventArgs e)//Поиск
        {
            RefreshData();
        }

        private void Delete_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                var row = BaseProduct.SelectedItem as Product;
                if (row == null)
                {
                    MessageBox.Show("Выберите строку для удаления!");
                }
                else
                {
                    MessageBoxResult result = MessageBox.Show("Вы уверены что хотите удалить данную строку?", "Удаление!", MessageBoxButton.YesNo, MessageBoxImage.Question);
                    if (result == MessageBoxResult.Yes)
                    {
                        entity.Product.Remove(row);
                        entity.SaveChanges();
                        AdminWindow administrator = new AdminWindow(null);
                        administrator.Show();
                        this.Close();
                    }
                }
            }
            catch { }
        }

        private void Edit_Click(object sender, RoutedEventArgs e)
        {
            var row = BaseProduct.SelectedItem as Product;
            if (row == null)
            {
                MessageBox.Show("Выберите строку для изменения");
            }
            else
            {
                AddChangeProductWindow editProduct = new AddChangeProductWindow(row);
                editProduct.Show();
                this.Close();
            }
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            AddChangeProductWindow addProduct = new AddChangeProductWindow(null);
            addProduct.Show();
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            fioTB.Text = $"{newUser.UserSurname} " + $"{newUser.UserName} " + $"{newUser.UserPatronymic}";
        }
    }
}
