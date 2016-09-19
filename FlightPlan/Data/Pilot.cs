using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FlightPlan.Data
{
    class Pilot
    {
        private string _fullName;
        private string _hours;
        private string _position;

        public string FullName
        {
            get { return _fullName; }
            set { _fullName = value; }
        }
        public string Hours
        {
            get { return _hours; }
            set { _hours = value; }
        }
        public string Position
        {
            get { return _position; }
            set { _position = value; }
        }
    }
}
