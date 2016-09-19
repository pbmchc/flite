using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
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
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Xml;
using System.Xml.Linq;
using System.Windows.Forms;
using FlightPlan.Data;
using Newtonsoft.Json;

namespace FlightPlan
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {


        Uri uri;
        System.Windows.Forms.WebBrowser map_window;
        public MainWindow()
        {
            
            InitializeComponent();
          
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            //Windows.Forms
            System.Windows.Forms.Integration.WindowsFormsHost host =
                new System.Windows.Forms.Integration.WindowsFormsHost();

            map_window = new System.Windows.Forms.WebBrowser();

            host.Child = map_window;
 
            this.map_grid.Children.Add(host);

            uri = new Uri(AppDomain.CurrentDomain.BaseDirectory + "Map/Map.html");
            map_window.Navigate(uri);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            System.Globalization.CultureInfo customCulture = (System.Globalization.CultureInfo)System.Threading.Thread.CurrentThread.CurrentCulture.Clone();
            customCulture.NumberFormat.NumberDecimalSeparator = ".";

            System.Threading.Thread.CurrentThread.CurrentCulture = customCulture;
            
            //File Dialog
            Microsoft.Win32.OpenFileDialog ofd = new Microsoft.Win32.OpenFileDialog();
            if (ofd.ShowDialog() == true)
            {
                XmlDocument doc = new XmlDocument();
                doc.Load(ofd.FileName);
                file_name.Text = ofd.SafeFileName.ToString();

                /*With Namespace
                XmlNamespaceManager nsmgr = new XmlNamespaceManager(doc.NameTable);
                nsmgr.AddNamespace("ns", "http://www.w3schools.com");
                XmlNodeList nodes = doc.SelectNodes("//ns:Wspolrzedne, nsmgr");
                XmlNodeList names = doc.SelectNodes("//ns:NazwaPunktu, nsmgr");
                 * */

                XmlNodeList nodes = doc.SelectNodes("//Wspolrzedne");
                XmlNodeList names = doc.SelectNodes("//NazwaPunktu");
                XmlNodeList height = doc.SelectNodes("//Wysokosc");
                XmlNodeList frequency = doc.SelectNodes("//CzestotliwoscRadiowa");
                XmlNodeList passedTime = doc.SelectNodes("//AktualnyCzasLotu");
                XmlNodeList remainingTime = doc.SelectNodes("//PozostalyCzasLotu");
                XmlNode code = doc.SelectSingleNode("//KodLotu");
                XmlNode company = doc.SelectSingleNode("//NazwaPrzewoznika");
                XmlNode time = doc.SelectSingleNode("//CzasTrwania");
                XmlNode plane = doc.SelectSingleNode("//ModelSamolotu");
                XmlNodeList pilots = doc.SelectNodes("//ImieNazwisko");


                 Pilot[] crew = new Pilot[2];
                 List<Flitepoint> flitepoints = new List<Flitepoint>();
               
                for (int i=0; i<nodes.Count; i++)
                {
                    Flitepoint flitePoint = new Flitepoint();

                    string lat_sec = nodes[i].Attributes["latitude"].Value;
                    double lat_dbl = Convert.ToDouble(lat_sec);

                    string lon_sec = nodes[i].Attributes["longitude"].Value;
                    double lon_dbl = System.Convert.ToDouble(lon_sec);

                    flitePoint.Latitude = lat_dbl;
                    flitePoint.Longitude = lon_dbl;
                    flitePoint.Name = names[i].InnerText;
                    flitePoint.Height = int.Parse(height[i].InnerText);
                    flitePoint.Frequency = double.Parse(frequency[i].InnerText);
                    flitePoint.Time = passedTime[i].InnerText;
                    flitePoint.RemainingTime = remainingTime[i].InnerText;
                    flitepoints.Add(flitePoint);
                }

                for (int i=0; i<pilots.Count; i++)
                {
                    Pilot p = new Pilot();
                    p.FullName = pilots[i].InnerText;
                    crew[i] = p;
                }

                Flight flight = new Flight();
                flight.Plane = plane.InnerText;
                flight.Code = code.InnerText;
                flight.Company = company.InnerText;
                flight.Time = time.InnerText;
                flight.Pilots= crew;
                flight.Points = flitepoints;

                var json = JsonConvert.SerializeObject(flight);

                object[] arguments = new object[1];
                arguments[0] = json;                     
                HtmlDocument map = map_window.Document;
               
                map.InvokeScript("initialize", arguments);
                      
            }        

        }

    }
}
