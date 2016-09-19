using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlightPlan.Data
{
    class Flitepoint
    {
        private int _id;
        private string _name;
        private double _longitude;
        private double _latitude;
        private double _frequency;
        private int _height;
        private string _time;
        private string _remainingTime;

        public int Id
        {
            get { return _id; }
            set { _id = value; }
        }
        public string Name
        {
            get { return _name; }
            set { _name = value; }
        }
        public double Latitude
        {
            get { return _latitude; }
            set { _latitude = value; }
        }
        public double Longitude
        {
            get { return _longitude; }
            set { _longitude = value; }
        }
        public double Frequency
        {
            get { return _frequency; }
            set { _frequency= value; }
        }
        public int Height
        {
            get { return _height; }
            set { _height = value; }
        }
        public string Time
        {
            get { return _time; }
            set { _time = value; }
        }
        public string RemainingTime
        {
            get { return _remainingTime; }
            set { _remainingTime = value; }
        }
    }
}
