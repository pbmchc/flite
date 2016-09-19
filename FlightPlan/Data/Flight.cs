using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlightPlan.Data
{
    class Flight
    {
        private string _code;
        private string _company;
        private string _time;
        private string _plane;
        private Pilot[] _pilots;
        private List<Flitepoint> _points;

        public string Code
        {
            get { return _code; }
            set { _code = value; }
        }
        public string Company
        {
            get { return _company; }
            set { _company = value; }
        }
        public string Time
        {
            get { return _time; }
            set { _time = value; }
        }
        public string Plane
        {
            get { return _plane; }
            set { _plane = value; }
        }

        public Pilot[] Pilots
        {
            get { return _pilots; }
            set { _pilots = value; }
        }
        public List<Flitepoint> Points
        {
            get { return _points; }
            set { _points = value; }
        }
    }
}
