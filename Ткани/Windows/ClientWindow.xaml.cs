using System;
using System.Collections.Generic;
using System.Linq;
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

namespace Ткани
{
    /// <summary>
    /// Логика взаимодействия для ClientWindow.xaml
    /// </summary>
    public partial class ClientWindow : Window
    {
        TradeEntities entity = new TradeEntities();
        User newUser;
        public ClientWindow(User user)
        {
            InitializeComponent();
            BaseProduct.ItemsSource = entity.Product.ToList();
            newUser = user;
        }

        private void backButton_Click(object sender, RoutedEventArgs e)
        {
            var mainWndw = new MainWindow();
            mainWndw.Show();
            this.Close();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            fioTB.Text = $"{newUser.UserSurname} " + $"{newUser.UserName} " + $"{newUser.UserPatronymic}";
        }
    }
}
